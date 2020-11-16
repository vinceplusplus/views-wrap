import SwiftUI

public struct AlignmentGuidedWrap: View {
  private let content: () -> AnyView
  
  public init<Data, ID, Content>(
    axis: Axis,
    maxLineLength: CGFloat,
    crossSpacing: CGFloat,
    mainSpacing: CGFloat,
    // NOTE: if we use ContentContainer instead of AnyView here, we will encounter "Cannot convert value of type 'some View' to closure result type"
    forEachBuilder: @escaping (@escaping (Content, ID) -> AnyView) -> ForEach<Data, ID, AnyView>
  ) where
    Data: RandomAccessCollection,
    ID: Hashable,
    Content: View
  {
    let maxWidth = maxLineLength
    let hSpacing = crossSpacing
    let vSpacing = mainSpacing
    func getWidth(_ viewDimensions: ViewDimensions) -> CGFloat {
      switch axis {
      case .vertical:
        return viewDimensions.width
      case .horizontal:
        return viewDimensions.height
      }
    }
    func getHeight(_ viewDimensions: ViewDimensions) -> CGFloat {
      switch axis {
      case .vertical:
        return viewDimensions.height
      case .horizontal:
        return viewDimensions.width
      }
    }
    func addAlignmentGuides<V: View>(_ view: V, computeHValue: @escaping (ViewDimensions) -> CGFloat, computeVValue: @escaping (ViewDimensions) -> CGFloat) -> AnyView {
      switch axis {
      case .vertical:
        return AnyView(
          view
            .alignmentGuide(.leading, computeValue: computeHValue)
            .alignmentGuide(.top, computeValue: computeVValue)
        )
      case .horizontal:
        return AnyView(
          view
            .alignmentGuide(.top, computeValue: computeHValue)
            .alignmentGuide(.leading, computeValue: computeVValue)
        )
      }
    }

    self.content = {
      var cachedOffsetPairs = [ID: (CGFloat, CGFloat)]()

      var runningWidth: CGFloat = 0
      var runningHeight: CGFloat = 0
      var runningLineMaxHeight: CGFloat = 0
      
      func computeOffsets(id: ID, viewDimensions: ViewDimensions) -> (CGFloat, CGFloat) {
        if let offsets = cachedOffsetPairs[id] {
          return offsets
        }
        
        let width = getWidth(viewDimensions)
        let advance = width + hSpacing
        if runningWidth + width > maxWidth {
          runningWidth = 0
          runningHeight += vSpacing + runningLineMaxHeight
          runningLineMaxHeight = 0
        }
        let hOffset = -runningWidth
        runningWidth += advance
        runningLineMaxHeight = max(runningLineMaxHeight, getHeight(viewDimensions))
        let vOffset = -runningHeight
        
        let offsets = (hOffset, vOffset)
        cachedOffsetPairs[id] = offsets
        return offsets
      }

      func computeHValue(id: ID, viewDimensions: ViewDimensions) -> CGFloat {
        computeOffsets(id: id, viewDimensions: viewDimensions).0
      }
      
      func computeVValue(id: ID, viewDimensions: ViewDimensions) -> CGFloat {
        computeOffsets(id: id, viewDimensions: viewDimensions).1
      }
      
      return AnyView(
        ZStack(alignment: .topLeading) {
          forEachBuilder { content, id in
            addAlignmentGuides(
              content,
              computeHValue: {computeHValue(id: id, viewDimensions: $0)},
              computeVValue: {computeVValue(id: id, viewDimensions: $0)}
            )
          }
        }
      )
    }
  }
  
  public var body: some View {
    content()
  }
}


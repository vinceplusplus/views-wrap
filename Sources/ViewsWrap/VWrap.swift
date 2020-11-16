import SwiftUI

public struct VWrap: View {
  private let content: () -> AnyView
  
  public init<Data, ID, Content>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    forEachBuilder: @escaping (@escaping (Content, ID) -> AnyView) -> ForEach<Data, ID, AnyView>
  ) where
    Data: RandomAccessCollection,
    ID: Hashable,
    Content: View
  {
    self.content = {
      AnyView(
        AlignmentGuidedWrap(
          axis: .horizontal,
          maxLineLength: maxHeight,
          crossSpacing: vSpacing,
          mainSpacing: hSpacing,
          forEachBuilder: forEachBuilder
        )
      )
    }
  }
  
  public var body: some View {
    content()
  }
}


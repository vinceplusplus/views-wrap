import SwiftUI

public struct HWrap: View {
  private let content: () -> AnyView
  
  public init<Data, ID, Content>(
    maxWidth: CGFloat,
    hSpacing: CGFloat,
    vSpacing: CGFloat,
    forEachBuilder: @escaping (@escaping (Content, ID) -> AnyView) -> ForEach<Data, ID, AnyView>
  ) where
    Data: RandomAccessCollection,
    ID: Hashable,
    Content: View
  {
    self.content = {
      AnyView(
        AlignmentGuidedWrap(
          axis: .vertical,
          maxLineLength: maxWidth,
          crossSpacing: hSpacing,
          mainSpacing: vSpacing,
          forEachBuilder: forEachBuilder
        )
      )
    }
  }
  
  public var body: some View {
    content()
  }
}


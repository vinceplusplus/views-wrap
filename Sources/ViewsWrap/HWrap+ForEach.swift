import SwiftUI

// inits for ForEach
public extension HWrap {
  init<Content>(
    maxWidth: CGFloat,
    hSpacing: CGFloat,
    vSpacing: CGFloat,
    data: Range<Int>,
    @ViewBuilder content: @escaping (Int) -> Content
  ) where
    Content: View
  {
    self.init(maxWidth: maxWidth, hSpacing: hSpacing, vSpacing: vSpacing) { contentContainer in
      ForEach(data) { dataElement in
        contentContainer(content(dataElement), dataElement)
      }
    }
  }
  
  init<Data, Content>(
    maxWidth: CGFloat,
    hSpacing: CGFloat,
    vSpacing: CGFloat,
    data: Data,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) where
    Data: RandomAccessCollection,
    Content: View,
    Data.Element: Identifiable
  {
    self.init(maxWidth: maxWidth, hSpacing: hSpacing, vSpacing: vSpacing) { contentContainer in
      ForEach(data) { dataElement in
        contentContainer(content(dataElement), dataElement.id)
      }
    }
  }
  
  init<Data, ID, Content>(
    maxWidth: CGFloat,
    hSpacing: CGFloat,
    vSpacing: CGFloat,
    data: Data,
    id: KeyPath<Data.Element, ID>,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) where
    Data: RandomAccessCollection,
    ID: Hashable,
    Content: View
  {
    self.init(maxWidth: maxWidth, hSpacing: hSpacing, vSpacing: vSpacing) { contentContainer in
      ForEach(data, id: id) { dataElement in
        contentContainer(content(dataElement), dataElement[keyPath: id])
      }
    }
  }
}


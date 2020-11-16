import SwiftUI

// inits for ForEach
public extension VWrap {
  init<Content>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    data: Range<Int>,
    @ViewBuilder content: @escaping (Int) -> Content
  ) where
    Content: View
  {
    self.init(maxHeight: maxHeight, vSpacing: vSpacing, hSpacing: hSpacing) { contentContainer in
      ForEach(data) { dataElement in
        contentContainer(content(dataElement), dataElement)
      }
    }
  }
  
  init<Data, Content>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    data: Data,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) where
    Data: RandomAccessCollection,
    Content: View,
    Data.Element: Identifiable
  {
    self.init(maxHeight: maxHeight, vSpacing: vSpacing, hSpacing: hSpacing) { contentContainer in
      ForEach(data) { dataElement in
        contentContainer(content(dataElement), dataElement.id)
      }
    }
  }
  
  init<Data, ID, Content>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    data: Data,
    id: KeyPath<Data.Element, ID>,
    @ViewBuilder content: @escaping (Data.Element) -> Content
  ) where
    Data: RandomAccessCollection,
    ID: Hashable,
    Content: View
  {
    self.init(maxHeight: maxHeight, vSpacing: vSpacing, hSpacing: hSpacing) { contentContainer in
      ForEach(data, id: id) { dataElement in
        contentContainer(content(dataElement), dataElement[keyPath: id])
      }
    }
  }
}


import SwiftUI

// inits for @ViewBuilder
public extension VWrap {
  init<C0>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> C0
  ) where
    C0: View
  {
    let c0 = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([c0].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1)>
  ) where
    C0: View, C1: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2)>
  ) where
    C0: View, C1: View, C2: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2, C3>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3)>
  ) where
    C0: View, C1: View, C2: View, C3: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2), E(c.value.3)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2, C3, C4>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4)>
  ) where
    C0: View, C1: View, C2: View, C3: View, C4: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2), E(c.value.3), E(c.value.4)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2, C3, C4, C5>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4, C5)>
  ) where
    C0: View, C1: View, C2: View, C3: View, C4: View, C5: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2), E(c.value.3), E(c.value.4), E(c.value.5)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2, C3, C4, C5, C6>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4, C5, C6)>
  ) where
    C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2), E(c.value.3), E(c.value.4), E(c.value.5), E(c.value.6)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2, C3, C4, C5, C6, C7>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7)>
  ) where
    C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2), E(c.value.3), E(c.value.4), E(c.value.5), E(c.value.6), E(c.value.7)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2, C3, C4, C5, C6, C7, C8>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8)>
  ) where
    C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2), E(c.value.3), E(c.value.4), E(c.value.5), E(c.value.6), E(c.value.7), E(c.value.8)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
  
  init<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(
    maxHeight: CGFloat,
    vSpacing: CGFloat,
    hSpacing: CGFloat,
    @ViewBuilder content: @escaping () -> TupleView<(C0, C1, C2, C3, C4, C5, C6, C7, C8, C9)>
  ) where
    C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View
  {
    typealias E = AnyView
    let c = content()
    self.init(
      maxHeight: maxHeight,
      vSpacing: vSpacing,
      hSpacing: hSpacing,
      data: Array([E(c.value.0), E(c.value.1), E(c.value.2), E(c.value.3), E(c.value.4), E(c.value.5), E(c.value.6), E(c.value.7), E(c.value.8), E(c.value.9)].enumerated()),
      id: \.0,
      content: { $0.1 }
    )
  }
}


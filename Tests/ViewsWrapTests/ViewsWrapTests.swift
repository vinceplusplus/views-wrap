import XCTest
import SnapshotTesting
import SwiftUI
@testable import ViewsWrap

struct Tag: ViewModifier {
  func body(content: Content) -> some View {
    content
      .foregroundColor(.white)
      .frame(maxWidth: 144)
      .fixedSize()
      .padding(.horizontal, 12)
      .padding(.vertical, 4)
      .background(Color.blue)
      .cornerRadius(64)
  }
}

struct IdentifiableItem: Identifiable {
  let id: String
}

final class ViewsWrapTests: XCTestCase {
  func testHWrap() {
    // view builder for 10 views
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("january").modifier(Tag())
        Text("february").modifier(Tag())
        Text("march").modifier(Tag())
        Text("april").modifier(Tag())
        Text("may").modifier(Tag())
        Text("june").modifier(Tag())
        Text("july").modifier(Tag())
        Text("august").modifier(Tag())
        Text("september").modifier(Tag())
        Text("october").modifier(Tag())
      },
      as: .image
    )
    
    // view builder for 1-9 views to make sure every view is taken into account and they are in correct order
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
        Text("7").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
        Text("7").modifier(Tag())
        Text("8").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: HWrap(maxWidth: 320, hSpacing: 16, vSpacing: 8) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
        Text("7").modifier(Tag())
        Text("8").modifier(Tag())
        Text("9").modifier(Tag())
      },
      as: .image
    )
    
    // forEach
    assertSnapshot(
      matching: HWrap(maxWidth: 120, hSpacing: 16, vSpacing: 8, data: ["1", "2", "3", "4", "5"], id: \.self) {
        Text("\($0)").modifier(Tag())
      },
      as: .image
    )
    
    assertSnapshot(
      matching: HWrap(maxWidth: 120, hSpacing: 16, vSpacing: 8, data: [.init(id: "1"), .init(id: "2"), .init(id: "3"), .init(id: "4"), .init(id: "5")] as [IdentifiableItem]) {
        Text("\($0.id)").modifier(Tag())
      },
      as: .image
    )
    
    assertSnapshot(
      matching: HWrap(maxWidth: 120, hSpacing: 16, vSpacing: 8, data: 0..<5) {
        Text("\([0, 1, 2, 3, 4][$0])").modifier(Tag())
      },
      as: .image
    )
  }
  
  func testVWrap() {
    // view builder for 10 views
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("january").modifier(Tag())
        Text("february").modifier(Tag())
        Text("march").modifier(Tag())
        Text("april").modifier(Tag())
        Text("may").modifier(Tag())
        Text("june").modifier(Tag())
        Text("july").modifier(Tag())
        Text("august").modifier(Tag())
        Text("september").modifier(Tag())
        Text("october").modifier(Tag())
      },
      as: .image
    )
    
    // view builder for 1-9 views to make sure every view is taken into account and they are in correct order
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
        Text("7").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
        Text("7").modifier(Tag())
        Text("8").modifier(Tag())
      },
      as: .image
    )
    assertSnapshot(
      matching: VWrap(maxHeight: 320, vSpacing: 32, hSpacing: 16) {
        Text("1").modifier(Tag())
        Text("2").modifier(Tag())
        Text("3").modifier(Tag())
        Text("4").modifier(Tag())
        Text("5").modifier(Tag())
        Text("6").modifier(Tag())
        Text("7").modifier(Tag())
        Text("8").modifier(Tag())
        Text("9").modifier(Tag())
      },
      as: .image
    )
    
    // forEach
    assertSnapshot(
      matching: VWrap(maxHeight: 120, vSpacing: 32, hSpacing: 16, data: ["1", "2", "3", "4", "5"], id: \.self) {
        Text("\($0)").modifier(Tag())
      },
      as: .image
    )
    
    assertSnapshot(
      matching: VWrap(maxHeight: 120, vSpacing: 32, hSpacing: 16, data: [.init(id: "1"), .init(id: "2"), .init(id: "3"), .init(id: "4"), .init(id: "5")] as [IdentifiableItem]) {
        Text("\($0.id)").modifier(Tag())
      },
      as: .image
    )
    
    assertSnapshot(
      matching: VWrap(maxHeight: 120, vSpacing: 32, hSpacing: 16, data: 0..<5) {
        Text("\([0, 1, 2, 3, 4][$0])").modifier(Tag())
      },
      as: .image
    )
  }
  
  static var allTests = [
    ("testHWrap", testHWrap),
  ]
}


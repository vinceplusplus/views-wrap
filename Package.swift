// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "views-wrap",
  platforms: [
    .macOS(SupportedPlatform.MacOSVersion.v10_15),
    .iOS(SupportedPlatform.IOSVersion.v13)
  ],
  products: [
    .library(
      name: "ViewsWrap",
      targets: ["ViewsWrap"]
    ),
  ],
  dependencies: [
    .package(name: "SnapshotTesting", url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.8.2")
  ],
  targets: [
    .target(
      name: "ViewsWrap",
      dependencies: []
    ),
    .testTarget(
      name: "ViewsWrapTests",
      dependencies: [
        "ViewsWrap",
        "SnapshotTesting",
      ],
      resources: [.process("__Snapshots__")]
    ),
  ]
)

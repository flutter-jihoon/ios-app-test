// swift-tools-version: 5.9
import PackageDescription

let package = Package(
  name: "FlutterPackage",
  platforms: [
    .iOS(.v14),
  ],
  products: [
    .library(
      name: "FlutterPackage",
      targets: ["FlutterPackage"]),
  ],
  targets: [
    .target(
      name: "FlutterPackage",
      dependencies: [
        .target(name: "App"),
        .target(name: "Flutter"),
      ]
    ),
    .binaryTarget(name: "App", path: "Flutter/Release/App.xcframework"),
    .binaryTarget(name: "Flutter", path: "Flutter/Release/Flutter.xcframework"),
  ]
)

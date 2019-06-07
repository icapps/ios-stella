// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Stella",
  platforms: [
      .macOS(.v10_10),
      .iOS(.v9),
      .tvOS(.v9)
  ],
  products: [
    .library(name: "Stella", targets: ["Stella"])
  ],
  dependencies: [],
  targets: [
    .target(name: "Stella", dependencies: [], path: "Sources")
  ],
  swiftLanguageVersions: [.v4_2]
)
// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "Stella",
  products: [
    .library(name: "Stella", targets: ["Stella"])
  ],
  dependencies: [],
  targets: [
        .target(name: "Stella", dependencies: [], path: "Sources")
    ]
)
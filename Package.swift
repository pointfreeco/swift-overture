// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "Overture",
  products: [
    .library(
      name: "Overture",
      targets: ["Overture"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Overture",
      dependencies: []),
    .testTarget(
      name: "OvertureTests",
      dependencies: ["Overture"]),
  ]
)

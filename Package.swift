// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "swift-overture",
  products: [
    .library(
      name: "Overture",
      targets: ["Overture"]
    ),
  ],
  targets: [
    .target(
      name: "Overture"
    ),
    .testTarget(
      name: "OvertureTests",
      dependencies: ["Overture"]
    ),
  ]
)

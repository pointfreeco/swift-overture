// swift-tools-version:5.0
import Foundation
import PackageDescription

let package = Package(
  name: "Overture",
  products: [
    .library(
      name: "Overture",
      targets: ["Overture"]),
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

if ProcessInfo.processInfo.environment.keys.contains("PF_DEVELOP") {
  package.dependencies.append(
    contentsOf: [
      .package(url: "https://github.com/yonaskolb/XcodeGen.git", from: "2.3.0"),
    ]
  )
}

import XCTest
import Overture

class FlipTests: XCTestCase {
  func testFlip() {
    let capitalized = flip(String.capitalized)

    let result = ["hello, world", "and good night"]
      .map(capitalized(Locale(identifier: "en")))

    XCTAssertEqual(result, ["Hello, World", "And Good Night"])
  }
}

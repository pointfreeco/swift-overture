import XCTest
import Overture

final class UncurryTests: XCTestCase {
  func testUncurry() {
    let add: (Int) -> (Int) -> Int = { val1 in { val2 in val1 + val2 } }
    let f = uncurry(add)
    XCTAssertEqual(3, f(1, 2))
  }

  func testThrowing() {
    let add: (Int) -> (Int) throws -> Int = { val1 in { val2 in val1 + val2 } }
    let f = uncurry(add)
    XCTAssertEqual(3, try f(1, 2))
  }
}

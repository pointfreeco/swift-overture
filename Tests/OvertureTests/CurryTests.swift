import XCTest
import Overture

final class CurryTests: XCTestCase {
  func testCurry() {
    let add: (Int, Int) -> Int = { $0 + $1 }
    let f = curry(add)
    XCTAssertEqual(3, f(1)(2))
  }

  func testThrowing() {
    let add: (Int, Int) throws -> Int = { $0 + $1 }
    let f = curry(add)
    XCTAssertEqual(3, try f(1)(2))
  }
}

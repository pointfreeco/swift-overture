import XCTest
import Overture

final class ConcatTests: XCTestCase {
  func testConcat() {
    func incr(_ x: Int) -> Int {
      return x + 1
    }

    func square(_ x: Int) -> Int {
      return x * x
    }

    XCTAssertEqual(82, concat(incr, incr, square, square, incr)(1))
    XCTAssertEqual(82, concat(incr, incr, square, square) { $0 + 1 }(1))
  }

  func testInoutConcat() {
    func incr(_ x: inout Int) {
      x += 1
    }

    func square(_ x: inout Int) {
      x *= x
    }

    var x = 1
    concat(incr, incr, square, square, incr)(&x)
    XCTAssertEqual(82, x)

    x = 1
    concat(incr, incr, square, square) { $0 += 1 }(&x)
    XCTAssertEqual(82, x)
  }
}



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

  func testThrowingConcat() {
    func incr(_ x: Int) -> Int {
      return x + 1
    }

    func square(_ x: Int) -> Int {
      return x * x
    }

    XCTAssertEqual(82, try concat(incr, nonThrowing(incr), square, square, incr)(1))
    XCTAssertEqual(82, try concat(incr, incr, nonThrowing(square), square) { $0 + 1 }(1))
    XCTAssertThrowsError(try concat(throwing(incr), incr, square, square, incr)(1))
    XCTAssertThrowsError(try concat(incr, incr, square, throwing(square)) { $0 + 1 }(1))
    XCTAssertThrowsError(try concat(incr, incr, square, square, and: throwing(incr))(1))
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
    concat(incr, incr, square, square) { (y: inout Int) in y += 1 }(&x)
    XCTAssertEqual(82, x)
  }

  func testThrowingInoutConcat() throws {
    func incr(_ x: inout Int) {
      x += 1
    }

    func square(_ x: inout Int) {
      x *= x
    }

    var x = 1
    try concat(incr, nonThrowing(incr), square, square, incr)(&x)
    XCTAssertEqual(82, x)

    x = 1
    try concat(incr, incr, nonThrowing(square), square) { (y: inout Int) in y += 1 }(&x)
    XCTAssertEqual(82, x)

    x = 1
    XCTAssertThrowsError(try concat(throwing(incr), incr, square, square, incr)(&x))
    XCTAssertEqual(1, x)

    x = 1
    XCTAssertThrowsError(try concat(incr, incr, square, throwing(square)) { (y: inout Int) in y += 1 }(&x))
    XCTAssertEqual(9, x)

    x = 1
    XCTAssertThrowsError(try concat(incr, incr, square, square, and: throwing(incr))(&x))
    XCTAssertEqual(81, x)
  }
}

private struct ExpectedError: Error {}
private func throwing<A, B>(_: (A) -> B) -> (A) throws -> B {
    return { _ in throw ExpectedError() }
}

private func throwing<A>(_: (inout A) -> Void) -> (inout A) throws -> Void {
    return { _ in throw ExpectedError() }
}

private func nonThrowing<A, B>(_ f: @escaping (A) -> B) -> (A) throws -> B {
    return f
}

private func nonThrowing<A>(_ f: @escaping (inout A) -> Void) -> (inout A) throws -> Void {
    return f
}

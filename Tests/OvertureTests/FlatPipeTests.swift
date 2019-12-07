import XCTest
import Overture

final class FlatPipeTests: XCTestCase {
  func testFlatPipe2() {
    XCTAssertNil(flatPipe(Int.init, incr)("a"))
    XCTAssertEqual(2, flatPipe(Int.init, incr)("1"))
  }

  func testThrowingFlatPipe2() {
    XCTAssertNil(try flatPipe(Int.init, nonThrowing(incr))("a"))
    XCTAssertNoThrow(try flatPipe(Int.init, throwing(incr))("a"))
    XCTAssertThrowsError(try flatPipe(throwing(incr), String.init)(1))
  }

  func testFlatPipe3() {
    XCTAssertNil(flatPipe(uppercased, Int.init, incr)("a"))
    XCTAssertEqual(2, flatPipe(uppercased, Int.init, incr)("1"))
  }

  func testThrowingFlatPipe3() {
    XCTAssertNil(try flatPipe(uppercased, Int.init, nonThrowing(incr))("a"))
    XCTAssertNoThrow(try flatPipe(uppercased, Int.init, throwing(incr))("a"))
    XCTAssertThrowsError(try flatPipe(throwing(incr), String.init, uppercased)(1))
  }

  func testFlatPipe4() {
    XCTAssertNil(flatPipe(uppercased, Int.init, incr, incr)("a"))
    XCTAssertEqual(3, flatPipe(uppercased, Int.init, incr, incr)("1"))
  }

  func testThrowingFlatPipe4() {
    XCTAssertNil(try flatPipe(uppercased, Int.init, nonThrowing(incr), String.init)("a"))
    XCTAssertNoThrow(try flatPipe(uppercased, Int.init, throwing(incr), String.init)("a"))
    XCTAssertThrowsError(try flatPipe(throwing(incr), String.init, uppercased, Int.init)(1))
  }

  func testFlatPipe5() {
    XCTAssertNil(flatPipe(uppercased, Int.init, incr, incr, String.init)("a"))
    XCTAssertEqual("3", flatPipe(uppercased, Int.init, incr, incr, String.init)("1"))
  }

  func testThrowingFlatPipe5() {
    XCTAssertNil(try flatPipe(uppercased, Int.init, nonThrowing(incr), String.init, uppercased)("a"))
    XCTAssertNoThrow(try flatPipe(uppercased, Int.init, throwing(incr), String.init, uppercased)("a"))
    XCTAssertThrowsError(try flatPipe(throwing(incr), String.init, uppercased, Int.init, incr)(1))
  }

  func testFlatPipe6() {
    XCTAssertNil(flatPipe(uppercased, Int.init, incr, incr, String.init, uppercased)("a"))
    XCTAssertEqual("3", flatPipe(uppercased, Int.init, incr, incr, String.init, uppercased)("1"))
  }

  func testThrowingFlatPipe6() {
    XCTAssertNil(try flatPipe(uppercased, Int.init, nonThrowing(incr), String.init, uppercased, Int.init)("a"))
    XCTAssertNoThrow(try flatPipe(uppercased, Int.init, throwing(incr), String.init, uppercased, Int.init)("a"))
    XCTAssertThrowsError(try flatPipe(throwing(incr), String.init, uppercased, Int.init, incr, String.init)(1))
  }
}

private func incr(_ x: Int) -> Int {
  return x + 1
}

private func uppercased(_ s: String) -> String {
  return s.uppercased()
}

private struct ExpectedError: Error {}
private func throwing<A, B>(_: (A) -> B) -> (A) throws -> B {
    return { _ in throw ExpectedError() }
}

private func nonThrowing<A, B>(_ f: @escaping (A) -> B) -> (A) throws -> B {
    return f
}

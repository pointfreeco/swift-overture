import XCTest
import Overture

final class ComposeTests: XCTestCase {
  func testCompose2() {
    XCTAssertEqual("2", compose(String.init, incr)(1))
  }

  func testThrowingCompose2() {
    XCTAssertEqual("2", try compose(nonThrowing(String.init), incr)(1))
    XCTAssertThrowsError(try compose(String.init, throwing(incr))(1))
  }

  func testCompose3() {
    XCTAssertEqual("3", compose(String.init, incr, incr)(1))
  }

  func testThrowingCompose3() {
    XCTAssertEqual("3", try compose(String.init, nonThrowing(incr), incr)(1))
    XCTAssertThrowsError(try compose(String.init, incr, throwing(incr))(1))
  }

  func testCompose4() {
    XCTAssertEqual("4", compose(String.init, incr, incr, incr)(1))
  }

  func testThrowingCompose4() {
    XCTAssertEqual("4", try compose(String.init, incr, incr, nonThrowing(incr))(1))
    XCTAssertThrowsError(try compose(throwing(String.init), incr, incr, incr)(1))
  }

  func testCompose5() {
    XCTAssertEqual("5", compose(String.init, incr, incr, incr, incr)(1))
  }

  func testThrowingCompose5() {
    XCTAssertEqual("5", try compose(String.init, incr, incr, nonThrowing(incr), incr)(1))
    XCTAssertThrowsError(try compose(String.init, incr, throwing(incr), incr, incr)(1))
  }

  func testCompose6() {
    XCTAssertEqual("6", compose(String.init, incr, incr, incr, incr, incr)(1))
  }

  func testThrowingCompose6() {
    XCTAssertEqual("6", try compose(String.init, incr, incr, nonThrowing(incr), incr, incr)(1))
    XCTAssertThrowsError(try compose(String.init, incr, incr, throwing(incr), incr, incr)(1))
  }
}

private func incr(_ x: Int) -> Int {
  return x + 1
}

private struct ExpectedError: Error {}
private func throwing<A, B>(_: (A) -> B) -> (A) throws -> B {
    return { _ in throw ExpectedError() }
}

private func nonThrowing<A, B>(_ f: @escaping (A) -> B) -> (A) throws -> B {
    return f
}

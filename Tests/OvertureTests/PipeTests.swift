import XCTest
import Overture

final class PipeTests: XCTestCase {
  func testPipe2() {
    XCTAssertEqual("2", pipe(incr, String.init)(1))
  }

  func testThrowingPipe2() {
    XCTAssertEqual("2", try pipe(nonThrowing(incr), String.init)(1))
    XCTAssertThrowsError(try pipe(throwing(incr), String.init)(1))
  }

  func testPipe3() {
    XCTAssertEqual("3", pipe(incr, incr, String.init)(1))
  }

  func testThrowingPipe3() {
    XCTAssertEqual("3", try pipe(incr, nonThrowing(incr), String.init)(1))
    XCTAssertThrowsError(try pipe(throwing(incr), incr, String.init)(1))
  }

  func testPipe4() {
    XCTAssertEqual("4", pipe(incr, incr, incr, String.init)(1))
  }

  func testThrowingPipe4() {
    XCTAssertEqual("4", try pipe(incr, incr, nonThrowing(incr), String.init)(1))
    XCTAssertThrowsError(try pipe(incr, incr, throwing(incr), String.init)(1))
  }

  func testPipe5() {
    XCTAssertEqual("5", pipe(incr, incr, incr, incr, String.init)(1))
  }

  func testThrowingPipe5() {
    XCTAssertEqual("5", try pipe(incr, incr, incr, incr, nonThrowing(String.init))(1))
    XCTAssertThrowsError(try pipe(incr, throwing(incr), incr, incr, String.init)(1))
  }

  func testPipe6() {
    XCTAssertEqual("6", pipe(incr, incr, incr, incr, incr, String.init)(1))
  }

  func testThrowingPipe6() {
    XCTAssertEqual("6", try pipe(incr, nonThrowing(incr), incr, incr, incr, String.init)(1))
    XCTAssertThrowsError(try pipe(incr, incr, incr, incr, incr, throwing(String.init))(1))
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

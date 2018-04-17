import XCTest
import Overture

final class ChainTests: XCTestCase {
  func testOptionalChain2() {
    XCTAssertEqual(.some(9), chain(incr, square)(2))
    XCTAssertNil(chain(incr, fail)(2))
    XCTAssertNil(chain(fail, incr)(2))
  }

  func testThrowingOptionalChain2() {
    XCTAssertEqual(.some(9), try chain(nonThrowing(incr), square)(2))
    XCTAssertNil(try chain(nonThrowing(incr), fail)(2))
    XCTAssertNil(try chain(nonThrowing(fail), incr)(2))
    XCTAssertThrowsError(try chain(throwing(incr), square)(2))
    XCTAssertThrowsError(try chain(throwing(incr), fail)(2))
    XCTAssertThrowsError(try chain(throwing(fail), incr)(2))
    XCTAssertThrowsError(try chain(incr, throwing(square))(2))
    XCTAssertThrowsError(try chain(incr, throwing(fail))(2))
    XCTAssertNil(try chain(fail, throwing(incr))(2))
  }

  func testOptionalChain3() {
    XCTAssertEqual(.some(16), chain(incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr)(2))
  }

  func testThrowingOptionalChain3() {
    XCTAssertEqual(.some(16), try chain(nonThrowing(incr), incr, square)(2))
    XCTAssertNil(try chain(nonThrowing(incr), incr, fail)(2))
    XCTAssertNil(try chain(nonThrowing(fail), incr, incr)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, square)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, fail)(2))
    XCTAssertThrowsError(try chain(throwing(fail), incr, incr)(2))
    XCTAssertThrowsError(try chain(incr, incr, throwing(square))(2))
    XCTAssertThrowsError(try chain(incr, incr, throwing(fail))(2))
    XCTAssertNil(try chain(fail, incr, throwing(incr))(2))
  }

  func testOptionalChain4() {
    XCTAssertEqual(.some(25), chain(incr, incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr, incr)(2))
  }

  func testThrowingOptionalChain4() {
    XCTAssertEqual(.some(25), try chain(nonThrowing(incr), incr, incr, square)(2))
    XCTAssertNil(try chain(nonThrowing(incr), incr, incr, fail)(2))
    XCTAssertNil(try chain(nonThrowing(fail), incr, incr, incr)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, incr, square)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, incr, fail)(2))
    XCTAssertThrowsError(try chain(throwing(fail), incr, incr, incr)(2))
    XCTAssertThrowsError(try chain(incr, incr, incr, throwing(square))(2))
    XCTAssertThrowsError(try chain(incr, incr, incr, throwing(fail))(2))
    XCTAssertNil(try chain(fail, incr, incr, throwing(incr))(2))
  }

  func testOptionalChain5() {
    XCTAssertEqual(.some(36), chain(incr, incr, incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr, incr, incr)(2))
  }

  func testThrowingOptionalChain5() {
    XCTAssertEqual(.some(36), try chain(nonThrowing(incr), incr, incr, incr, square)(2))
    XCTAssertNil(try chain(nonThrowing(incr), incr, incr, incr, fail)(2))
    XCTAssertNil(try chain(nonThrowing(fail), incr, incr, incr, incr)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, incr, incr, square)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, incr, incr, fail)(2))
    XCTAssertThrowsError(try chain(throwing(fail), incr, incr, incr, incr)(2))
    XCTAssertThrowsError(try chain(incr, incr, incr, incr, throwing(square))(2))
    XCTAssertThrowsError(try chain(incr, incr, incr, incr, throwing(fail))(2))
    XCTAssertNil(try chain(fail, incr, incr, incr, throwing(incr))(2))
  }

  func testOptionalChain6() {
    XCTAssertEqual(.some(49), chain(incr, incr, incr, incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, incr, incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr, incr, incr, incr)(2))
  }

  func testThrowingOptionalChain6() {
    XCTAssertEqual(.some(49), try chain(nonThrowing(incr), incr, incr, incr, incr, square)(2))
    XCTAssertNil(try chain(nonThrowing(incr), incr, incr, incr, incr, fail)(2))
    XCTAssertNil(try chain(nonThrowing(fail), incr, incr, incr, incr, incr)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, incr, incr, incr, square)(2))
    XCTAssertThrowsError(try chain(throwing(incr), incr, incr, incr, incr, fail)(2))
    XCTAssertThrowsError(try chain(throwing(fail), incr, incr, incr, incr, incr)(2))
    XCTAssertThrowsError(try chain(incr, incr, incr, incr, incr, throwing(square))(2))
    XCTAssertThrowsError(try chain(incr, incr, incr, incr, incr, throwing(fail))(2))
    XCTAssertNil(try chain(fail, incr, incr, incr, incr, throwing(incr))(2))
  }

  func testArrayChain2() {
    XCTAssertEqual([1, 1, 2, 2], chain(twoPlusOne, two)(1))
    XCTAssertEqual([1, 2, 1, 2], chain(two, twoPlusOne)(1))
    XCTAssertEqual([], chain(two, zero)(1))
    XCTAssertEqual([], chain(zero, two)(1))
  }

  func testThrowingArrayChain2() {
    XCTAssertEqual([1, 1, 2, 2], try chain(nonThrowing(twoPlusOne), two)(1))
    XCTAssertEqual([1, 2, 1, 2], try chain(two, nonThrowing(twoPlusOne))(1))
    XCTAssertEqual([], try chain(nonThrowing(two), zero)(1))
    XCTAssertEqual([], try chain(zero, nonThrowing(two))(1))
    XCTAssertThrowsError(try chain(throwing(twoPlusOne), two)(1))
    XCTAssertThrowsError(try chain(two, throwing(twoPlusOne))(1))
    XCTAssertThrowsError(try chain(throwing(two), zero)(1))
    XCTAssertEqual([], try chain(zero, throwing(two))(1))
  }

  func testArrayChain3() {
    XCTAssertEqual(Array(repeatElement(1, count: 8)), chain(two, two, two)(1))
    XCTAssertEqual([], chain(two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two)(1))
  }

  func testThrowingArrayChain3() {
    XCTAssertEqual(Array(repeatElement(1, count: 8)), try chain(nonThrowing(two), two, two)(1))
    XCTAssertEqual([], try chain(nonThrowing(two), two, zero)(1))
    XCTAssertEqual([], try chain(zero, two, nonThrowing(two))(1))
    XCTAssertThrowsError(try chain(throwing(two), two, two)(1))
    XCTAssertThrowsError(try chain(throwing(two), two, zero)(1))
    XCTAssertEqual([], try chain(zero, two, throwing(two))(1))
  }

  func testArrayChain4() {
    XCTAssertEqual(Array(repeatElement(1, count: 16)), chain(two, two, two, two)(1))
    XCTAssertEqual([], chain(two, two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two, two)(1))
  }

  func testThrowingArrayChain4() {
    XCTAssertEqual(Array(repeatElement(1, count: 16)), try chain(nonThrowing(two), two, two, two)(1))
    XCTAssertEqual([], try chain(nonThrowing(two), two, two, zero)(1))
    XCTAssertEqual([], try chain(zero, two, two, nonThrowing(two))(1))
    XCTAssertThrowsError(try chain(throwing(two), two, two, two)(1))
    XCTAssertThrowsError(try chain(throwing(two), two, two, zero)(1))
    XCTAssertEqual([], try chain(zero, two, two, throwing(two))(1))
  }

  func testArrayChain5() {
    XCTAssertEqual(Array(repeatElement(1, count: 32)), chain(two, two, two, two, two)(1))
    XCTAssertEqual([], chain(two, two, two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two, two, two)(1))
  }

  func testThrowingArrayChain5() {
    XCTAssertEqual(Array(repeatElement(1, count: 32)), try chain(nonThrowing(two), two, two, two, two)(1))
    XCTAssertEqual([], try chain(two, nonThrowing(two), two, two, zero)(1))
    XCTAssertEqual([], try chain(zero, two, nonThrowing(two), two, nonThrowing(two))(1))
    XCTAssertThrowsError(try chain(two, two, throwing(two), two, two)(1))
    XCTAssertThrowsError(try chain(two, two, two, throwing(two), zero)(1))
    XCTAssertEqual([], try chain(zero, two, two, two, throwing(two))(1))
  }

  func testArrayChain6() {
    XCTAssertEqual(Array(repeatElement(1, count: 64)), chain(two, two, two, two, two, two)(1))
    XCTAssertEqual([], chain(two, two, two, two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two, two, two, two)(1))
  }

  func testThrowingArrayChain6() {
    XCTAssertEqual(Array(repeatElement(1, count: 64)), try chain(nonThrowing(two), two, two, two, two, two)(1))
    XCTAssertEqual([], try chain(two, two, two, nonThrowing(two), two, zero)(1))
    XCTAssertEqual([], try chain(zero, two, two, two, nonThrowing(two), two)(1))
    XCTAssertThrowsError(try chain(throwing(two), two, two, two, two, two)(1))
    XCTAssertThrowsError(try chain(two, two, two, throwing(two), two, zero)(1))
    XCTAssertEqual([], try chain(zero, two, two, two, throwing(two), two)(1))
  }
}

private func incr(_ x: Int) -> Int? {
  return .some(x + 1)
}

private func square(_ x: Int) -> Int? {
  return .some(x * x)
}

private func fail(_ x: Int) -> Int? {
  return .none
}

private func two(_ x: Int) -> [Int] {
  return [x, x]
}

private func twoPlusOne(_ x: Int) -> [Int] {
  return [x, x + 1]
}

private func zero(_ x: Int) -> [Int] {
  return []
}

private struct ExpectedError: Error {}
private func throwing<A, B>(_: (A) -> B) -> (A) throws -> B {
    return { _ in throw ExpectedError() }
}

private func nonThrowing<A, B>(_ f: @escaping (A) -> B) -> (A) throws -> B {
    return f
}

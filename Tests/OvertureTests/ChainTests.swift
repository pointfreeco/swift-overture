import XCTest
import Overture

final class ChainTests: XCTestCase {
  func testOptionalChain2() {
    XCTAssertEqual(.some(9), chain(incr, square)(2))
    XCTAssertNil(chain(incr, fail)(2))
    XCTAssertNil(chain(fail, incr)(2))
  }

  func testOptionalChain3() {
    XCTAssertEqual(.some(16), chain(incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr)(2))
  }

  func testOptionalChain4() {
    XCTAssertEqual(.some(25), chain(incr, incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr, incr)(2))
  }

  func testOptionalChain5() {
    XCTAssertEqual(.some(36), chain(incr, incr, incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr, incr, incr)(2))
  }

  func testOptionalChain6() {
    XCTAssertEqual(.some(49), chain(incr, incr, incr, incr, incr, square)(2))
    XCTAssertNil(chain(incr, incr, incr, incr, incr, fail)(2))
    XCTAssertNil(chain(fail, incr, incr, incr, incr, incr)(2))
  }

  func testArrayChain2() {
    XCTAssertEqual([1, 1, 2, 2], chain(twoPlusOne, two)(1))
    XCTAssertEqual([1, 2, 1, 2], chain(two, twoPlusOne)(1))
    XCTAssertEqual([], chain(two, zero)(1))
    XCTAssertEqual([], chain(zero, two)(1))
  }

  func testArrayChain3() {
    XCTAssertEqual(Array(repeatElement(1, count: 8)), chain(two, two, two)(1))
    XCTAssertEqual([], chain(two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two)(1))
  }

  func testArrayChain4() {
    XCTAssertEqual(Array(repeatElement(1, count: 16)), chain(two, two, two, two)(1))
    XCTAssertEqual([], chain(two, two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two, two)(1))
  }

  func testArrayChain5() {
    XCTAssertEqual(Array(repeatElement(1, count: 32)), chain(two, two, two, two, two)(1))
    XCTAssertEqual([], chain(two, two, two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two, two, two)(1))
  }

  func testArrayChain6() {
    XCTAssertEqual(Array(repeatElement(1, count: 64)), chain(two, two, two, two, two, two)(1))
    XCTAssertEqual([], chain(two, two, two, two, two, zero)(1))
    XCTAssertEqual([], chain(zero, two, two, two, two, two)(1))
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

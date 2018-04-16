import XCTest
import Overture

final class WithTests: XCTestCase {
  func testWith() {
    func incr(_ x: Int) -> Int {
      return x + 1
    }

    XCTAssertEqual(2, with(1, incr))
    XCTAssertEqual(2, try? with(1, nonThrowing(incr)))
    XCTAssertThrowsError(try with(1, throwing(incr)))
  }

  func testInPlaceWith() throws {
    func incr(_ x: inout Int) {
      x += 1
    }

    var x = 1
    with(&x, incr)
    XCTAssertEqual(2, x)

    x = 1
    try with(&x, nonThrowing(incr))
    XCTAssertEqual(2, x)

    x = 1
    XCTAssertThrowsError(try with(&x, throwing(incr)))
  }

  func testValueCopyableWith() {
    func incr(_ x: inout Int) {
      x += 1
    }

    XCTAssertEqual(2, with(1, incr))
    XCTAssertEqual(2, try? with(1, nonThrowing(incr)))
    XCTAssertThrowsError(try with(1, throwing(incr)))
  }

  func testReferenceMutableWith() throws {
    func currencyStyle(_ fmt: NumberFormatter) {
      fmt.numberStyle = .currency
    }

    XCTAssertEqual(
      .currency,
      with(NumberFormatter(), currencyStyle).numberStyle
    )

    XCTAssertEqual(
      .currency,
      try with(NumberFormatter(), nonThrowing(currencyStyle)).numberStyle
    )

    XCTAssertThrowsError(
      try with(NumberFormatter(), throwing(currencyStyle)).numberStyle
    )
  }
}

private struct ExpectedError: Error {}
private func throwing<A, B>(_: (A) -> B) -> (A) throws -> B {
    return { _ in throw ExpectedError() }
}

private func throwing<A>(_: (inout A) -> Void) -> (inout A) throws -> Void {
    return { _ in throw ExpectedError() }
}

private func throwing<A>(_: (A) -> Void) -> (A) throws -> Void {
    return { _ in throw ExpectedError() }
}

private func nonThrowing<A, B>(_ f: @escaping (A) -> B) -> (A) throws -> B {
    return f
}

private func nonThrowing<A>(_ f: @escaping (inout A) -> Void) -> (inout A) throws -> Void {
    return f
}

private func nonThrowing<A>(_ f: @escaping (A) -> Void) -> (A) throws -> Void {
    return f
}

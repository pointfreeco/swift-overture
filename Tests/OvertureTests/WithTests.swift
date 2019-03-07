import XCTest
import Overture

final class WithTests: XCTestCase {
  func testWith() {
    func incr(_ x: Int) -> Int {
      return x + 1
    }

    XCTAssertEqual(2, with(1, incr))
    XCTAssertEqual(2, try with(1, nonThrowing(incr)))
    XCTAssertThrowsError(try with(1, throwing(incr)))
  }

  func testInPlaceWith() throws {
    func incr(_ x: inout Int) {
      x += 1
    }

    var x = 1
    update(&x, incr)
    XCTAssertEqual(2, x)

    x = 1
    try update(&x, nonThrowing(incr))
    XCTAssertEqual(2, x)

    x = 1
    XCTAssertThrowsError(try update(&x, throwing(incr)))
  }

  func testValueCopyableWith() {
    func incr(_ x: inout Int) {
      x += 1
    }

    XCTAssertEqual(2, update(1, incr))
    XCTAssertEqual(2, try? update(1, nonThrowing(incr)))
    XCTAssertThrowsError(try update(1, throwing(incr)))
  }

  func testReferenceMutableWith() throws {
    func currencyStyle(_ fmt: NumberFormatter) {
      fmt.numberStyle = .currency
    }

    XCTAssertEqual(
      .currency,
      updateObject(NumberFormatter(), currencyStyle).numberStyle
    )

    XCTAssertEqual(
      .currency,
      try updateObject(NumberFormatter(), nonThrowing(currencyStyle)).numberStyle
    )

    XCTAssertThrowsError(
      try updateObject(NumberFormatter(), throwing(currencyStyle)).numberStyle
    )
  }

  func testAmbiguity() {
    _ = update(Bar()) {
      $0.baz()
    }
    _ = updateObject(Bar()) {
      $0.baz()
    }
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

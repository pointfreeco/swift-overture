import XCTest
import Overture

final class WithTests: XCTestCase {
  func testWith() {
    XCTAssertEqual(2, with(1) { $0 + 1 })
  }

  func testInPlaceWith() {
    func incr(_ x: inout Int) {
      x += 1
    }

    var x = 1
    with(&x, incr)
    XCTAssertEqual(2, x)
  }

  func testValueCopyableWith() {
    func incr(_ x: inout Int) {
      x += 1
    }

    XCTAssertEqual(2, with(1, incr))
  }

  func testReferenceMutableWith() {
    func currencyStyle(_ fmt: NumberFormatter) {
      fmt.numberStyle = .currency
    }

    XCTAssertEqual(
      .currency,
      with(NumberFormatter(), currencyStyle).numberStyle
    )
  }
}

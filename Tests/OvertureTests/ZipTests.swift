import XCTest
import Overture

final class ZipTests: XCTestCase {
  func testZipOptional() {
    guard
      let (a, b, c, d, e, f, g, h, i, j) = zip(
        Int?.some(1),
        Int?.some(2),
        Int?.some(3),
        Int?.some(4),
        Int?.some(5),
        Int?.some(6),
        Int?.some(7),
        Int?.some(8),
        Int?.some(9),
        Int?.some(10)
      )
      else { return XCTFail() }

    XCTAssertEqual(1, a)
    XCTAssertEqual(2, b)
    XCTAssertEqual(3, c)
    XCTAssertEqual(4, d)
    XCTAssertEqual(5, e)
    XCTAssertEqual(6, f)
    XCTAssertEqual(7, g)
    XCTAssertEqual(8, h)
    XCTAssertEqual(9, i)
    XCTAssertEqual(10, j)
  }

  func testZipSequence() {
    let (a, b, c, d, e, f, g, h, i, j) = Array(
      zip(
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9],
        [10, 11, 12],
        [13, 14, 15],
        [16, 17, 18],
        [19, 20, 21],
        [22, 23, 24],
        [25, 26, 27],
        [28, 29, 30]
      )
    )
  }
}

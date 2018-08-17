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
    let zipped = zip(
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8],
      [9, 10],
      [11, 12],
      [13, 14],
      [15, 16],
      [17, 18],
      [19, 20]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.0)
    XCTAssertEqual(3, fst.1)
    XCTAssertEqual(5, fst.2)
    XCTAssertEqual(7, fst.3)
    XCTAssertEqual(9, fst.4)
    XCTAssertEqual(11, fst.5)
    XCTAssertEqual(13, fst.6)
    XCTAssertEqual(15, fst.7)
    XCTAssertEqual(17, fst.8)
    XCTAssertEqual(19, fst.9)
    let snd = array[1]
    XCTAssertEqual(2, snd.0)
    XCTAssertEqual(4, snd.1)
    XCTAssertEqual(6, snd.2)
    XCTAssertEqual(8, snd.3)
    XCTAssertEqual(10, snd.4)
    XCTAssertEqual(12, snd.5)
    XCTAssertEqual(14, snd.6)
    XCTAssertEqual(16, snd.7)
    XCTAssertEqual(18, snd.8)
    XCTAssertEqual(20, snd.9)
  }
}

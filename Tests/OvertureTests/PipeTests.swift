import XCTest
import Overture

final class PipeTests: XCTestCase {
  func testPipe2() {
    XCTAssertEqual("2", pipe(incr, String.init)(1))
  }

  func testPipe3() {
    XCTAssertEqual("3", pipe(incr, incr, String.init)(1))
  }

  func testPipe4() {
    XCTAssertEqual("4", pipe(incr, incr, incr, String.init)(1))
  }

  func testPipe5() {
    XCTAssertEqual("5", pipe(incr, incr, incr, incr, String.init)(1))
  }

  func testPipe6() {
    XCTAssertEqual("6", pipe(incr, incr, incr, incr, incr, String.init)(1))
  }
}

private func incr(_ x: Int) -> Int {
  return x + 1
}

import XCTest
import Overture

final class ComposeTests: XCTestCase {
  func testCompose2() {
    XCTAssertEqual("2", compose(String.init, incr)(1))
  }

  func testCompose3() {
    XCTAssertEqual("3", compose(String.init, incr, incr)(1))
  }

  func testCompose4() {
    XCTAssertEqual("4", compose(String.init, incr, incr, incr)(1))
  }

  func testCompose5() {
    XCTAssertEqual("5", compose(String.init, incr, incr, incr, incr)(1))
  }

  func testCompose6() {
    XCTAssertEqual("6", compose(String.init, incr, incr, incr, incr, incr)(1))
  }
}

private func incr(_ x: Int) -> Int {
  return x + 1
}

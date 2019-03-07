import XCTest
import Overture

final class SettersTests: XCTestCase {
  func testOver() {
    let f = over(prop(\CGRect.size.width)) { $0 + 1 }
    let rect = with(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)

    let g = over(prop(\NSMutableParagraphStyle.alignment)) { _ in .center }
    let style = with(NSMutableParagraphStyle(), g)
    XCTAssertEqual(.center, style.alignment)
  }

  func testSet() {
    let f = set(prop(\CGRect.size.width), 1)
    let rect = with(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)

    let g = set(prop(\NSMutableParagraphStyle.alignment), .center)
    let style = with(NSMutableParagraphStyle(), g)
    XCTAssertEqual(.center, style.alignment)
  }

  func testInoutMver() {
    let f = mver(mprop(\CGRect.size.width)) { $0 += 1 }
    let rect = update(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)
  }

  func testAnyObjectInoutMver() {
    let f = mver(mprop(\NSMutableParagraphStyle.alignment)) { $0 = .center }
    let style = updateObject(NSMutableParagraphStyle(), f)
    XCTAssertEqual(.center, style.alignment)
  }

  func testAnyObjectAnyObjectMver() {
    class Bar {
      var bazzed = false
      func baz() { self.bazzed = true }
    }
    class Foo {
      var bar: Bar
      init(bar: Bar) {
        self.bar = bar
      }
    }

    let f = mver(mprop(\Foo.bar)) { $0.baz() }
    let foo = updateObject(Foo(bar: Bar()), f)
    XCTAssertTrue(foo.bar.bazzed)
  }

  func testInoutMut() {
    let f = mut(mprop(\CGRect.size.width), 1)
    let rect = update(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)
  }

  func testAnyObjectMut() {
    let f = mut(mprop(\NSMutableParagraphStyle.alignment), .center)
    let style = updateObject(NSMutableParagraphStyle(), f)
    XCTAssertEqual(.center, style.alignment)
  }
}

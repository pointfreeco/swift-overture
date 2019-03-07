import XCTest
import Overture

final class SettersTests: XCTestCase {
  func testOver() {
    let f = over(prop(\CGRect.size.width)) { $0 + 1 }
    let rect = with(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)

    let g = over(prop(\Bar.bazzed)) { !$0 }
    let bar = with(Bar(), g)
    XCTAssertEqual(true, bar.bazzed)
  }

  func testSet() {
    let f = set(prop(\CGRect.size.width), 1)
    let rect = with(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)

    let g = set(prop(\Bar.bazzed), true)
    let bar = with(Bar(), g)
    XCTAssertEqual(true, bar.bazzed)
  }

  func testInoutMver() {
    let f = mver(mprop(\CGRect.size.width)) { $0 += 1 }
    let rect = update(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)
  }

  func testAnyObjectInoutMver() {
    let g = mver(mprop(\Bar.bazzed)) { $0 = !$0 }
    let bar = updateObject(Bar(), g)
    XCTAssertEqual(true, bar.bazzed)
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
    let g = mut(mprop(\Bar.bazzed), true)
    let bar = updateObject(Bar(), g)
    XCTAssertEqual(true, bar.bazzed)
  }
}

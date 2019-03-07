import XCTest
import Overture

final class KeyPathTests: XCTestCase {
  func testGet() {
    XCTAssertEqual([1, 2, 3], [".", "..", "..."].map(get(\.count)))
  }

  func testProp() {
    let f = prop(\CGRect.size.width)
    let rect = with(CGRect.zero, f { $0 + 1 })
    XCTAssertEqual(1, rect.width)
  }

  func testOver() {
    let f = over(\CGRect.size.width) { $0 + 1 }
    let rect = with(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)
  }

  func testSet() {
    let rect = with(CGRect.zero, set(\.size.width, 1))
    XCTAssertEqual(1, rect.width)
  }

  func testInoutMprop() {
    let f = mprop(\CGRect.size.width)({ $0 += 1 })
    let rect = update(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)
  }

  func testInoutMver() {
    let f = mver(\CGRect.size.width) { $0 += 1 }
    let rect = update(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)
  }

  func testInoutMut() {
    let f = mut(\CGRect.size.width, 1)
    let rect = update(CGRect.zero, f)
    XCTAssertEqual(1, rect.width)
  }

  func testAnyObjectAnyObjectMprop() {
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

    let f = mprop(\Foo.bar)({ $0.baz() })
    let foo = updateObject(Foo(bar: Bar()), f)
    XCTAssertTrue(foo.bar.bazzed)
  }

  func testAnyObjectInoutMprop() {
    let f = (mprop(\Bar.bazzed)) { $0 = !$0 }
    let bar = updateObject(Bar(), f)
    XCTAssertEqual(true, bar.bazzed)
  }

  func testAnyObjectAnyObjectMver() {
    let f = mverObject(\Foo.bar) { $0.baz() }
    let foo = updateObject(Foo(bar: Bar()), f)
    XCTAssertTrue(foo.bar.bazzed)
  }

  func testAnyObjectInoutMver() {
    let f = mver(\Bar.bazzed) { $0 = !$0 }
    let bar = updateObject(Bar(), f)
    XCTAssertEqual(true, bar.bazzed)
  }

  func testAnyObjectMut() {
    let f = mut(\Bar.bazzed, true)
    let bar = updateObject(Bar(), f)
    XCTAssertEqual(true, bar.bazzed)
  }
}

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

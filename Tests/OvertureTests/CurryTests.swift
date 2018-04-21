import XCTest
import Overture

final class CurryTests: XCTestCase {
  func testCurry() {
    let add2: (Int, Int) -> Int = { $0 + $1 }
    let add3: (Int, Int, Int) -> Int = { $0 + $1 + $2}
    let add4: (Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3}
    let add5: (Int, Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3 + $4}
    let add6: (Int, Int, Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3 + $4 + $5}
    let add7: (Int, Int, Int, Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6}
    let add8: (Int, Int, Int, Int, Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7}
    let add9: (Int, Int, Int, Int, Int, Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7 + $8}
    let add10: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9}
    let add11: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9 + $10}
    let f2 = curry(add2)
    let f3 = curry(add3)
    let f4 = curry(add4)
    let f5 = curry(add5)
    let f6 = curry(add6)
    let f7 = curry(add7)
    let f8 = curry(add8)
    let f9 = curry(add9)
    let f10 = curry(add10)
    let f11 = curry(add11)
    XCTAssertEqual(2, f2(1)(1))
    XCTAssertEqual(3, f3(1)(1)(1))
    XCTAssertEqual(4, f4(1)(1)(1)(1))
    XCTAssertEqual(5, f5(1)(1)(1)(1)(1))
    XCTAssertEqual(6, f6(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(7, f7(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(8, f8(1)(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(9, f9(1)(1)(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(10, f10(1)(1)(1)(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(11, f11(1)(1)(1)(1)(1)(1)(1)(1)(1)(1)(1))
  }

  func testThrowing() {
    let add1: (Int, Int) throws -> Int = { $0 + $1 }
    let add2: (Int, Int, Int) throws -> Int = { $0 + $1 + $2}
    let add3: (Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 }
    let add4: (Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4}
    let add5: (Int, Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4 + $5}
    let add6: (Int, Int, Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6}
    let add7: (Int, Int, Int, Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7}
    let add8: (Int, Int, Int, Int, Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7 + $8}
    let add9: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9}
    let add10: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9 + $10}
    let add11: (Int, Int, Int, Int, Int, Int, Int, Int, Int, Int, Int, Int) throws -> Int = { $0 + $1 + $2 + $3 + $4 + $5 + $6 + $7 + $8 + $9 + $10 + $11}
    let f1 = curry(add1)
    let f2 = curry(add2)
    let f3 = curry(add3)
    let f4 = curry(add4)
    let f5 = curry(add5)
    let f6 = curry(add6)
    let f7 = curry(add7)
    let f8 = curry(add8)
    let f9 = curry(add9)
    let f10 = curry(add10)
    let f11 = curry(add11)
    XCTAssertEqual(2, try f1(1)(1))
    XCTAssertEqual(3, try f2(1)(1)(1))
    XCTAssertEqual(4, try f3(1)(1)(1)(1))
    XCTAssertEqual(5, try f4(1)(1)(1)(1)(1))
    XCTAssertEqual(6, try f5(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(7, try f6(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(8, try f7(1)(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(9, try f8(1)(1)(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(10, try f9(1)(1)(1)(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(11, try f10(1)(1)(1)(1)(1)(1)(1)(1)(1)(1)(1))
    XCTAssertEqual(12, try f11(1)(1)(1)(1)(1)(1)(1)(1)(1)(1)(1)(1))
  }
}

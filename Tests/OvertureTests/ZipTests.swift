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

  func testZipResult() {
    let result = zip(
      Result<Int, Error>.success(1),
      Result<Int, Error>.success(2),
      Result<Int, Error>.success(3),
      Result<Int, Error>.success(4),
      Result<Int, Error>.success(5),
      Result<Int, Error>.success(6),
      Result<Int, Error>.success(7),
      Result<Int, Error>.success(8),
      Result<Int, Error>.success(9),
      Result<Int, Error>.success(10)
    )
    guard
      let (a, b, c, d, e, f, g, h, i, j) = try? result.get()
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
  
  func testZip2WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      
      init(
        _ a: Int,
        _ b: Int
        ) {
        self.a = a
        self.b = b
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
  }
  
  func testZip3WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int
        ) {
        self.a = a
        self.b = b
        self.c = c
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4],
      [5, 6]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
  }
  
  func testZip4WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      let d: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int,
        _ d: Int
        ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    XCTAssertEqual(7, fst.d)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
    XCTAssertEqual(8, snd.d)
  }
  
  func testZip5WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      let d: Int
      let e: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int,
        _ d: Int,
        _ e: Int
        ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8],
      [9, 10]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    XCTAssertEqual(7, fst.d)
    XCTAssertEqual(9, fst.e)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
    XCTAssertEqual(8, snd.d)
    XCTAssertEqual(10, snd.e)
  }
  
  func testZip6WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      let d: Int
      let e: Int
      let f: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int,
        _ d: Int,
        _ e: Int,
        _ f: Int
        ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8],
      [9, 10],
      [11, 12]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    XCTAssertEqual(7, fst.d)
    XCTAssertEqual(9, fst.e)
    XCTAssertEqual(11, fst.f)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
    XCTAssertEqual(8, snd.d)
    XCTAssertEqual(10, snd.e)
    XCTAssertEqual(12, snd.f)
  }
  
  func testZip7WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      let d: Int
      let e: Int
      let f: Int
      let g: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int,
        _ d: Int,
        _ e: Int,
        _ f: Int,
        _ g: Int
        ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8],
      [9, 10],
      [11, 12],
      [13, 14]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    XCTAssertEqual(7, fst.d)
    XCTAssertEqual(9, fst.e)
    XCTAssertEqual(11, fst.f)
    XCTAssertEqual(13, fst.g)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
    XCTAssertEqual(8, snd.d)
    XCTAssertEqual(10, snd.e)
    XCTAssertEqual(12, snd.f)
    XCTAssertEqual(14, snd.g)
  }
  
  func testZip8WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      let d: Int
      let e: Int
      let f: Int
      let g: Int
      let h: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int,
        _ d: Int,
        _ e: Int,
        _ f: Int,
        _ g: Int,
        _ h: Int
        ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8],
      [9, 10],
      [11, 12],
      [13, 14],
      [15, 16]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    XCTAssertEqual(7, fst.d)
    XCTAssertEqual(9, fst.e)
    XCTAssertEqual(11, fst.f)
    XCTAssertEqual(13, fst.g)
    XCTAssertEqual(15, fst.h)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
    XCTAssertEqual(8, snd.d)
    XCTAssertEqual(10, snd.e)
    XCTAssertEqual(12, snd.f)
    XCTAssertEqual(14, snd.g)
    XCTAssertEqual(16, snd.h)
  }
  
  func testZip9WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      let d: Int
      let e: Int
      let f: Int
      let g: Int
      let h: Int
      let i: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int,
        _ d: Int,
        _ e: Int,
        _ f: Int,
        _ g: Int,
        _ h: Int,
        _ i: Int
        ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
        self.i = i
      }
    }
    let zipped = zip(
      with: ZipInit.init,
      [1, 2],
      [3, 4],
      [5, 6],
      [7, 8],
      [9, 10],
      [11, 12],
      [13, 14],
      [15, 16],
      [17, 18]
    )
    let array = Array(zipped)
    let fst = array[0]
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    XCTAssertEqual(7, fst.d)
    XCTAssertEqual(9, fst.e)
    XCTAssertEqual(11, fst.f)
    XCTAssertEqual(13, fst.g)
    XCTAssertEqual(15, fst.h)
    XCTAssertEqual(17, fst.i)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
    XCTAssertEqual(8, snd.d)
    XCTAssertEqual(10, snd.e)
    XCTAssertEqual(12, snd.f)
    XCTAssertEqual(14, snd.g)
    XCTAssertEqual(16, snd.h)
    XCTAssertEqual(18, snd.i)
  }
    
  func testZip10WithSequence() {
    struct ZipInit {
      let a: Int
      let b: Int
      let c: Int
      let d: Int
      let e: Int
      let f: Int
      let g: Int
      let h: Int
      let i: Int
      let j: Int
      
      init(
        _ a: Int,
        _ b: Int,
        _ c: Int,
        _ d: Int,
        _ e: Int,
        _ f: Int,
        _ g: Int,
        _ h: Int,
        _ i: Int,
        _ j: Int
      ) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
        self.e = e
        self.f = f
        self.g = g
        self.h = h
        self.i = i
        self.j = j
      }
    }
    let zipped = zip(
      with: ZipInit.init,
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
    XCTAssertEqual(1, fst.a)
    XCTAssertEqual(3, fst.b)
    XCTAssertEqual(5, fst.c)
    XCTAssertEqual(7, fst.d)
    XCTAssertEqual(9, fst.e)
    XCTAssertEqual(11, fst.f)
    XCTAssertEqual(13, fst.g)
    XCTAssertEqual(15, fst.h)
    XCTAssertEqual(17, fst.i)
    XCTAssertEqual(19, fst.j)
    let snd = array[1]
    XCTAssertEqual(2, snd.a)
    XCTAssertEqual(4, snd.b)
    XCTAssertEqual(6, snd.c)
    XCTAssertEqual(8, snd.d)
    XCTAssertEqual(10, snd.e)
    XCTAssertEqual(12, snd.f)
    XCTAssertEqual(14, snd.g)
    XCTAssertEqual(16, snd.h)
    XCTAssertEqual(18, snd.i)
    XCTAssertEqual(20, snd.j)
  }
}

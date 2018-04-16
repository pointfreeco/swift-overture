// Generated using Sourcery 0.10.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest

@testable import OvertureTests;
extension ChainTests {
  static var allTests: [(String, (ChainTests) -> () throws -> Void)] = [
    ("testOptionalChain2", testOptionalChain2),
    ("testThrowingOptionalChain2", testThrowingOptionalChain2),
    ("testOptionalChain3", testOptionalChain3),
    ("testThrowingOptionalChain3", testThrowingOptionalChain3),
    ("testOptionalChain4", testOptionalChain4),
    ("testThrowingOptionalChain4", testThrowingOptionalChain4),
    ("testOptionalChain5", testOptionalChain5),
    ("testThrowingOptionalChain5", testThrowingOptionalChain5),
    ("testOptionalChain6", testOptionalChain6),
    ("testThrowingOptionalChain6", testThrowingOptionalChain6),
    ("testArrayChain2", testArrayChain2),
    ("testThrowingArrayChain2", testThrowingArrayChain2),
    ("testArrayChain3", testArrayChain3),
    ("testThrowingArrayChain3", testThrowingArrayChain3),
    ("testArrayChain4", testArrayChain4),
    ("testThrowingArrayChain4", testThrowingArrayChain4),
    ("testArrayChain5", testArrayChain5),
    ("testThrowingArrayChain5", testThrowingArrayChain5),
    ("testArrayChain6", testArrayChain6),
    ("testThrowingArrayChain6", testThrowingArrayChain6)
  ]
}
extension ComposeTests {
  static var allTests: [(String, (ComposeTests) -> () throws -> Void)] = [
    ("testCompose2", testCompose2),
    ("testThrowingCompose2", testThrowingCompose2),
    ("testCompose3", testCompose3),
    ("testThrowingCompose3", testThrowingCompose3),
    ("testCompose4", testCompose4),
    ("testThrowingCompose4", testThrowingCompose4),
    ("testCompose5", testCompose5),
    ("testThrowingCompose5", testThrowingCompose5),
    ("testCompose6", testCompose6),
    ("testThrowingCompose6", testThrowingCompose6)
  ]
}
extension ConcatTests {
  static var allTests: [(String, (ConcatTests) -> () throws -> Void)] = [
    ("testConcat", testConcat),
    ("testThrowingConcat", testThrowingConcat),
    ("testInoutConcat", testInoutConcat),
    ("testThrowingInoutConcat", testThrowingInoutConcat)
  ]
}
extension CurryTests {
  static var allTests: [(String, (CurryTests) -> () throws -> Void)] = [
    ("testCurry", testCurry),
    ("testThrowing", testThrowing)
  ]
}
extension PipeTests {
  static var allTests: [(String, (PipeTests) -> () throws -> Void)] = [
    ("testPipe2", testPipe2),
    ("testThrowingPipe2", testThrowingPipe2),
    ("testPipe3", testPipe3),
    ("testThrowingPipe3", testThrowingPipe3),
    ("testPipe4", testPipe4),
    ("testThrowingPipe4", testThrowingPipe4),
    ("testPipe5", testPipe5),
    ("testThrowingPipe5", testThrowingPipe5),
    ("testPipe6", testPipe6),
    ("testThrowingPipe6", testThrowingPipe6)
  ]
}
extension WithTests {
  static var allTests: [(String, (WithTests) -> () throws -> Void)] = [
    ("testWith", testWith),
    ("testInPlaceWith", testInPlaceWith),
    ("testValueCopyableWith", testValueCopyableWith),
    ("testReferenceMutableWith", testReferenceMutableWith)
  ]
}

// swiftlint:disable trailing_comma
XCTMain([
  testCase(ChainTests.allTests),
  testCase(ComposeTests.allTests),
  testCase(ConcatTests.allTests),
  testCase(CurryTests.allTests),
  testCase(PipeTests.allTests),
  testCase(WithTests.allTests),
])
// swiftlint:enable trailing_comma

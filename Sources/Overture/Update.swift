
/// Left-to-right, in-place function application.
///
/// - Parameters:
///   - a: A mutable value.
///   - fs: In-out functions.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
public func update<A>(_ a: inout A, _ fs: ((inout A) -> Void)...) {
  fs.forEach { f in f(&a) }
}

/// Left-to-right, in-place throwing function application.
///
/// - Parameters:
///   - a: A mutable value.
///   - fs: In-out functions.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
public func update<A>(_ a: inout A, _ fs: ((inout A) throws -> Void)...) throws {
  try fs.forEach { f in try f(&a) }
}

/// Left-to-right, value-mutable function application.
///
/// - Parameters:
///   - a: A value.
///   - fs: In-out functions.
/// - Returns: The result of `f` applied to `a`.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
public func update<A>(_ a: A, _ fs: ((inout A) -> Void)...) -> A {
  var a = a
  fs.forEach { f in f(&a) }
  return a
}

/// Left-to-right, value-mutable, throwing function application.
///
/// - Parameters:
///   - a: A value.
///   - fs: In-out functions.
/// - Returns: The result of `f` applied to `a`.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
public func update<A>(_ a: A, _ fs: ((inout A) throws -> Void)...) throws -> A {
  var a = a
  try fs.forEach { f in try f(&a) }
  return a
}

/// Left-to-right, reference-mutable function application.
///
/// - Parameters:
///   - a: A mutable value.
///   - f: An function from `A` to `Void`.
/// - Returns: The result of `f` applied to `a`.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
@discardableResult
public func updateObject<A: AnyObject>(_ a: A, _ fs: ((A) -> Void)...) -> A {
  fs.forEach { f in f(a) }
  return a
}

/// Left-to-right, reference-mutable, throwing function application.
///
/// - Parameters:
///   - a: A mutable value.
///   - f: An function from `A` to `Void`.
/// - Returns: The result of `f` applied to `a`.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
@discardableResult
public func updateObject<A: AnyObject>(_ a: A, _ fs: ((A) throws -> Void)...) throws -> A {
  try fs.forEach { f in try f(a) }
  return a
}

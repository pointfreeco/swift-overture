
/// Left-to-right function application.
///
///     with(user, getName) // getName(user)
///
/// - Parameters:
///   - a: A value.
///   - f: A function.
/// - Returns: The result of `f` applied to `a`.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
public func with<A, B>(_ a: A, _ f: (A) throws -> B) rethrows -> B {
  return try f(a)
}

/// Left-to-right, in-place function application.
///
/// - Parameters:
///   - a: A mutable value.
///   - f: An in-out function.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
public func with<A>(_ a: inout A, _ f: (inout A) throws -> Void) rethrows {
  try f(&a)
}

/// Left-to-right, value-mutable function application.
///
/// - Parameters:
///   - a: A value.
///   - f: An in-out function.
/// - Returns: The result of `f` applied to `a`.
/// - Note: This function is commonly seen in operator form as "pipe-forward", `|>`.
public func with<A>(_ a: A, _ f: (inout A) throws -> Void) rethrows -> A {
  var a = a
  try f(&a)
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
public func with<A: AnyObject>(_ a: A, _ f: (A) throws -> Void) rethrows -> A {
  try f(a)
  return a
}

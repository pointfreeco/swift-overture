
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

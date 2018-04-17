
/// Calls a function that takes zero arguments. Useful for composing with static, curried methods.
///
/// - Parameter function: A function taking zero arguments.
/// - Returns: The return value.
public func zurry<A>(_ function: @escaping () throws -> A) rethrows -> A {
  return try function()
}

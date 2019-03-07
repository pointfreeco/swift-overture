
/// Calls a function that takes zero arguments. Useful for composing with static, curried methods.
///
/// - Parameter function: A function taking zero arguments.
/// - Returns: The return value.
public func zurry<A>(_ function: @escaping () throws -> A) rethrows -> A {
  return try function()
}

/// Wraps a value in a function.
///
/// - Parameter value: A value.
/// - Returns: A wrapper function.
public func unzurry<A>(_ value: @autoclosure @escaping () -> A) -> () -> A {
  return value
}

/// A throwing variant of `unzurry`.
///
/// - Parameter value: A value.
/// - Returns: A wrapper function.
public func unzurry<A>(_ value: @autoclosure @escaping () throws -> A) -> () throws -> A {
  return value
}

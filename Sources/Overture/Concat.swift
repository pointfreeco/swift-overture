
/// Forward composition of functions that take and return the same type.
///
/// - Parameters:
///   - fs: Zero or more functions to apply in order.
///   - fz: A final, optional, terminating function for trailing closure syntax.
///   - a: The argument to the final function.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A>(
  _ fs: ((A) -> A)...,
  and fz: @escaping (_ a: A) -> A = { $0 }
  )
  -> (A) -> A {
    
    return { (a: A) -> A in
      fz(fs.reduce(a) { a, f in f(a) })
    }
}

/// Forward, mutable value composition of functions that take and return the same type.
///
/// - Parameters:
///   - fs: Zero or more functions to apply in order.
///   - fz: A final, optional, terminating function for trailing closure syntax.
///   - a: The argument to the final function.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A>(
  _ fs: ((inout A) -> Void)...,
  and fz: @escaping (_ a: inout A) -> Void = { _ in }
  )
  -> (inout A) -> Void {

    return { (a: inout A) -> Void in
      fs.forEach { f in f(&a) }
      fz(&a)
    }
}

/// Forward, mutable reference composition of functions that take and return the same type.
///
/// - Parameters:
///   - fs: Zero or more functions to apply in order.
///   - fz: A final, optional, terminating function for trailing closure syntax.
///   - a: The argument to the final function.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A: AnyObject>(
  _ fs: ((A) -> Void)...,
  and fz: @escaping (_ a: A) -> Void
  )
  -> (A) -> Void {

    return { (a: A) -> Void in
      fs.forEach { f in f(a) }
      fz(a)
    }
}

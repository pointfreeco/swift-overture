
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

/// Forward composition of throwing functions that take and return the same type.
///
/// - Parameters:
///   - fs: Zero or more functions to apply in order.
///   - fz: A final, optional, terminating function for trailing closure syntax.
///   - a: The argument to the final function.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A>(
  _ fs: ((A) throws -> A)...,
  and fz: @escaping (_ a: A) throws -> A = { $0 }
  )
  -> (A) throws -> A {

    return { (a: A) throws -> A in
      try fz(fs.reduce(a) { a, f in try f(a) })
    }
}

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


/// Forward, mutable value composition of throwing functions that take and return the same type.
///
/// - Parameters:
///   - fs: Zero or more functions to apply in order.
///   - fz: A final, optional, terminating function for trailing closure syntax.
///   - a: The argument to the final function.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A>(
  _ fs: ((inout A) throws -> Void)...,
  and fz: @escaping (_ a: inout A) throws -> Void = { _ in }
  )
  -> (inout A) throws -> Void {

    return { (a: inout A) throws -> Void in
      try fs.forEach { f in try f(&a) }
      try fz(&a)
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
  and fz: @escaping (_ a: A) -> Void = { _ in }
  )
  -> (A) -> Void {

    return { (a: A) -> Void in
      fs.forEach { f in f(a) }
      fz(a)
    }
}

/// Forward, mutable reference composition of throwing functions that take and return the same type.
///
/// - Parameters:
///   - fs: Zero or more functions to apply in order.
///   - fz: A final, optional, terminating function for trailing closure syntax.
///   - a: The argument to the final function.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A: AnyObject>(
  _ fs: ((A) throws -> Void)...,
  and fz: @escaping (_ a: A) throws -> Void = { _ in }
  )
  -> (A) throws -> Void {

    return { (a: A) throws -> Void in
      try fs.forEach { f in try f(a) }
      try fz(a)
    }
}

/// Concatenation of functions that take the same input type and produce functions that take the same input and output type.
///
/// - Parameters:
///   - f1: The first function to apply.
///   - a1: The initial argument.
///   - f2: The second function to apply.
///   - a2: The initial argument after applying `f1`.
///   - fs: Zero or more functions to apply in order after `f1` and `f2`.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A, B>(
  _ f1: @escaping (_ a1: A) -> (B) -> B,
  _ f2: @escaping (_ a2: A) -> (B) -> B,
  _ fs: ((A) -> (B) -> B)...
  )
  -> (A) -> (B) -> B {

    return { a in
      { b in
        fs.reduce(f2(a)(f1(a)(b))) { b, f in
          f(a)(b)
        }
      }
    }
}

/// Concatenation of functions that take the same input type and produce value-mutable functions.
///
/// - Parameters:
///   - f1: The first function to apply.
///   - a1: The initial argument.
///   - f2: The second function to apply.
///   - a2: The initial argument after applying `f1`.
///   - fs: Zero or more functions to apply in order after `f1` and `f2`.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A, B>(
  _ f1: @escaping (A) -> (inout B) -> Void,
  _ f2: @escaping (A) -> (inout B) -> Void,
  _ fs: ((A) -> (inout B) -> Void)...
  )
  -> (A) -> (inout B) -> Void {

    return { a in
      { b in
        f1(a)(&b)
        f2(a)(&b)
        fs.forEach { f in f(a)(&b) }
      }
    }
}

/// Concatenation of functions that take the same input type and produce reference-mutable functions.
///
/// - Parameters:
///   - f1: The first function to apply.
///   - a1: The initial argument.
///   - f2: The second function to apply.
///   - a2: The initial argument after applying `f1`.
///   - fs: Zero or more functions to apply in order after `f1` and `f2`.
/// - Returns: A new function that applies every function given as input in order.
/// - Note: This function is commonly seen in operator form as `<>`.
public func concat<A, B: AnyObject>(
  _ f1: @escaping (A) -> (B) -> Void,
  _ f2: @escaping (A) -> (B) -> Void,
  _ fs: ((A) -> (B) -> Void)...
  )
  -> (A) -> (B) -> Void {

    return { a in
      { b in
        f1(a)(b)
        f2(a)(b)
        fs.forEach { f in f(a)(b) }
      }
    }
}

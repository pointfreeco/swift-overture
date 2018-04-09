
/// Flips the argument order of a zero-argument, curried function.
///
/// - Parameter f: A zero-argument, curried function.
/// - Returns: A curried function with the zero-argument surfaced.
public func flip<A, B>(_ function: @escaping (A) -> () -> B)
  -> () -> (A) -> B {

    return { () -> (A) -> B in
      { (a: A) -> B in
        function(a)()
      }
    }
}

/// Flips the argument order of a curried function.
///
/// - Parameter function: A curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C>(_ function: @escaping (A) -> (B) -> C)
  -> (B) -> (A) -> C {

    return { (b: B) -> (A) -> C in
      { (a: A) -> C in
        function(a)(b)
      }
    }
}

/// Flips the argument order of a two-argument curried function.
///
/// - Parameter function: A two-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D>(_ function: @escaping (A) -> (B, C) -> D)
  -> (B, C) -> (A) -> D {

    return { (b: B, c: C) -> (A) -> D in
      { (a: A) -> D in
        function(a)(b, c)
      }
    }
}

/// Flips the argument order of a three-argument curried function.
///
/// - Parameter function: A three-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D, E>(_ function: @escaping (A) -> (B, C, D) -> E)
  -> (B, C, D) -> (A) -> E {

    return { (b: B, c: C, d: D) -> (A) -> E in
      { (a: A) -> E in
        function(a)(b, c, d)
      }
    }
}

/// Flips the argument order of a four-argument curried function.
///
/// - Parameter function: A four-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D, E, F>(_ function: @escaping (A) -> (B, C, D, E) -> F)
  -> (B, C, D, E) -> (A) -> F {

    return { (b: B, c: C, d: D, e: E) -> (A) -> F in
      { (a: A) -> F in
        function(a)(b, c, d, e)
      }
    }
}

/// Flips the argument order of a five-argument curried function.
///
/// - Parameter function: A five-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D, E, F, G>(_ function: @escaping (A) -> (B, C, D, E, F) -> G)
  -> (B, C, D, E, F) -> (A) -> G {

    return { (b: B, c: C, d: D, e: E, f: F) -> (A) -> G in
      { (a: A) -> G in
        function(a)(b, c, d, e, f)
      }
    }
}

/// Flips the argument order of a throwing, zero-argument, curried function.
///
/// - Parameter function: A throwing, zero-argument, curried function.
/// - Returns: A throwing, curried function with the zero-argument surfaced.
public func flip<A, B>(_ function: @escaping (A) -> () throws -> B)
  -> () -> (A) throws -> B {

    return { () -> (A) throws -> B in
      { (a: A) throws -> B in
        try function(a)()
      }
    }
}

/// Flips the argument order of a throwing, curried function.
///
/// - Parameter function: A throwing, curried function.
/// - Returns: A throwing, curried function with its first two arguments flipped.
public func flip<A, B, C>(_ function: @escaping (A) -> (B) throws -> C)
  -> (B) -> (A) throws -> C {

    return { (b: B) -> (A) throws -> C in
      { (a: A) throws -> C in
        try function(a)(b)
      }
    }
}

/// Flips the argument order of a two-argument curried function.
///
/// - Parameter function: A throwing, two-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D>(_ function: @escaping (A) -> (B, C) throws -> D)
  -> (B, C) -> (A) throws -> D {

    return { (b: B, c: C) -> (A) throws -> D in
      { (a: A) throws -> D in
        try function(a)(b, c)
      }
    }
}

/// Flips the argument order of a three-argument curried function.
///
/// - Parameter function: A throwing, three-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D, E>(_ function: @escaping (A) -> (B, C, D) throws -> E)
  -> (B, C, D) -> (A) throws -> E {

    return { (b: B, c: C, d: D) -> (A) throws -> E in
      { (a: A) throws -> E in
        try function(a)(b, c, d)
      }
    }
}

/// Flips the argument order of a four-argument curried function.
///
/// - Parameter function: A throwing, four-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D, E, F>(_ function: @escaping (A) -> (B, C, D, E) throws -> F)
  -> (B, C, D, E) -> (A) throws -> F {

    return { (b: B, c: C, d: D, e: E) -> (A) throws -> F in
      { (a: A) throws -> F in
        try function(a)(b, c, d, e)
      }
    }
}

/// Flips the argument order of a five-argument curried function.
///
/// - Parameter function: A throwing, five-argument, curried function.
/// - Returns: A curried function with its first two arguments flipped.
public func flip<A, B, C, D, E, F, G>(_ function: @escaping (A) -> (B, C, D, E, F) throws -> G)
  -> (B, C, D, E, F) -> (A) throws -> G {

    return { (b: B, c: C, d: D, e: E, f: F) -> (A) throws -> G in
      { (a: A) throws -> G in
        try function(a)(b, c, d, e, f)
      }
    }
}

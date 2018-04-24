
/// Backward composition of functions.
///
/// - Parameters:
///   - f: A function that takes a value in `B` and returns a value in `C`.
///   - b: An argument in `B`.
///   - g: A function that takes a value in `A` and returns a value in `B`.
///   - a: An argument in `A`.
/// - Returns: A new function that takes a value in `A` and returns a value in `C`.
/// - Note: This function is commonly seen in operator form as `<<<`.
public func compose<A, B, C>(
  _ f: @escaping (B) -> C,
  _ g: @escaping (A) -> B
  )
  -> (A) -> C {

    return { (a: A) -> C in
      f(g(a))
    }
}

public func compose<A, B, C, D>(
  _ f: @escaping (C) -> D,
  _ g: @escaping (B) -> C,
  _ h: @escaping (A) -> B
  )
  -> (A) -> D {

    return { (a: A) -> D in
      f(g(h(a)))
    }
}

public func compose<A, B, C, D, E>(
  _ f: @escaping (D) -> E,
  _ g: @escaping (C) -> D,
  _ h: @escaping (B) -> C,
  _ i: @escaping (A) -> B
  )
  -> (A) -> E {

    return { (a: A) -> E in
      f(g(h(i(a))))
    }
}

public func compose<A, B, C, D, E, F>(
  _ f: @escaping (E) -> F,
  _ g: @escaping (D) -> E,
  _ h: @escaping (C) -> D,
  _ i: @escaping (B) -> C,
  _ j: @escaping (A) -> B
  )
  -> (A) -> F {

    return { (a: A) -> F in
      f(g(h(i(j(a)))))
    }
}

public func compose<A, B, C, D, E, F, G>(
  _ f: @escaping (F) -> G,
  _ g: @escaping (E) -> F,
  _ h: @escaping (D) -> E,
  _ i: @escaping (C) -> D,
  _ j: @escaping (B) -> C,
  _ k: @escaping (A) -> B
  )
  -> (A) -> G {

    return { (a: A) -> G in
      f(g(h(i(j(k(a))))))
    }
}

/// Backward composition of throwing functions.
///
/// - Parameters:
///   - f: A function that takes a value in `B` and returns a value in `C`.
///   - b: An argument in `B`.
///   - g: A function that takes a value in `A` and returns a value in `B`.
///   - a: An argument in `A`.
/// - Returns: A new function that takes a value in `A` and returns a value in `C`.
/// - Note: This function is commonly seen in operator form as `<<<`.
public func compose<A, B, C>(
  _ f: @escaping (B) throws -> C,
  _ g: @escaping (A) throws -> B
  )
  -> (A) throws -> C {

    return { (a: A) throws -> C in
      try f(g(a))
    }
}

public func compose<A, B, C, D>(
  _ f: @escaping (C) throws -> D,
  _ g: @escaping (B) throws -> C,
  _ h: @escaping (A) throws -> B
  )
  -> (A) throws -> D {

    return { (a: A) throws -> D in
      try f(g(h(a)))
    }
}

public func compose<A, B, C, D, E>(
  _ f: @escaping (D) throws -> E,
  _ g: @escaping (C) throws -> D,
  _ h: @escaping (B) throws -> C,
  _ i: @escaping (A) throws -> B
  )
  -> (A) throws -> E {

    return { (a: A) throws -> E in
      try f(g(h(i(a))))
    }
}

public func compose<A, B, C, D, E, F>(
  _ f: @escaping (E) throws -> F,
  _ g: @escaping (D) throws -> E,
  _ h: @escaping (C) throws -> D,
  _ i: @escaping (B) throws -> C,
  _ j: @escaping (A) throws -> B
  )
  -> (A) throws -> F {

    return { (a: A) throws -> F in
      try f(g(h(i(j(a)))))
    }
}

public func compose<A, B, C, D, E, F, G>(
  _ f: @escaping (F) throws -> G,
  _ g: @escaping (E) throws -> F,
  _ h: @escaping (D) throws -> E,
  _ i: @escaping (C) throws -> D,
  _ j: @escaping (B) throws -> C,
  _ k: @escaping (A) throws -> B
  )
  -> (A) throws -> G {

    return { (a: A) throws -> G in
      try f(g(h(i(j(k(a))))))
    }
}


/// Forward composition of functions.
///
/// - Parameters:
///   - f: A function that takes a value in `A` and returns a value in `B`.
///   - a: An argument in `A`.
///   - g: A function that takes a value in `B` and returns a value in `C`.
///   - b: An argument in `B`.
/// - Returns: A new function that takes a value in `A` and returns a value in `C`.
/// - Note: This function is commonly seen in operator form as `>>>`.
public func pipe<A, B, C>(
  _ f: @escaping (_ a: A) -> B,
  _ g: @escaping (_ b: B) -> C
  )
  -> (A) -> C {

    return { (a: A) -> C in
      g(f(a))
    }
}

public func pipe<A, B, C, D>(
  _ f: @escaping (A) -> B,
  _ g: @escaping (B) -> C,
  _ h: @escaping (C) -> D
  )
  -> (A) -> D {

    return { (a: A) -> D in
      h(g(f(a)))
    }
}

public func pipe<A, B, C, D, E>(
  _ f: @escaping (A) -> B,
  _ g: @escaping (B) -> C,
  _ h: @escaping (C) -> D,
  _ i: @escaping (D) -> E
  )
  -> (A) -> E {

    return { (a: A) -> E in
      i(h(g(f(a))))
    }
}

public func pipe<A, B, C, D, E, F>(
  _ f: @escaping (A) -> B,
  _ g: @escaping (B) -> C,
  _ h: @escaping (C) -> D,
  _ i: @escaping (D) -> E,
  _ j: @escaping (E) -> F
  )
  -> (A) -> F {

    return { (a: A) -> F in
      j(i(h(g(f(a)))))
    }
}

public func pipe<A, B, C, D, E, F, G>(
  _ f: @escaping (A) -> B,
  _ g: @escaping (B) -> C,
  _ h: @escaping (C) -> D,
  _ i: @escaping (D) -> E,
  _ j: @escaping (E) -> F,
  _ k: @escaping (F) -> G
  )
  -> (A) -> G {

    return { (a: A) -> G in
      k(j(i(h(g(f(a))))))
    }
}

/// Forward composition of functions.
///
/// - Parameters:
///   - f: A function that takes a value in `A` and returns a value in `B`.
///   - a: An argument in `A`.
///   - g: A function that takes a value in `B` and returns a value in `C`.
///   - b: An argument in `B`.
/// - Returns: A new function that takes a value in `A` and returns a value in `C`.
/// - Note: This function is commonly seen in operator form as `>>>`.
public func pipe<A, B, C>(
  _ f: @escaping (_ a: A) throws -> B,
  _ g: @escaping (_ b: B) throws -> C
  )
  -> (A) throws -> C {

    return { (a: A) throws -> C in
      try g(f(a))
    }
}

public func pipe<A, B, C, D>(
  _ f: @escaping (A) throws -> B,
  _ g: @escaping (B) throws -> C,
  _ h: @escaping (C) throws -> D
  )
  -> (A) throws -> D {

    return { (a: A) throws -> D in
      try h(g(f(a)))
    }
}

public func pipe<A, B, C, D, E>(
  _ f: @escaping (A) throws -> B,
  _ g: @escaping (B) throws -> C,
  _ h: @escaping (C) throws -> D,
  _ i: @escaping (D) throws -> E
  )
  -> (A) throws -> E {

    return { (a: A) throws -> E in
      try i(h(g(f(a))))
    }
}

public func pipe<A, B, C, D, E, F>(
  _ f: @escaping (A) throws -> B,
  _ g: @escaping (B) throws -> C,
  _ h: @escaping (C) throws -> D,
  _ i: @escaping (D) throws -> E,
  _ j: @escaping (E) throws -> F
  )
  -> (A) throws -> F {

    return { (a: A) throws -> F in
      try j(i(h(g(f(a)))))
    }
}

public func pipe<A, B, C, D, E, F, G>(
  _ f: @escaping (A) throws -> B,
  _ g: @escaping (B) throws -> C,
  _ h: @escaping (C) throws -> D,
  _ i: @escaping (D) throws -> E,
  _ j: @escaping (E) throws -> F,
  _ k: @escaping (F) throws -> G
  )
  -> (A) throws -> G {

    return { (a: A) throws -> G in
      try k(j(i(h(g(f(a))))))
    }
}


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


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

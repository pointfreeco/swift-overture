
/// Uncurries a function.
///
/// - Parameter function: A function with one argument, that returns another function with one argument.
/// - Returns: An uncurried function.
public func uncurry<A, B, C>(_ function: @escaping
  (A)
  -> (B)
  -> C)
  -> (A, B)
  -> C {
    return { (a: A, b: B) -> C in
      function(a)(b)
    }
}

/// Uncurries a throwing function.
///
/// - Parameter function: A throwing function with one argument, that returns another function with one argument.
/// - Returns: An uncurried, final-throwing function.
public func uncurry<A, B, C>(_ function: @escaping
  (A)
  -> (B) throws
  -> C)
  -> (A, B) throws
  -> C {
    return { (a: A, b: B) throws -> C in
      try function(a)(b)
    }
}

public func uncurry<A, B, C, D>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> D)
  -> (A, B, C)
  -> D {
    return { (a: A, b: B, c: C) -> D in
      function(a)(b)(c)
    }
}

public func uncurry<A, B, C, D>(_ function: @escaping
  (A)
  -> (B)
  -> (C) throws
  -> D)
  -> (A, B, C) throws
  -> D {
    return { (a: A, b: B, c: C) throws -> D in
      try function(a)(b)(c)
    }
}

public func uncurry<A, B, C, D, E>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> E)
  -> (A, B, C, D)
  -> E {
    return { (a: A, b: B, c: C, d: D) -> E in
      function(a)(b)(c)(d)
    }
}

public func uncurry<A, B, C, D, E>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D) throws
  -> E)
  -> (A, B, C, D) throws
  -> E {
    return { (a: A, b: B, c: C, d: D) throws -> E in
      try function(a)(b)(c)(d)
    }
}

public func uncurry<A, B, C, D, E, F>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E) -> F)
  -> (A, B, C, D, E)
  -> F {
    return { (a: A, b: B, c: C, d: D, e: E) -> F in
      function(a)(b)(c)(d)(e)
    }
}

public func uncurry<A, B, C, D, E, F>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E) throws
  ->  F)
  -> (A, B, C, D, E) throws
  -> F {
    return { (a: A, b: B, c: C, d: D, e: E) throws -> F in
      try function(a)(b)(c)(d)(e)
    }
}

public func uncurry<A, B, C, D, E, F, G>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  ->  G)
  -> (A, B, C, D, E, F)
  -> G {
    return { (a: A, b: B, c: C, d: D, e: E, f: F) -> G in
      function(a)(b)(c)(d)(e)(f)
    }
}

public func uncurry<A, B, C, D, E, F, G>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F) throws
  ->  G)
  -> (A, B, C, D, E, F) throws
  -> G {
    return { (a: A, b: B, c: C, d: D, e: E, f: F) throws -> G in
      try function(a)(b)(c)(d)(e)(f)
    }
}

public func uncurry<A, B, C, D, E, F, G, H>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> H)
  -> (A, B, C, D, E, F, G)
  -> H {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G) -> H in
      function(a)(b)(c)(d)(e)(f)(g)
    }
}

public func uncurry<A, B, C, D, E, F, G, H>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G) throws
  -> H)
  -> (A, B, C, D, E, F, G) throws
  -> H {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G) throws -> H in
      try function(a)(b)(c)(d)(e)(f)(g)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> I)
  -> (A, B, C, D, E, F, G, H)
  -> I {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H) -> I in
      function(a)(b)(c)(d)(e)(f)(g)(h)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H) throws
  -> I)
  -> (A, B, C, D, E, F, G, H) throws
  -> I {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H) throws -> I in
      try function(a)(b)(c)(d)(e)(f)(g)(h)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> J)
  -> (A, B, C, D, E, F, G, H, I)
  -> J {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I) -> J in
      function(a)(b)(c)(d)(e)(f)(g)(h)(i)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I) throws
  -> J)
  -> (A, B, C, D, E, F, G, H, I) throws
  -> J {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I) throws -> J in
      try function(a)(b)(c)(d)(e)(f)(g)(h)(i)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J, K>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> K)
  -> (A, B, C, D, E, F, G, H, I, J)
  -> K {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J) -> K in
      function(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J, K>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J) throws
  -> K)
  -> (A, B, C, D, E, F, G, H, I, J) throws
  -> K {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J) throws -> K in
      try function(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J, K, L>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K)
  -> L)
  -> (A, B, C, D, E, F, G, H, I, J, K)
  -> L {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K) -> L in
      function(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J, K, L>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K) throws
  -> L)
  -> (A, B, C, D, E, F, G, H, I, J, K) throws
  -> L {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K) throws -> L in
      try function(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J, K, L, M>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K)
  -> (L)
  -> M)
  -> (A, B, C, D, E, F, G, H, I, J, K, L)
  -> M {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K, l: L) -> M in
      function(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)(l)
    }
}

public func uncurry<A, B, C, D, E, F, G, H, I, J, K, L, M>(_ function: @escaping
  (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K)
  -> (L) throws
  -> M)
  -> (A, B, C, D, E, F, G, H, I, J, K, L) throws
  -> M {
    return { (a: A, b: B, c: C, d: D, e: E, f: F, g: G, h: H, i: I, j: J, k: K, l: L) throws -> M in
      try function(a)(b)(c)(d)(e)(f)(g)(h)(i)(j)(k)(l)
    }
}

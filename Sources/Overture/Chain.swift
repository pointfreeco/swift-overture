
/// Forward composition of functions that return optionals. Useful for chaining operations that may fail.
///
///     chain(String.init(validatingUTF8:), URL.init(string:))
///     // (UnsafePointer<CChar>) -> URL?
///
/// - Parameters:
///   - f: A function that takes a value in `A` and returns an optional value in `B`.
///   - a: An argument in `A`.
///   - g: A function that takes a value in `B` and returns an optional value in `C`.
///   - a: An argument in `B`.
/// - Returns: A new function that takes a value in `A` and returns an optional value in `C`.
/// - Note: This function is commonly seen in operator form as `>=>`.
public func chain<A, B, C>(
  _ f: @escaping (A) -> B?,
  _ g: @escaping (B) -> C?
  )
  -> (A) -> C? {

    return { (a: A) -> C? in
      f(a).flatMap(g)
    }
}

public func chain<A, B, C, D>(
  _ f: @escaping (A) -> B?,
  _ g: @escaping (B) -> C?,
  _ h: @escaping (C) -> D?
  )
  -> (A) -> D? {

    return { (a: A) -> D? in
      f(a)
        .flatMap(g)
        .flatMap(h)
    }
}

public func chain<A, B, C, D, E>(
  _ f: @escaping (A) -> B?,
  _ g: @escaping (B) -> C?,
  _ h: @escaping (C) -> D?,
  _ i: @escaping (D) -> E?
  )
  -> (A) -> E? {

    return { (a: A) -> E? in
      f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
    }
}

public func chain<A, B, C, D, E, F>(
  _ f: @escaping (A) -> B?,
  _ g: @escaping (B) -> C?,
  _ h: @escaping (C) -> D?,
  _ i: @escaping (D) -> E?,
  _ j: @escaping (E) -> F?
  )
  -> (A) -> F? {

    return { (a: A) -> F? in
      f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
    }
}

public func chain<A, B, C, D, E, F, G>(
  _ f: @escaping (A) -> B?,
  _ g: @escaping (B) -> C?,
  _ h: @escaping (C) -> D?,
  _ i: @escaping (D) -> E?,
  _ j: @escaping (E) -> F?,
  _ k: @escaping (F) -> G?
  )
  -> (A) -> G? {

    return { (a: A) -> G? in
      f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
        .flatMap(k)
    }
}

public func chain<A, B, C>(
  _ f: @escaping (A) throws -> B?,
  _ g: @escaping (B) throws -> C?
  )
  -> (A) throws -> C? {

    return { (a: A) throws -> C? in
      try f(a).flatMap(g)
    }
}

public func chain<A, B, C, D>(
  _ f: @escaping (A) throws -> B?,
  _ g: @escaping (B) throws -> C?,
  _ h: @escaping (C) throws -> D?
  )
  -> (A) throws -> D? {

    return { (a: A) throws -> D? in
      try f(a)
        .flatMap(g)
        .flatMap(h)
    }
}

public func chain<A, B, C, D, E>(
  _ f: @escaping (A) throws -> B?,
  _ g: @escaping (B) throws -> C?,
  _ h: @escaping (C) throws -> D?,
  _ i: @escaping (D) throws -> E?
  )
  -> (A) throws -> E? {

    return { (a: A) throws -> E? in
      try f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
    }
}

public func chain<A, B, C, D, E, F>(
  _ f: @escaping (A) throws -> B?,
  _ g: @escaping (B) throws -> C?,
  _ h: @escaping (C) throws -> D?,
  _ i: @escaping (D) throws -> E?,
  _ j: @escaping (E) throws -> F?
  )
  -> (A) throws -> F? {

    return { (a: A) throws -> F? in
      try f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
    }
}

public func chain<A, B, C, D, E, F, G>(
  _ f: @escaping (A) throws -> B?,
  _ g: @escaping (B) throws -> C?,
  _ h: @escaping (C) throws -> D?,
  _ i: @escaping (D) throws -> E?,
  _ j: @escaping (E) throws -> F?,
  _ k: @escaping (F) throws -> G?
  )
  -> (A) throws -> G? {

    return { (a: A) throws -> G? in
      try f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
        .flatMap(k)
    }
}

/// Forward composition of functions that return arrays.
///
/// - Parameters:
///   - f: A function that takes a value in `A` and returns an array of `B`s.
///   - g: A function that takes a value in `B` and returns an array of `C`s.
/// - Returns: A new function that takes a value in `A` and returns an array of `C`s.
public func chain<A, B, C>(
  _ f: @escaping (A) -> [B],
  _ g: @escaping (B) -> [C]
  )
  -> (A) -> [C] {

    return { (a: A) -> [C] in
      f(a).flatMap(g)
    }
}

public func chain<A, B, C, D>(
  _ f: @escaping (A) -> [B],
  _ g: @escaping (B) -> [C],
  _ h: @escaping (C) -> [D]
  )
  -> (A) -> [D] {

    return { (a: A) -> [D] in
      f(a)
        .flatMap(g)
        .flatMap(h)
    }
}

public func chain<A, B, C, D, E>(
  _ f: @escaping (A) -> [B],
  _ g: @escaping (B) -> [C],
  _ h: @escaping (C) -> [D],
  _ i: @escaping (D) -> [E]
  )
  -> (A) -> [E] {

    return { (a: A) -> [E] in
      f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
    }
}

public func chain<A, B, C, D, E, F>(
  _ f: @escaping (A) -> [B],
  _ g: @escaping (B) -> [C],
  _ h: @escaping (C) -> [D],
  _ i: @escaping (D) -> [E],
  _ j: @escaping (E) -> [F]
  )
  -> (A) -> [F] {

    return { (a: A) -> [F] in
      f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
    }
}

public func chain<A, B, C, D, E, F, G>(
  _ f: @escaping (A) -> [B],
  _ g: @escaping (B) -> [C],
  _ h: @escaping (C) -> [D],
  _ i: @escaping (D) -> [E],
  _ j: @escaping (E) -> [F],
  _ k: @escaping (F) -> [G]
  )
  -> (A) -> [G] {

    return { (a: A) -> [G] in
      f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
        .flatMap(k)
    }
}

public func chain<A, B, C>(
  _ f: @escaping (A) throws -> [B],
  _ g: @escaping (B) throws -> [C]
  )
  -> (A) throws -> [C] {

    return { (a: A) throws -> [C] in
      try f(a).flatMap(g)
    }
}

public func chain<A, B, C, D>(
  _ f: @escaping (A) throws -> [B],
  _ g: @escaping (B) throws -> [C],
  _ h: @escaping (C) throws -> [D]
  )
  -> (A) throws -> [D] {

    return { (a: A) throws -> [D] in
      try f(a)
        .flatMap(g)
        .flatMap(h)
    }
}

public func chain<A, B, C, D, E>(
  _ f: @escaping (A) throws -> [B],
  _ g: @escaping (B) throws -> [C],
  _ h: @escaping (C) throws -> [D],
  _ i: @escaping (D) throws -> [E]
  )
  -> (A) throws -> [E] {

    return { (a: A) throws -> [E] in
      try f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
    }
}

public func chain<A, B, C, D, E, F>(
  _ f: @escaping (A) throws -> [B],
  _ g: @escaping (B) throws -> [C],
  _ h: @escaping (C) throws -> [D],
  _ i: @escaping (D) throws -> [E],
  _ j: @escaping (E) throws -> [F]
  )
  -> (A) throws -> [F] {

    return { (a: A) throws -> [F] in
      try f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
    }
}

public func chain<A, B, C, D, E, F, G>(
  _ f: @escaping (A) throws -> [B],
  _ g: @escaping (B) throws -> [C],
  _ h: @escaping (C) throws -> [D],
  _ i: @escaping (D) throws -> [E],
  _ j: @escaping (E) throws -> [F],
  _ k: @escaping (F) throws -> [G]
  )
  -> (A) throws -> [G] {

    return { (a: A) throws -> [G] in
      try f(a)
        .flatMap(g)
        .flatMap(h)
        .flatMap(i)
        .flatMap(j)
        .flatMap(k)
    }
}

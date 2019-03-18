@inlinable
public func zip<A, B, C>(
  _ a: A,
  _ b: B,
  _ c: C
  )
  -> Zip3Sequence<A, B, C> {
    return Zip3Sequence(a, b, c)
}

@inlinable
public func zip<A, B, C, D>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D
  )
  -> Zip4Sequence<A, B, C, D> {
    return Zip4Sequence(a, b, c, d)
}

@inlinable
public func zip<A, B, C, D, E>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E
  )
  -> Zip5Sequence<A, B, C, D, E> {
    return Zip5Sequence(a, b, c, d, e)
}

@inlinable
public func zip<A, B, C, D, E, F>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F
  )
  -> Zip6Sequence<A, B, C, D, E, F> {
    return Zip6Sequence(a, b, c, d, e, f)
}

@inlinable
public func zip<A, B, C, D, E, F, G>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G
  )
  -> Zip7Sequence<A, B, C, D, E, F, G> {
    return Zip7Sequence(a, b, c, d, e, f, g)
}

@inlinable
public func zip<A, B, C, D, E, F, G, H>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H
  )
  -> Zip8Sequence<A, B, C, D, E, F, G, H> {
    return Zip8Sequence(a, b, c, d, e, f, g, h)
}

@inlinable
public func zip<A, B, C, D, E, F, G, H, I>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I
  )
  -> Zip9Sequence<A, B, C, D, E, F, G, H, I> {
    return Zip9Sequence(a, b, c, d, e, f, g, h, i)
}

@inlinable
public func zip<A, B, C, D, E, F, G, H, I, J>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I,
  _ j: J
  )
  -> Zip10Sequence<A, B, C, D, E, F, G, H, I, J> {
    return Zip10Sequence(a, b, c, d, e, f, g, h, i, j)
}

public struct Zip3Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C

  @inlinable
  public init(_ a: A, _ b: B, _ c: C) {
    _a = a
    _b = b
    _c = c
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator()
    )
  }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C
  >(
  with f: @escaping (A.Element, B.Element) -> C
  )
  -> (A, B) -> [C] {
    return { zip($0, $1).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D
  >(
  with f: @escaping (A.Element, B.Element, C.Element) -> D
  )
  -> (A, B, C) -> [D] {
    return { zip($0, $1, $2).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E
  >(
  with f: @escaping (A.Element, B.Element, C.Element, D.Element) -> E
  )
  -> (A, B, C, D) -> [E] {
    return { zip($0, $1, $2, $3).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F
  >(
  with f: @escaping (A.Element, B.Element, C.Element, D.Element, E.Element) -> F
  )
  -> (A, B, C, D, E) -> [F] {
    return { zip($0, $1, $2, $3, $4).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G
  >(
  with f: @escaping (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element) -> G
  )
  -> (A, B, C, D, E, F) -> [G] {
    return { zip($0, $1, $2, $3, $4, $5).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence,
  H
  >(
  with f: @escaping (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element) -> H
  )
  -> (A, B, C, D, E, F, G) -> [H] {
    return { zip($0, $1, $2, $3, $4, $5, $6).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence,
  H: Sequence,
  I
  >(
  with f: @escaping (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element, H.Element) -> I
  )
  -> (A, B, C, D, E, F, G, H) -> [I] {
    return { zip($0, $1, $2, $3, $4, $5, $6, $7).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence,
  H: Sequence,
  I: Sequence,
  J
  >(
  with f: @escaping (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element, H.Element, I.Element) -> J
  )
  -> (A, B, C, D, E, F, G, H, I) -> [J] {
    return { zip($0, $1, $2, $3, $4, $5, $6, $7, $8).map(f) }
}

@inlinable
public func zip<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence,
  H: Sequence,
  I: Sequence,
  J: Sequence,
  K
  >(
  with f: @escaping (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element, H.Element, I.Element, J.Element) -> K
  )
  -> (A, B, C, D, E, F, G, H, I, J) -> [K] {
    return { zip($0, $1, $2, $3, $4, $5, $6, $7, $8, $9).map(f) }
}

public struct Zip4Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C
  @usableFromInline internal let _d: D

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D) {
    _a = a
    _b = b
    _c = c
    _d = d
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _baseStreamD: D.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator,
      _ iteratorD: D.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
      _baseStreamD = iteratorD
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element,
      D.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next(),
        let d = _baseStreamD.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c, d)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator(),
      _d.makeIterator()
    )
  }
}

public struct Zip5Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C
  @usableFromInline internal let _d: D
  @usableFromInline internal let _e: E

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _baseStreamD: D.Iterator
    @usableFromInline internal var _baseStreamE: E.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator,
      _ iteratorD: D.Iterator,
      _ iteratorE: E.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
      _baseStreamD = iteratorD
      _baseStreamE = iteratorE
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element,
      D.Element,
      E.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next(),
        let d = _baseStreamD.next(),
        let e = _baseStreamE.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c, d, e)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator(),
      _d.makeIterator(),
      _e.makeIterator()
    )
  }
}

public struct Zip6Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C
  @usableFromInline internal let _d: D
  @usableFromInline internal let _e: E
  @usableFromInline internal let _f: F

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
    _f = f
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _baseStreamD: D.Iterator
    @usableFromInline internal var _baseStreamE: E.Iterator
    @usableFromInline internal var _baseStreamF: F.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator,
      _ iteratorD: D.Iterator,
      _ iteratorE: E.Iterator,
      _ iteratorF: F.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
      _baseStreamD = iteratorD
      _baseStreamE = iteratorE
      _baseStreamF = iteratorF
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element,
      D.Element,
      E.Element,
      F.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next(),
        let d = _baseStreamD.next(),
        let e = _baseStreamE.next(),
        let f = _baseStreamF.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c, d, e, f)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator(),
      _d.makeIterator(),
      _e.makeIterator(),
      _f.makeIterator()
    )
  }
}

public struct Zip7Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C
  @usableFromInline internal let _d: D
  @usableFromInline internal let _e: E
  @usableFromInline internal let _f: F
  @usableFromInline internal let _g: G

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
    _f = f
    _g = g
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _baseStreamD: D.Iterator
    @usableFromInline internal var _baseStreamE: E.Iterator
    @usableFromInline internal var _baseStreamF: F.Iterator
    @usableFromInline internal var _baseStreamG: G.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator,
      _ iteratorD: D.Iterator,
      _ iteratorE: E.Iterator,
      _ iteratorF: F.Iterator,
      _ iteratorG: G.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
      _baseStreamD = iteratorD
      _baseStreamE = iteratorE
      _baseStreamF = iteratorF
      _baseStreamG = iteratorG
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element,
      D.Element,
      E.Element,
      F.Element,
      G.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next(),
        let d = _baseStreamD.next(),
        let e = _baseStreamE.next(),
        let f = _baseStreamF.next(),
        let g = _baseStreamG.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c, d, e, f, g)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator(),
      _d.makeIterator(),
      _e.makeIterator(),
      _f.makeIterator(),
      _g.makeIterator()
    )
  }
}

public struct Zip8Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence,
  H: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C
  @usableFromInline internal let _d: D
  @usableFromInline internal let _e: E
  @usableFromInline internal let _f: F
  @usableFromInline internal let _g: G
  @usableFromInline internal let _h: H

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
    _f = f
    _g = g
    _h = h
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _baseStreamD: D.Iterator
    @usableFromInline internal var _baseStreamE: E.Iterator
    @usableFromInline internal var _baseStreamF: F.Iterator
    @usableFromInline internal var _baseStreamG: G.Iterator
    @usableFromInline internal var _baseStreamH: H.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator,
      _ iteratorD: D.Iterator,
      _ iteratorE: E.Iterator,
      _ iteratorF: F.Iterator,
      _ iteratorG: G.Iterator,
      _ iteratorH: H.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
      _baseStreamD = iteratorD
      _baseStreamE = iteratorE
      _baseStreamF = iteratorF
      _baseStreamG = iteratorG
      _baseStreamH = iteratorH
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element,
      D.Element,
      E.Element,
      F.Element,
      G.Element,
      H.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next(),
        let d = _baseStreamD.next(),
        let e = _baseStreamE.next(),
        let f = _baseStreamF.next(),
        let g = _baseStreamG.next(),
        let h = _baseStreamH.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c, d, e, f, g, h)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator(),
      _d.makeIterator(),
      _e.makeIterator(),
      _f.makeIterator(),
      _g.makeIterator(),
      _h.makeIterator()
    )
  }
}

public struct Zip9Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence,
  H: Sequence,
  I: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C
  @usableFromInline internal let _d: D
  @usableFromInline internal let _e: E
  @usableFromInline internal let _f: F
  @usableFromInline internal let _g: G
  @usableFromInline internal let _h: H
  @usableFromInline internal let _i: I

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
    _f = f
    _g = g
    _h = h
    _i = i
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _baseStreamD: D.Iterator
    @usableFromInline internal var _baseStreamE: E.Iterator
    @usableFromInline internal var _baseStreamF: F.Iterator
    @usableFromInline internal var _baseStreamG: G.Iterator
    @usableFromInline internal var _baseStreamH: H.Iterator
    @usableFromInline internal var _baseStreamI: I.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator,
      _ iteratorD: D.Iterator,
      _ iteratorE: E.Iterator,
      _ iteratorF: F.Iterator,
      _ iteratorG: G.Iterator,
      _ iteratorH: H.Iterator,
      _ iteratorI: I.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
      _baseStreamD = iteratorD
      _baseStreamE = iteratorE
      _baseStreamF = iteratorF
      _baseStreamG = iteratorG
      _baseStreamH = iteratorH
      _baseStreamI = iteratorI
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element,
      D.Element,
      E.Element,
      F.Element,
      G.Element,
      H.Element,
      I.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next(),
        let d = _baseStreamD.next(),
        let e = _baseStreamE.next(),
        let f = _baseStreamF.next(),
        let g = _baseStreamG.next(),
        let h = _baseStreamH.next(),
        let i = _baseStreamI.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c, d, e, f, g, h, i)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator(),
      _d.makeIterator(),
      _e.makeIterator(),
      _f.makeIterator(),
      _g.makeIterator(),
      _h.makeIterator(),
      _i.makeIterator()
    )
  }
}

public struct Zip10Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence,
  E: Sequence,
  F: Sequence,
  G: Sequence,
  H: Sequence,
  I: Sequence,
  J: Sequence
>: Sequence {
  @usableFromInline internal let _a: A
  @usableFromInline internal let _b: B
  @usableFromInline internal let _c: C
  @usableFromInline internal let _d: D
  @usableFromInline internal let _e: E
  @usableFromInline internal let _f: F
  @usableFromInline internal let _g: G
  @usableFromInline internal let _h: H
  @usableFromInline internal let _i: I
  @usableFromInline internal let _j: J

  @inlinable
  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H, _ i: I, _ j: J) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
    _f = f
    _g = g
    _h = h
    _i = i
    _j = j
  }

  public struct Iterator: IteratorProtocol {
    @usableFromInline internal var _baseStreamA: A.Iterator
    @usableFromInline internal var _baseStreamB: B.Iterator
    @usableFromInline internal var _baseStreamC: C.Iterator
    @usableFromInline internal var _baseStreamD: D.Iterator
    @usableFromInline internal var _baseStreamE: E.Iterator
    @usableFromInline internal var _baseStreamF: F.Iterator
    @usableFromInline internal var _baseStreamG: G.Iterator
    @usableFromInline internal var _baseStreamH: H.Iterator
    @usableFromInline internal var _baseStreamI: I.Iterator
    @usableFromInline internal var _baseStreamJ: J.Iterator
    @usableFromInline internal var _reachedEnd: Bool = false

    @usableFromInline
    internal init(
      _ iteratorA: A.Iterator,
      _ iteratorB: B.Iterator,
      _ iteratorC: C.Iterator,
      _ iteratorD: D.Iterator,
      _ iteratorE: E.Iterator,
      _ iteratorF: F.Iterator,
      _ iteratorG: G.Iterator,
      _ iteratorH: H.Iterator,
      _ iteratorI: I.Iterator,
      _ iteratorJ: J.Iterator
      ) {
      _baseStreamA = iteratorA
      _baseStreamB = iteratorB
      _baseStreamC = iteratorC
      _baseStreamD = iteratorD
      _baseStreamE = iteratorE
      _baseStreamF = iteratorF
      _baseStreamG = iteratorG
      _baseStreamH = iteratorH
      _baseStreamI = iteratorI
      _baseStreamJ = iteratorJ
    }

    public typealias Element = (
      A.Element,
      B.Element,
      C.Element,
      D.Element,
      E.Element,
      F.Element,
      G.Element,
      H.Element,
      I.Element,
      J.Element
    )

    @inlinable
    public mutating func next() -> Element? {
      if _reachedEnd {
        return nil
      }

      guard
        let a = _baseStreamA.next(),
        let b = _baseStreamB.next(),
        let c = _baseStreamC.next(),
        let d = _baseStreamD.next(),
        let e = _baseStreamE.next(),
        let f = _baseStreamF.next(),
        let g = _baseStreamG.next(),
        let h = _baseStreamH.next(),
        let i = _baseStreamI.next(),
        let j = _baseStreamJ.next()
        else {
          _reachedEnd = true
          return nil
      }

      return (a, b, c, d, e, f, g, h, i, j)
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator(),
      _d.makeIterator(),
      _e.makeIterator(),
      _f.makeIterator(),
      _g.makeIterator(),
      _h.makeIterator(),
      _i.makeIterator(),
      _j.makeIterator()
    )
  }
}

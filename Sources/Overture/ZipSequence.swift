public func zip<A, B, C>(
  _ a: A,
  _ b: B,
  _ c: C
  ) -> Zip3Sequence<A, B, C> {
  return Zip3Sequence(a, b, c)
}

public func zip<A, B, C, Z>(
  with transform: (A.Element, B.Element, C.Element) -> Z,
  _ a: A,
  _ b: B,
  _ c: C
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence {
    return zip(a, b, c).map(transform)
}

public func zip<A, B, C, D>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D
  ) -> Zip4Sequence<A, B, C, D> {
  return Zip4Sequence(a, b, c, d)
}

public func zip<A, B, C, D, Z>(
  with transform: (A.Element, B.Element, C.Element, D.Element) -> Z,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence, D: Sequence {
    return zip(a, b, c, d).map(transform)
}

public func zip<A, B, C, D, E>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E
  ) -> Zip5Sequence<A, B, C, D, E> {
  return Zip5Sequence(a, b, c, d, e)
}

public func zip<A, B, C, D, E, Z>(
  with transform: (A.Element, B.Element, C.Element, D.Element, E.Element) -> Z,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence, D: Sequence, E: Sequence {
    return zip(a, b, c, d, e).map(transform)
}

public func zip<A, B, C, D, E, F>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F
  ) -> Zip6Sequence<A, B, C, D, E, F> {
  return Zip6Sequence(a, b, c, d, e, f)
}

public func zip<A, B, C, D, E, F, Z>(
  with transform: (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element) -> Z,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence, D: Sequence, E: Sequence, F: Sequence {
    return zip(a, b, c, d, e, f).map(transform)
}

public func zip<A, B, C, D, E, F, G>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G
  ) -> Zip7Sequence<A, B, C, D, E, F, G> {
  return Zip7Sequence(a, b, c, d, e, f, g)
}

public func zip<A, B, C, D, E, F, G, Z>(
  with transform: (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element) -> Z,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence, D: Sequence, E: Sequence, F: Sequence, G: Sequence {
    return zip(a, b, c, d, e, f, g).map(transform)
}

public func zip<A, B, C, D, E, F, G, H>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H
  ) -> Zip8Sequence<A, B, C, D, E, F, G, H> {
  return Zip8Sequence(a, b, c, d, e, f, g, h)
}

public func zip<A, B, C, D, E, F, G, H, Z>(
  with transform: (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element, H.Element) -> Z,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence, D: Sequence, E: Sequence, F: Sequence, G: Sequence, H: Sequence {
    return zip(a, b, c, d, e, f, g, h).map(transform)
}

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
  ) -> Zip9Sequence<A, B, C, D, E, F, G, H, I> {
  return Zip9Sequence(a, b, c, d, e, f, g, h, i)
}

public func zip<A, B, C, D, E, F, G, H, I, Z>(
  with transform: (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element, H.Element, I.Element) -> Z,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence, D: Sequence, E: Sequence, F: Sequence, G: Sequence, H: Sequence, I: Sequence {
    return zip(a, b, c, d, e, f, g, h, i).map(transform)
}

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
  ) -> Zip10Sequence<A, B, C, D, E, F, G, H, I, J> {
  return Zip10Sequence(a, b, c, d, e, f, g, h, i, j)
}

public func zip<A, B, C, D, E, F, G, H, I, J, Z>(
  with transform: (A.Element, B.Element, C.Element, D.Element, E.Element, F.Element, G.Element, H.Element, I.Element, J.Element) -> Z,
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
  ) -> [Z]
  where A: Sequence, B: Sequence, C: Sequence, D: Sequence, E: Sequence, F: Sequence, G: Sequence, H: Sequence, I: Sequence, J: Sequence {
    return zip(a, b, c, d, e, f, g, h, i, j).map(transform)
}

public struct Zip3Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence
>: Sequence {
  internal let _a: A
  internal let _b: B
  internal let _c: C

  public init(_ a: A, _ b: B, _ c: C) {
    _a = a
    _b = b
    _c = c
  }

  public struct Iterator: IteratorProtocol {
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _reachedEnd: Bool = false

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

  public func makeIterator() -> Iterator {
    return Iterator(
      _a.makeIterator(),
      _b.makeIterator(),
      _c.makeIterator()
    )
  }
}

public struct Zip4Sequence<
  A: Sequence,
  B: Sequence,
  C: Sequence,
  D: Sequence
>: Sequence {
  internal let _a: A
  internal let _b: B
  internal let _c: C
  internal let _d: D

  public init(_ a: A, _ b: B, _ c: C, _ d: D) {
    _a = a
    _b = b
    _c = c
    _d = d
  }

  public struct Iterator: IteratorProtocol {
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _baseStreamD: D.Iterator
    internal var _reachedEnd: Bool = false

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
  internal let _a: A
  internal let _b: B
  internal let _c: C
  internal let _d: D
  internal let _e: E

  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
  }

  public struct Iterator: IteratorProtocol {
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _baseStreamD: D.Iterator
    internal var _baseStreamE: E.Iterator
    internal var _reachedEnd: Bool = false

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
  internal let _a: A
  internal let _b: B
  internal let _c: C
  internal let _d: D
  internal let _e: E
  internal let _f: F

  public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) {
    _a = a
    _b = b
    _c = c
    _d = d
    _e = e
    _f = f
  }

  public struct Iterator: IteratorProtocol {
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _baseStreamD: D.Iterator
    internal var _baseStreamE: E.Iterator
    internal var _baseStreamF: F.Iterator
    internal var _reachedEnd: Bool = false

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
  internal let _a: A
  internal let _b: B
  internal let _c: C
  internal let _d: D
  internal let _e: E
  internal let _f: F
  internal let _g: G

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
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _baseStreamD: D.Iterator
    internal var _baseStreamE: E.Iterator
    internal var _baseStreamF: F.Iterator
    internal var _baseStreamG: G.Iterator
    internal var _reachedEnd: Bool = false

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
  internal let _a: A
  internal let _b: B
  internal let _c: C
  internal let _d: D
  internal let _e: E
  internal let _f: F
  internal let _g: G
  internal let _h: H

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
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _baseStreamD: D.Iterator
    internal var _baseStreamE: E.Iterator
    internal var _baseStreamF: F.Iterator
    internal var _baseStreamG: G.Iterator
    internal var _baseStreamH: H.Iterator
    internal var _reachedEnd: Bool = false

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
  internal let _a: A
  internal let _b: B
  internal let _c: C
  internal let _d: D
  internal let _e: E
  internal let _f: F
  internal let _g: G
  internal let _h: H
  internal let _i: I

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
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _baseStreamD: D.Iterator
    internal var _baseStreamE: E.Iterator
    internal var _baseStreamF: F.Iterator
    internal var _baseStreamG: G.Iterator
    internal var _baseStreamH: H.Iterator
    internal var _baseStreamI: I.Iterator
    internal var _reachedEnd: Bool = false

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
  internal let _a: A
  internal let _b: B
  internal let _c: C
  internal let _d: D
  internal let _e: E
  internal let _f: F
  internal let _g: G
  internal let _h: H
  internal let _i: I
  internal let _j: J

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
    internal var _baseStreamA: A.Iterator
    internal var _baseStreamB: B.Iterator
    internal var _baseStreamC: C.Iterator
    internal var _baseStreamD: D.Iterator
    internal var _baseStreamE: E.Iterator
    internal var _baseStreamF: F.Iterator
    internal var _baseStreamG: G.Iterator
    internal var _baseStreamH: H.Iterator
    internal var _baseStreamI: I.Iterator
    internal var _baseStreamJ: J.Iterator
    internal var _reachedEnd: Bool = false

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

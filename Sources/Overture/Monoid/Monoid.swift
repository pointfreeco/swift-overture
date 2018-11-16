// TODO: PR separately, maybe with const and absurd too?
public func id<A>(_ a: A) -> A {
  return a
}

// TODO: should the generic be M?
public struct Monoid<A> {
  public let empty: A
  public let semigroup: Semigroup<A>

  public func concat<S: Sequence>(_ xs: S) -> A where S.Element == A {
    return with(xs, self.foldMap(id))
  }

  public func foldMap<S: Sequence>(_ f: @escaping (S.Element) -> A) -> (S) -> A where S.Element == A {
    return { xs in
      xs.reduce(into: self.empty) { accum, x in self.semigroup.mcombine(&accum, f(x)) }
    }
  }
}

extension Monoid where A: RangeReplaceableCollection {
  public static var array: Monoid<A> {
    return Monoid<A>(empty: .init(), semigroup: .array)
  }
}

extension Monoid where A: Numeric {
  public static var sum: Monoid {
    return Monoid(empty: 0, semigroup: .sum)
  }

  public static var product: Monoid {
    return Monoid(empty: 1, semigroup: .product)
  }
}

extension Monoid where A == Bool {
  public static let any = Monoid(empty: false, semigroup: .any)
  public static let all = Monoid(empty: true, semigroup: .all)
}

extension Monoid {
  public static func pointwise<A0>(into witness: Monoid<A>) -> Monoid<(A0) -> A> {
    return Monoid<(A0) -> A>(
      empty: { (a0: A0) in witness.empty },
      semigroup: Semigroup<A>.pointwise(into: witness.semigroup)
    )
  }
}

extension Monoid {
  public static var endo: Monoid<(A) -> A> {
    return Monoid<(A) -> A>(
      empty: { $0 },
      semigroup: .endo()
    )
  }
}

extension Monoid where A: Comparable & FixedWidthInteger {
  public static var max: Monoid<A> {
    return Monoid<A>(empty: .min, semigroup: .max)
  }
}

extension Monoid where A: Comparable & FloatingPoint {
  public static var max: Monoid<A> {
    return Monoid<A>(empty: -.greatestFiniteMagnitude, semigroup: .max)
  }
}

extension Monoid where A: Comparable & FixedWidthInteger {
  public static var min: Monoid<A> {
    return Monoid<A>(empty: .max, semigroup: .min)
  }
}

extension Monoid where A: Comparable & FloatingPoint {
  public static var min: Monoid<A> {
    return Monoid<A>(empty: .greatestFiniteMagnitude, semigroup: .min)
  }
}

extension Monoid {
  public static func optional(_ witness: Semigroup<A>) -> Monoid<A?> {
    return Monoid<A?>(empty: nil, semigroup: Semigroup<A?>.init { lhs, rhs -> Void in
      // TODO: better way?
      guard lhs != nil, let rhs1 = rhs else { lhs = lhs ?? rhs; return }
      witness.mcombine(&lhs!, rhs1)
    })
  }
}

extension Monoid {
  public static func last<B>() -> Monoid<B?> {
    return Monoid<B?>(empty: nil, semigroup: .last())
  }
  public static func first<B>() -> Monoid<B?> {
    return Monoid<B?>(empty: nil, semigroup: .first())
  }
}

extension Monoid {
  public static func tuple2<B, C>(_ b: Monoid<B>, _ c: Monoid<C>) -> Monoid<(B, C)> {
    return Monoid<(B, C)>(empty: (b.empty, c.empty), semigroup: .tuple2(b.semigroup, c.semigroup))
  }
}

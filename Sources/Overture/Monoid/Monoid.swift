public struct Monoid<A> {
  public let empty: A
  public let semigroup: Semigroup<A>

  public func concat<S: Sequence>(_ xs: S) -> A where S.Element == A {
    return xs.reduce(into: self.empty, self.semigroup.mcombine)
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
      semigroup: Semigroup<A>.endo
    )
  }
}

extension Monoid where A: Comparable & FixedWidthInteger {
  public static var max: Monoid<A> {
    return Monoid<A>.init(empty: .min, semigroup: .max)
  }
}

extension Monoid where A: Comparable & FloatingPoint {
  public static var max: Monoid<A> {
    return Monoid<A>.init(empty: -.greatestFiniteMagnitude, semigroup: .max)
  }
}

extension Monoid where A: Comparable & FixedWidthInteger {
  public static var min: Monoid<A> {
    return Monoid<A>.init(empty: .max, semigroup: .min)
  }
}

extension Monoid where A: Comparable & FloatingPoint {
  public static var min: Monoid<A> {
    return Monoid<A>.init(empty: .greatestFiniteMagnitude, semigroup: .min)
  }
}

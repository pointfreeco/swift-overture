// TODO: should the generic be S?
public struct Semigroup<A> {
  public let combine: (A, A) -> A
  public let mcombine: (inout A, A) -> Void

  // TODO: should we make this a named param for when we don't want to use trailng syntax and be super clear?
  public init(_ combine: @escaping (A, A) -> A) {
    self.combine = combine
    self.mcombine = { accum, a in
      let result = combine(accum, a)
      accum = result
    }
  }

  public init(_ mcombine: @escaping (inout A, A) -> Void) {
    self.mcombine = mcombine
    self.combine = { accum, a in
      var copy = accum
      mcombine(&copy, a)
      return copy
    }
  }

  public func concat<S: Sequence>(_ initialValue: S.Element, _ xs: S) -> A where S.Element == A {
    return xs.reduce(into: initialValue, self.mcombine)
  }
}

extension Semigroup where A: RangeReplaceableCollection {
  public static var array: Semigroup<A> {
    return Semigroup<A> { $0.append(contentsOf: $1) }
  }
}

extension Semigroup {
  public static func pointwise<A0>(into witness: Semigroup<A>) -> Semigroup<(A0) -> A> {
    return Semigroup<(A0) -> A> { lhs, rhs in
      return { a0 in
        witness.combine(lhs(a0), rhs(a0))
      }
    }
  }
}

extension Semigroup where A: Numeric {
  public static var sum: Semigroup {
    return Semigroup(+)
  }

  public static var product: Semigroup {
    return Semigroup(*)
  }
}

extension Semigroup where A == Bool {
  public static let any = Semigroup { $0 || $1 }
  public static let all = Semigroup { $0 && $1 }
}

extension Semigroup {
  public static func endo<B>() -> Semigroup<(B) -> B> {
    return Semigroup<(B) -> B> { lhs, rhs in
      return { a in rhs(lhs(a)) }
    }
  }
}

extension Semigroup where A: Comparable {
  public static var max: Semigroup<A> {
    return Semigroup<A>(Swift.max)
  }
}

extension Semigroup where A: Comparable {
  public static var min: Semigroup<A> {
    return Semigroup<A>(Swift.min)
  }
}

extension Semigroup {
  public static func last<B>() -> Semigroup<B?> {
    return Semigroup<B?> { $1 ?? $0 }
  }
  public static func first<B>() -> Semigroup<B?> {
    return Semigroup<B?> { $0 ?? $1 }
  }
}


public struct Average<A: BinaryFloatingPoint> {
  let count: Int
  let sum: A

  public var average: A? {
    return self.count == 0 ? nil : .some(sum / A(count))
  }
}

extension Average {
  public init(value: A) {
    self.count = 1
    self.sum = value
  }
}

extension Semigroup {
  public static func average<B>() -> Semigroup<Average<B>> {
    return Semigroup<Average<B>> { lhs, rhs in
      Average(count: lhs.count + rhs.count, sum: lhs.sum + rhs.sum)
    }
  }
}

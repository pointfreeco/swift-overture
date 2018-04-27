
public func id<A>(_ a: A) -> A {
  return a
}

public func const<A, B>(_ a: A) -> (B) -> A {
  return { _ in a }
}

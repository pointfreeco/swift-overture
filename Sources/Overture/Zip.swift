public func zip2<A, B>(_ a: [A], _ b: [B]) -> [(A, B)] {
  return Array(zip(a, b))
}

public func zip2<A, B, C>(with transform: @escaping (A, B) -> C) -> ([A], [B]) -> [C] {
  return { zip2($0, $1).map(transform) }
}

public func zip3<A, B, C>(_ a: [A], _ b: [B], _ c: [C]) -> [(A, B, C)] {
  return zip2(a, zip2(b, c)).map { ($0, $1.0, $1.1) }
}

public func zip3<A, B, C, D>(with transform: @escaping (A, B, C) -> D) -> ([A], [B], [C]) -> [D] {
  return { zip3($0, $1, $2).map(transform) }
}

public func zip4<A, B, C, D>(_ a: [A], _ b: [B], _ c: [C], _ d: [D]) -> [(A, B, C, D)] {
  return zip2(a, zip3(b, c, d)).map { ($0, $1.0, $1.1, $1.2) }
}

public func zip4<A, B, C, D, E>(with transform: @escaping (A, B, C, D) -> E) -> ([A], [B], [C], [D]) -> [E] {
  return { zip4($0, $1, $2, $3).map(transform) }
}

public func zip5<A, B, C, D, E>(_ a: [A], _ b: [B], _ c: [C], _ d: [D], _ e: [E]) -> [(A, B, C, D, E)] {
  return zip2(a, zip4(b, c, d, e)).map { ($0, $1.0, $1.1, $1.2, $1.3) }
}

public func zip5<A, B, C, D, E, F>(with transform: @escaping (A, B, C, D, E) -> F)
  -> ([A], [B], [C], [D], [E]) -> [F] {
    return { zip5($0, $1, $2, $3, $4).map(transform) }
}

public func zip6<A, B, C, D, E, F>(_ a: [A], _ b: [B], _ c: [C], _ d: [D], _ e: [E], _ f: [F])
  -> [(A, B, C, D, E, F)] {
    return zip2(a, zip5(b, c, d, e, f)).map { ($0, $1.0, $1.1, $1.2, $1.3, $1.4) }
}

public func zip6<A, B, C, D, E, F, G>(with transform: @escaping (A, B, C, D, E, F) -> G)
  -> ([A], [B], [C], [D], [E], [F]) -> [G] {
    return { zip6($0, $1, $2, $3, $4, $5).map(transform) }
}

public func zip2<A, B>(_ a: A?, _ b: B?) -> (A, B)? {
  guard let a = a, let b = b else { return nil }
  return (a, b)
}

public func zip2<A, B, C>(with transform: @escaping (A, B) -> C) -> (A?, B?) -> C? {
  return { zip2($0, $1).map(transform) }
}

public func zip3<A, B, C>(_ a: A?, _ b: B?, _ c: C?) -> (A, B, C)? {
  return zip2(a, zip2(b, c)).map { ($0, $1.0, $1.1) }
}

public func zip3<A, B, C, D>(with transform: @escaping (A, B, C) -> D) -> (A?, B?, C?) -> D? {
  return { zip3($0, $1, $2).map(transform) }
}

public func zip4<A, B, C, D>(_ a: A?, _ b: B?, _ c: C?, _ d: D?) -> (A, B, C, D)? {
  return zip2(a, zip3(b, c, d)).map { ($0, $1.0, $1.1, $1.2) }
}

public func zip4<A, B, C, D, E>(with transform: @escaping (A, B, C, D) -> E) -> (A?, B?, C?, D?) -> E? {
  return { zip4($0, $1, $2, $3).map(transform) }
}

public func zip5<A, B, C, D, E>(_ a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?) -> (A, B, C, D, E)? {
  return zip2(a, zip4(b, c, d, e)).map { ($0, $1.0, $1.1, $1.2, $1.3) }
}

public func zip5<A, B, C, D, E, F>(with transform: @escaping (A, B, C, D, E) -> F)
  -> (A?, B?, C?, D?, E?) -> F? {
    return { zip5($0, $1, $2, $3, $4).map(transform) }
}

public func zip6<A, B, C, D, E, F>(_ a: A?, _ b: B?, _ c: C?, _ d: D?, _ e: E?, _ f: F?)
  -> (A, B, C, D, E, F)? {
    return zip2(a, zip5(b, c, d, e, f)).map { ($0, $1.0, $1.1, $1.2, $1.3, $1.4) }
}

public func zip6<A, B, C, D, E, F, G>(with transform: @escaping (A, B, C, D, E, F) -> G)
  -> (A?, B?, C?, D?, E?, F?) -> G? {
    return { zip6($0, $1, $2, $3, $4, $5).map(transform) }
}

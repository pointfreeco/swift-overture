public func zip<A, B, C>(
  _ a: A?,
  _ b: B?,
  _ c: C?
  ) -> (A, B, C)? {
  return zip(zip(a, b), c).map { ($0.0, $0.1, $1) }
}

public func zip<A, B, C, Z>(
  with transform: @escaping (A, B, C) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?
  ) -> Z? {
  return zip(a, b, c).map(transform)
}

public func zip<A, B, C, D>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?
  ) -> (A, B, C, D)? {
  return zip(zip(a, b), c, d).map { ($0.0, $0.1, $1, $2) }
}

public func zip<A, B, C, D, Z>(
  with transform: @escaping (A, B, C, D) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?
  ) -> Z? {
  return zip(a, b, c, d).map(transform)
}

public func zip<A, B, C, D, E>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?
  ) -> (A, B, C, D, E)? {
  return zip(zip(a, b), c, d, e).map { ($0.0, $0.1, $1, $2, $3) }
}

public func zip<A, B, C, D, E, Z>(
  with transform: @escaping (A, B, C, D, E) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?
  ) -> Z? {
  return zip(a, b, c, d, e).map(transform)
}

public func zip<A, B, C, D, E, F>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?
  ) -> (A, B, C, D, E, F)? {
  return zip(zip(a, b), c, d, e, f).map { ($0.0, $0.1, $1, $2, $3, $4) }
}

public func zip<A, B, C, D, E, F, Z>(
  with transform: @escaping (A, B, C, D, E, F) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?
  ) -> Z? {
  return zip(a, b, c, d, e, f).map(transform)
}

public func zip<A, B, C, D, E, F, G>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?
  ) -> (A, B, C, D, E, F, G)? {
  return zip(zip(a, b), c, d, e, f, g).map { ($0.0, $0.1, $1, $2, $3, $4, $5) }
}

public func zip<A, B, C, D, E, F, G, Z>(
  with transform: @escaping (A, B, C, D, E, F, G) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?
  ) -> Z? {
  return zip(a, b, c, d, e, f, g).map(transform)
}

public func zip<A, B, C, D, E, F, G, H>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?
  ) -> (A, B, C, D, E, F, G, H)? {
  return zip(zip(a, b), c, d, e, f, g, h).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6) }
}

public func zip<A, B, C, D, E, F, G, H, Z>(
  with transform: @escaping (A, B, C, D, E, F, G, H) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?
  ) -> Z? {
  return zip(a, b, c, d, e, f, g, h).map(transform)
}

public func zip<A, B, C, D, E, F, G, H, I>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?,
  _ i: I?
  ) -> (A, B, C, D, E, F, G, H, I)? {
  return zip(zip(a, b), c, d, e, f, g, h, i).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6, $7) }
}

public func zip<A, B, C, D, E, F, G, H, I, Z>(
  with transform: @escaping (A, B, C, D, E, F, G, H, I) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?,
  _ i: I?
  ) -> Z? {
  return zip(a, b, c, d, e, f, g, h, i).map(transform)
}

public func zip<A, B, C, D, E, F, G, H, I, J>(
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?,
  _ i: I?,
  _ j: J?
  ) -> (A, B, C, D, E, F, G, H, I, J)? {
  return zip(zip(a, b), c, d, e, f, g, h, i, j).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6, $7, $8) }
}

public func zip<A, B, C, D, E, F, G, H, I, J, Z>(
  with transform: @escaping (A, B, C, D, E, F, G, H, I, J) -> Z,
  _ a: A?,
  _ b: B?,
  _ c: C?,
  _ d: D?,
  _ e: E?,
  _ f: F?,
  _ g: G?,
  _ h: H?,
  _ i: I?,
  _ j: J?
  ) -> Z? {
  return zip(a, b, c, d, e, f, g, h, i, j).map(transform)
}

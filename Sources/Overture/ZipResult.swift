public func zip<A, B, C, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>
  ) -> Result<(A, B, C), Error> {
  return zip(zip(a, b), c).map { ($0.0, $0.1, $1) }
}

public func zip<A, B, C, Z, Error: Swift.Error>(
  with f: (A, B, C) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c).map(f)
}

public func zip<A, B, C, D, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>
  ) -> Result<(A, B, C, D), Error> {
  return zip(zip(a, b), c, d).map { ($0.0, $0.1, $1, $2) }
}

public func zip<A, B, C, D, Z, Error: Swift.Error>(
  with transform: (A, B, C, D) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c, d).map(transform)
}

public func zip<A, B, C, D, E, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>
  ) -> Result<(A, B, C, D, E), Error> {
  return zip(zip(a, b), c, d, e).map { ($0.0, $0.1, $1, $2, $3) }
}

public func zip<A, B, C, D, E, Z, Error: Swift.Error>(
  with transform: @escaping (A, B, C, D, E) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c, d, e).map(transform)
}

public func zip<A, B, C, D, E, F, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>
  ) -> Result<(A, B, C, D, E, F), Error> {
  return zip(zip(a, b), c, d, e, f).map { ($0.0, $0.1, $1, $2, $3, $4) }
}

public func zip<A, B, C, D, E, F, Z, Error: Swift.Error>(
  with transform: @escaping (A, B, C, D, E, F) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c, d, e, f).map(transform)
}

public func zip<A, B, C, D, E, F, G, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>
  ) -> Result<(A, B, C, D, E, F, G), Error> {
  return zip(zip(a, b), c, d, e, f, g).map { ($0.0, $0.1, $1, $2, $3, $4, $5) }
}

public func zip<A, B, C, D, E, F, G, Z, Error: Swift.Error>(
  with transform: @escaping (A, B, C, D, E, F, G) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c, d, e, f, g).map(transform)
}

public func zip<A, B, C, D, E, F, G, H, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>,
  _ h: Result<H, Error>
  ) -> Result<(A, B, C, D, E, F, G, H), Error> {
  return zip(zip(a, b), c, d, e, f, g, h).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6) }
}

public func zip<A, B, C, D, E, F, G, H, Z, Error: Swift.Error>(
  with transform: @escaping (A, B, C, D, E, F, G, H) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>,
  _ h: Result<H, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c, d, e, f, g, h).map(transform)
}

public func zip<A, B, C, D, E, F, G, H, I, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>,
  _ h: Result<H, Error>,
  _ i: Result<I, Error>
  )
  -> Result<(A, B, C, D, E, F, G, H, I), Error> {
    return zip(zip(a, b), c, d, e, f, g, h, i).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6, $7) }
}

public func zip<A, B, C, D, E, F, G, H, I, Z, Error: Swift.Error>(
  with transform: @escaping (A, B, C, D, E, F, G, H, I) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>,
  _ h: Result<H, Error>,
  _ i: Result<I, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c, d, e, f, g, h, i).map(transform)
}

public func zip<A, B, C, D, E, F, G, H, I, J, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>,
  _ h: Result<H, Error>,
  _ i: Result<I, Error>,
  _ j: Result<J, Error>
  ) -> Result<(A, B, C, D, E, F, G, H, I, J), Error> {
  return zip(zip(a, b), c, d, e, f, g, h, i, j).map { ($0.0, $0.1, $1, $2, $3, $4, $5, $6, $7, $8) }
}

public func zip<A, B, C, D, E, F, G, H, I, J, Z, Error: Swift.Error>(
  with transform: @escaping (A, B, C, D, E, F, G, H, I, J) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>,
  _ d: Result<D, Error>,
  _ e: Result<E, Error>,
  _ f: Result<F, Error>,
  _ g: Result<G, Error>,
  _ h: Result<H, Error>,
  _ i: Result<I, Error>,
  _ j: Result<J, Error>
  ) -> Result<Z, Error> {
  return zip(a, b, c, d, e, f, g, h, i, j).map(transform)
}

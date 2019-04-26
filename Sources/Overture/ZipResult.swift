public func zip<A, B, C, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>
  )
  -> Result<(A, B, C), Error> {
    return zip(zip(a, b), c).map { ($0.0, $0.1, $1) }
}

public func zip<A, B, C, Z, Error: Swift.Error>(
  with f: @escaping (A, B, C) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>,
  _ c: Result<C, Error>
  )
  -> Result<Z, Error> {
    return zip(a, b, c).map(f)
}

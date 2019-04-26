/// Transforms a pair of results into an result of a pair.
///
/// - Parameters:
///   - a: A result value.
///   - b: Another result value.
/// - Returns: A result of a pair of values.
public func zip<A, B, Error: Swift.Error>(
  _ a: Result<A, Error>,
  _ b: Result<B, Error>
  ) -> Result<(A, B), Error> {
  return a.flatMap { a in b.map { b in (a, b) } }
}

/// Transforms a pair of results into a new result value.
///
/// - Parameter transform: A transform function.
/// - Returns: A transformed result value.
public func zip<A, B, Z, Error: Swift.Error>(
  with f: @escaping (A, B) -> Z,
  _ a: Result<A, Error>,
  _ b: Result<B, Error>
  ) -> Result<Z, Error> {
  return zip(a, b).map(f)
}

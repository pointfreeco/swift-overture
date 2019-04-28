/// Transforms a pair of results into a result of a pair.
///
/// - Parameters:
///   - result1: A result.
///   - result2: Another result.
/// - Returns: A result of a pair.
public func zip<A, B, Error: Swift.Error>(
  _ result1: Result<A, Error>,
  _ result2: Result<B, Error>
  ) -> Result<(A, B), Error> {
  return result1.flatMap { a in result2.map { b in (a, b) } }
}

/// Transforms a pair of results into a new result.
///
/// - Parameters:
///   - result1: A result.
///   - result2: Another result.
///   - transform: A transform function.
/// - Returns: A transformed result.
public func zip<A, B, Z, Error: Swift.Error>(
  with transform: @escaping (A, B) -> Z,
  _ result1: Result<A, Error>,
  _ result2: Result<B, Error>
  ) -> Result<Z, Error> {
  return zip(result1, result2).map(transform)
}

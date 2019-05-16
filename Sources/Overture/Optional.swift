
/// Free `map` on optionals for function composition.
///
/// - Parameter transform: A transform function.
/// - Returns: An optional with its wrapped value transformed.
public func map<A, B>(
  _ transform: @escaping (A) -> B
  )
  -> (A?) -> B? {

    return { $0.map(transform) }
}

/// Free `map` on optionals for throwing function composition.
///
/// - Parameter transform: A transform function.
/// - Returns: An optional with its wrapped value transformed.
public func map<A, B>(
  _ transform: @escaping (A) throws -> B
  )
  -> (A?) throws -> B? {

    return { try $0.map(transform) }
}


/// Transforms a pair of optionals into an optional pair.
///
/// - Parameters:
///   - optional1: An optional value.
///   - optional2: Another optional value.
/// - Returns: An optional pair of values.
public func zip<A, B>(_ optional1: A?, _ optional2: B?) -> (A, B)? {
  guard let a = optional1, let b = optional2 else { return nil }
  return (a, b)
}

/// Transforms a pair of optionals into a new optional value.
///
/// - Parameters:
///   - transform: A transform function.
///   - optional1: An optional value.
///   - optional2: Another optional value.
/// - Returns: A transformed optional value.
public func zip<A, B, Z>(
  with transform: (A, B) -> Z,
  _ optional1: A?,
  _ optional2: B?
  ) -> Z? {
  return zip(optional1, optional2).map(transform)
}

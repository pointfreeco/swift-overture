
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
///   - a: An optional value.
///   - b: Another optional value.
/// - Returns: An optional pair of values.
public func zip<A, B>(_ a: A?, _ b: B?) -> (A, B)? {
  guard let a = a, let b = b else { return nil }
  return (a, b)
}

/// Transforms a pair of optionals into a new optional value.
///
/// - Parameter transform: A transform function.
/// - Returns: A transformed optional value.
public func zip<A, B, C>(with transform: @escaping (A, B) -> C) -> (A?, B?) -> C? {
  return { zip($0, $1).map(transform) }
}

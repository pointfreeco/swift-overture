
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

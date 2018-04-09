
/// Free `map` on sequences for function composition.
///
/// - Parameter transform: A transform function.
/// - Returns: An array with each sequence element transformed.
public func map<S: Sequence, A>(
  _ transform: @escaping (S.Element) -> A
  )
  -> (S) -> [A] {

    return { $0.map(transform) }
}

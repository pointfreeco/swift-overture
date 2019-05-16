
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

/// Free `map` on sequences for throwing function composition.
///
/// - Parameter transform: A transform function.
/// - Returns: An array with each sequence element transformed.
public func map<S: Sequence, A>(
  _ transform: @escaping (S.Element) throws -> A
  )
  -> (S) throws -> [A] {

    return { try $0.map(transform) }
}

/// In-place collection mutation.
///
/// - Parameter transform: A transform function.
public func mutEach<C: MutableCollection>(
  _ transform: @escaping (inout C.Element) -> Void
  )
  -> (inout C) -> Void {

    return {
      for i in $0.indices {
        transform(&$0[i])
      }
    }
}

/// Transforms a pair of sequences into a sequence of pairs.
///
/// - Parameters:
///   - transform: A transform function.
///   - sequence1: A sequence.
///   - sequence2: Another sequence.
/// - Returns: A transformed sequence.
public func zip<A, B, Z>(
  with transform: (A.Element, B.Element) -> Z,
  _ sequence1: A,
  _ sequence2: B
  ) -> [Z]
  where A: Sequence, B: Sequence {
    return zip(sequence1, sequence2).map(transform)
}

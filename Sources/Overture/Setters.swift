
/// Applies a value transformation to an immutable setter function.
///
/// - Parameters:
///   - setter: An immutable setter function.
///   - f: A value transform function.
/// - Returns: A root transform function.
public func over<S, T, A, B>(
  _ setter: (@escaping (A) -> B) -> (S) -> T,
  _ f: @escaping (A) -> B
  )
  -> (S) -> T {

    return setter(f)
}

/// Applies a value to an immutable setter function.
///
/// - Parameters:
///   - setter: An immutable setter function.
///   - value: A new value.
/// - Returns: A root transform function.
public func set<S, T, A, B>(
  _ setter: (@escaping (A) -> B) -> (S) -> T,
  _ value: B
  )
  -> (S) -> T {

    return over(setter) { _ in value }
}

/// Applies a value transformation to an immutable setter function.
///
/// - Parameters:
///   - setter: An immutable setter function.
///   - f: A value transform function.
/// - Returns: A root transform function.
public func set<S, T, A, B>(
  _ setter: (@escaping (A) -> B) -> (S) -> T
  )
  -> (B)
  -> (S) -> T {

    return curry(set)(setter)
}

// MARK: - Mutation

/// Applies a mutable value transformation to a mutable setter function.
///
/// - Parameters:
///   - setter: A mutable setter function.
///   - f: A mutable value transform function.
/// - Returns: A mutable root transform function.
public func mver<S, A>(
  _ setter: (@escaping (inout A) -> Void) -> (inout S) -> Void,
  _ f: @escaping (inout A) -> Void
  )
  -> (inout S) -> Void {

    return setter(f)
}

/// Applies a mutable value transformation to a reference-mutable setter function.
///
/// - Parameters:
///   - setter: A reference-mutable setter function.
///   - f: A mutable value transform function.
/// - Returns: A reference-mutable root transform function.
public func mver<S: AnyObject, A>(
  _ setter: (@escaping (inout A) -> Void) -> (S) -> Void,
  _ f: @escaping (inout A) -> Void
  )
  -> (S) -> Void {

    return setter(f)
}

/// Applies a value to a mutable setter function.
///
/// - Parameters:
///   - setter: An mutable setter function.
///   - value: A new value.
/// - Returns: A mutable root transform function.
public func mut<S, A>(
  _ setter: (@escaping (inout A) -> Void) -> (inout S) -> Void,
  _ value: A
  )
  -> (inout S) -> Void {

    return mver(setter) { $0 = value }
}

public func mut<S, A>(
  _ setter: (@escaping (inout A) -> Void) -> (inout S) -> Void
  )
  -> (A)
  -> (inout S) -> Void {

    return curry(mut)(setter)
}

/// Applies a value to a reference-mutable setter function.
///
/// - Parameters:
///   - setter: An mutable setter function.
///   - value: A new value.
/// - Returns: A reference-mutable root transform function.
public func mut<S: AnyObject, A>(
  _ setter: (@escaping (inout A) -> Void) -> (S) -> Void,
  _ value: A
  )
  -> (S) -> Void {

    return mver(setter) { $0 = value }
}

public func mut<S: AnyObject, A>(
  _ setter: (@escaping (inout A) -> Void) -> (S) -> Void
  )
  -> (A)
  -> (S) -> Void {

    return curry(mut)(setter)
}

/// Mutating `const`. Produces a constant setter function for a given value.
///
/// - Parameter a: The value that's always set.
/// - Returns: A function that always mutates its argument to the provided value.
public func monst<A>(_ a: A) -> (inout A) -> Void {
  return { $0 = a }
}

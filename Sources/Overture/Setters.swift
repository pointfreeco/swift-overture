
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
public func mver<S, A>(
  _ setter: (@escaping (inout A) -> Void) -> (S) -> Void,
  _ f: @escaping (inout A) -> Void
  )
  -> (S) -> Void
  where S: AnyObject {

    return setter(f)
}

/// Applies a reference-mutable value transformation to a reference-mutable setter function.
///
/// - Parameters:
///   - setter: A reference-mutable setter function.
///   - f: A mutable value transform function.
/// - Returns: A reference-mutable root transform function.
public func mver<S, A>(
  _ setter: (@escaping (A) -> Void) -> (S) -> Void,
  _ f: @escaping (A) -> Void
  )
  -> (S) -> Void
  where S: AnyObject, A: AnyObject {

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

/// Applies a value to a reference-mutable setter function.
///
/// - Parameters:
///   - setter: An mutable setter function.
///   - value: A new value.
/// - Returns: A reference-mutable root transform function.
public func mut<S, A>(
  _ setter: (@escaping (inout A) -> Void) -> (S) -> Void,
  _ value: A
  )
  -> (S) -> Void
  where S: AnyObject {

    return mver(setter) { $0 = value }
}

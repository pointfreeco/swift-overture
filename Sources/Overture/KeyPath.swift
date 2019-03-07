
/// Produces a getter function for a given key path. Useful for composing property access with functions.
///
///     get(\String.count)
///     // (String) -> Int
///
/// - Parameter keyPath: A key path.
/// - Returns: A getter function.
public func get<Root, Value>(_ keyPath: KeyPath<Root, Value>) -> (Root) -> Value {
  return { root in root[keyPath: keyPath] }
}

/// Produces an immutable setter function for a given key path. Useful for composing property changes.
///
/// - Parameter keyPath: A key path.
/// - Returns: A setter function.
public func prop<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>
  )
  -> (@escaping (Value) -> Value)
  -> (Root) -> Root {

    return { update in
      { root in
        var copy = root
        copy[keyPath: keyPath] = update(copy[keyPath: keyPath])
        return copy
      }
    }
}

/// Produces an immutable setter function for a given key path and update function.
///
/// - Parameters
///   - keyPath: A key path.
///   - update: An update function.
/// - Returns: A setter function.
public func over<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>,
  _ update: @escaping (Value) -> Value
  )
  -> (Root) -> Root {

    return prop(keyPath)(update)
}

/// Produces an immutable setter function for a given key path and constant value.
///
/// - Parameters:
///   - keyPath: A key path.
///   - value: A new value.
/// - Returns: A setter function.
public func set<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>,
  _ value: Value
  )
  -> (Root) -> Root {

    return over(keyPath) { _ in value }
}

// MARK: - Mutation

/// Produces an in-place setter function for a given key path. Useful for composing value property changes efficiently.
///
/// - Parameter keyPath: A writable key path.
/// - Returns: A mutable setter function.
public func mprop<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>
  )
  -> (@escaping (inout Value) -> Void)
  -> (inout Root) -> Void {

    return { update in
      { root in
        update(&root[keyPath: keyPath])
      }
    }
}

/// Uncurried `mver`. Takes a key path and update function all at once.
///
/// - Parameters:
///   - keyPath: A writable key path.
///   - update: An update function for a given value.
/// - Returns: A value-mutable setter function.
public func mver<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>,
  _ update: @escaping (inout Value) -> Void
  )
  -> (inout Root) -> Void {

    return mprop(keyPath)(update)
}

/// Produces a reference-mutable setter function for a given key path to a reference. Useful for composing reference property changes efficiently.
///
/// - Parameter keyPath: A reference-writable key path.
/// - Returns: A reference-mutable setter function.
public func mprop<Root, Value>(
  _ keyPath: ReferenceWritableKeyPath<Root, Value>
  )
  -> (@escaping (Value) -> Void)
  -> (Root) -> Void
  where Value: AnyObject {

    return { update in
      { root in
        update(root[keyPath: keyPath])
      }
    }
}

/// Uncurried `mver`. Takes a key path and update function all at once.
///
/// - Parameters:
///   - keyPath: A reference-writable key path.
///   - update: An update function for a given value.
/// - Returns: A reference-mutable setter function.
public func mverObject<Root, Value>(
  _ keyPath: ReferenceWritableKeyPath<Root, Value>,
  _ update: @escaping (Value) -> Void
  )
  -> (Root) -> Void
  where Value: AnyObject {

    return mprop(keyPath)(update)
}

/// Produces an reference-mutable setter function for a given key path to a value. Useful for composing reference property changes efficiently.
///
/// - Parameter keyPath: A key path.
/// - Returns: A setter function.
public func mprop<Root, Value>(
  _ keyPath: ReferenceWritableKeyPath<Root, Value>
  )
  -> (@escaping (inout Value) -> Void)
  -> (Root) -> Void {

    return { update in
      { root in
        update(&root[keyPath: keyPath])
      }
    }
}

/// Uncurried `mver`. Takes a key path and update function all at once.
///
/// - Parameters:
///   - keyPath: A reference-writable key path.
///   - update: An update function for a given value.
/// - Returns: A reference-mutable setter function.
public func mver<Root, Value>(
  _ keyPath: ReferenceWritableKeyPath<Root, Value>,
  _ update: @escaping (inout Value) -> Void
  )
  -> (Root) -> Void {

    return mprop(keyPath)(update)
}

/// Produces a value-mutable setter function for a given key path and new value.
///
/// - Parameters:
///   - keyPath: A writable key path.
///   - value: A new value.
/// - Returns: A value-mutable setter function.
public func mut<Root, Value>(
  _ keyPath: WritableKeyPath<Root, Value>,
  _ value: Value
  )
  -> (inout Root) -> Void {

    return mver(keyPath) { $0 = value }
}

/// Produces a reference-mutable setter function for a given key path and new value.
///
/// - Parameters:
///   - keyPath: A reference-writable key path.
///   - value: A new value.
/// - Returns: A reference-mutable setter function.
public func mut<Root, Value>(
  _ keyPath: ReferenceWritableKeyPath<Root, Value>,
  _ value: Value
  )
  -> (Root) -> Void {

    return mver(keyPath) { $0 = value }
}

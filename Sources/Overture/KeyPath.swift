
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

/// Produces a setter function for a given key path. Useful for composing property updates with functions.
///
///     prop(\URLRequest.url)
///     // ((URL?) -> URL?) -> (URLRequest) -> URLRequest
///
/// - Parameter keyPath: A key path.
/// - Returns: A setter function.
public func prop<Root, Value>(_ keyPath: WritableKeyPath<Root, Value>)
  -> (@escaping (Value) -> Value)
  -> (Root) -> Root {

    return { update in
      { root in
        var copy = root
        copy[keyPath: keyPath] = update(root[keyPath: keyPath])
        return copy
      }
    }
}

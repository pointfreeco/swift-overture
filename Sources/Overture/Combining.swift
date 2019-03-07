public func combining<Root, Value, NewValue>(
  _ getter: @escaping (Root) -> Value,
  _ combine: @escaping (Value, Value) -> NewValue
  )
  -> (Value, Root)
  -> NewValue {
    return { value, root in combine(value, getter(root)) }
}

public func combining<Root, Value>(
  _ getter: @escaping (Root) -> Value,
  _ combine: @escaping (inout Value, Value) -> Void
  )
  -> (inout Value, Root)
  -> Void {
    return { value, root in combine(&value, getter(root)) }
}

public func their<Root, Value, NewValue>(
  _ getter: @escaping (Root) -> Value,
  _ combining: @escaping (Value, Value) -> NewValue
  )
  -> (Root, Root) -> NewValue {
    return { combining(getter($0), getter($1)) }
}

public func their<Root, Value: Comparable>(
  _ getter: @escaping (Root) -> Value
  )
  -> (Root, Root) -> Bool {
    return their(getter, <)
}

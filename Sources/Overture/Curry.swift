
/// Curries a function of two arguments.
///
/// - Parameter function: A function of two arguments.
/// - Returns: A curried function.
public func curry<A, B, C>(_ function: @escaping (A, B) -> C)
  -> (A)
  -> (B)
  -> C {
    return { (a: A) -> (B) -> C in
      { (b: B) -> C in
        function(a, b)
      }
    }
}

/// Curries a throwing function of two arguments.
///
/// - Parameter function: A throwing function of two arguments.
/// - Returns: A curried, final-throwing function.
public func curry<A, B, C>(_ function: @escaping (A, B) throws -> C)
  -> (A)
  -> (B) throws
  -> C {
    return { (a: A) -> (B) throws -> C in
      { (b: B) throws -> C in
        try function(a, b)
      }
    }
}

public func curry<A, B, C, D>(_ function: @escaping (A, B, C) -> D)
  -> (A)
  -> (B)
  -> (C)
  -> D {
    return { (a: A) -> (B) -> (C) -> D in
      { (b: B) -> (C) -> D in
        { (c: C) -> D in
          function(a, b, c)
        }
      }
    }
}

public func curry<A, B, C, D>(_ function: @escaping (A, B, C) throws -> D)
  -> (A)
  -> (B)
  -> (C) throws
  -> D {
    return { (a: A) -> (B) -> (C) throws -> D in
      { (b: B) -> (C) throws -> D in
        { (c: C) throws -> D in
          try function(a, b, c)
        }
      }
    }
}

public func curry<A, B, C, D, E>(_ function: @escaping (A, B, C, D) -> E)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> E {
    return { (a: A) -> (B) -> (C) -> (D) -> E in
      { (b: B) -> (C) -> (D) -> E in
        { (c: C) -> (D) -> E in
          { (d: D) -> E in
            function(a, b, c, d)
          }
        }
      }
    }
}

public func curry<A, B, C, D, E>(_ function: @escaping (A, B, C, D) throws -> E)
  -> (A)
  -> (B)
  -> (C)
  -> (D) throws
  -> E {
    return { (a: A) -> (B) -> (C) -> (D) throws -> E in
      { (b: B) -> (C) -> (D) throws -> E in
        { (c: C) -> (D) throws -> E in
          { (d: D) throws -> E in
            try function(a, b, c, d)
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F>(_ function: @escaping (A, B, C, D, E) -> F)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F) {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> F in
      { (b: B) -> (C) -> (D) -> (E) -> F in
        { (c: C) -> (D) -> (E) -> F in
          { (d: D) -> (E) -> F in
            { (e: E) -> F in
              function(a, b, c, d, e)
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F>(_ function: @escaping (A, B, C, D, E) throws -> F)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E) throws
  -> (F) {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) throws -> F in
      { (b: B) -> (C) -> (D) -> (E) throws -> F in
        { (c: C) -> (D) -> (E) throws -> F in
          { (d: D) -> (E) throws -> F in
            { (e: E) throws -> F in
              try function(a, b, c, d, e)
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G>(_ function: @escaping (A, B, C, D, E, F) -> G)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> G {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> G in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> G in
        { (c: C) -> (D) -> (E) -> (F) -> G in
          { (d: D) -> (E) -> (F) -> G in
            { (e: E) -> (F) -> G in
              { (f: F) -> G in
                function(a, b, c, d, e, f)
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G>(_ function: @escaping (A, B, C, D, E, F) throws -> G)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F) throws
  -> G {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) throws -> G in
      { (b: B) -> (C) -> (D) -> (E) -> (F) throws -> G in
        { (c: C) -> (D) -> (E) -> (F) throws -> G in
          { (d: D) -> (E) -> (F) throws -> G in
            { (e: E) -> (F) throws -> G in
              { (f: F) throws -> G in
                try function(a, b, c, d, e, f)
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H>(_ function: @escaping (A, B, C, D, E, F, G) -> H)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> H {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> H in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> H in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> H in
          { (d: D) -> (E) -> (F) -> (G) -> H in
            { (e: E) -> (F) -> (G) -> H in
              { (f: F) -> (G) -> H in
                { (g: G) -> H in
                  function(a, b, c, d, e, f, g)
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H>(_ function: @escaping (A, B, C, D, E, F, G) throws -> H)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G) throws
  -> H {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) throws -> H in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) throws -> H in
        { (c: C) -> (D) -> (E) -> (F) -> (G) throws -> H in
          { (d: D) -> (E) -> (F) -> (G) throws -> H in
            { (e: E) -> (F) -> (G) throws -> H in
              { (f: F) -> (G) throws -> H in
                { (g: G) throws -> H in
                  try function(a, b, c, d, e, f, g)
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I>(_ function: @escaping (A, B, C, D, E, F, G, H) -> I)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> I {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> I in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> I in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> I in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> I in
            { (e: E) -> (F) -> (G) -> (H) -> I in
              { (f: F) -> (G) -> (H) -> I in
                { (g: G) -> (H) -> I in
                  { (h: H) -> I in
                    function(a, b, c, d, e, f, g, h)
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I>(_ function: @escaping (A, B, C, D, E, F, G, H) throws -> I)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H) throws
  -> I {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) throws -> I in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) throws -> I in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) throws -> I in
          { (d: D) -> (E) -> (F) -> (G) -> (H) throws -> I in
            { (e: E) -> (F) -> (G) -> (H) throws -> I in
              { (f: F) -> (G) -> (H) throws -> I in
                { (g: G) -> (H) throws -> I in
                  { (h: H) throws -> I in
                    try function(a, b, c, d, e, f, g, h)
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J>(_ function: @escaping (A, B, C, D, E, F, G, H, I) -> J)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> J {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> J in
            { (e: E) -> (F) -> (G) -> (H) -> (I) -> J in
              { (f: F) -> (G) -> (H) -> (I) -> J in
                { (g: G) -> (H) -> (I) -> J in
                  { (h: H) -> (I) -> J in
                    { (i: I) -> J in
                      function(a, b, c, d, e, f, g, h, i)
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J>(_ function: @escaping (A, B, C, D, E, F, G, H, I) throws -> J)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I) throws
  -> J {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) throws -> J in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) throws -> J in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) throws -> J in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) throws -> J in
            { (e: E) -> (F) -> (G) -> (H) -> (I) throws -> J in
              { (f: F) -> (G) -> (H) -> (I) throws -> J in
                { (g: G) -> (H) -> (I) throws -> J in
                  { (h: H) -> (I) throws -> J in
                    { (i: I) throws -> J in
                      try function(a, b, c, d, e, f, g, h, i)
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J, K>(_ function: @escaping (A, B, C, D, E, F, G, H, I, J) -> K)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> K {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in
            { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> K in
              { (f: F) -> (G) -> (H) -> (I) -> (J) -> K in
                { (g: G) -> (H) -> (I) -> (J) -> K in
                  { (h: H) -> (I) -> (J) -> K in
                    { (i: I) -> (J) -> K in
                      { (j: J) -> K in
                        function(a, b, c, d, e, f, g, h, i, j)
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J, K>(_ function: @escaping (A, B, C, D, E, F, G, H, I, J) throws -> K)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J) throws
  -> K {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) throws -> K in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) throws -> K in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) throws -> K in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) throws -> K in
            { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) throws -> K in
              { (f: F) -> (G) -> (H) -> (I) -> (J) throws -> K in
                { (g: G) -> (H) -> (I) -> (J) throws -> K in
                  { (h: H) -> (I) -> (J) throws -> K in
                    { (i: I) -> (J) throws -> K in
                      { (j: J) throws -> K in
                        try function(a, b, c, d, e, f, g, h, i, j)
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J, K, L>(
  _ function: @escaping (A, B, C, D, E, F, G, H, I, J, K) -> L)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K)
  -> L {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in
            { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in
              { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> L in
                { (g: G) -> (H) -> (I) -> (J) -> (K) -> L in
                  { (h: H) -> (I) -> (J) -> (K) -> L in
                    { (i: I) -> (J) -> (K) -> L in
                      { (j: J) -> (K) -> L in
                        { (k: K) -> L in
                          function(a, b, c, d, e, f, g, h, i, j, k)
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J, K, L>(
  _ function: @escaping (A, B, C, D, E, F, G, H, I, J, K) throws -> L)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K) throws
  -> L {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) throws -> L in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) throws -> L in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) throws -> L in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) throws -> L in
            { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) throws -> L in
              { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) throws -> L in
                { (g: G) -> (H) -> (I) -> (J) -> (K) throws -> L in
                  { (h: H) -> (I) -> (J) -> (K) throws -> L in
                    { (i: I) -> (J) -> (K) throws -> L in
                      { (j: J) -> (K) throws -> L in
                        { (k: K) throws -> L in
                          try function(a, b, c, d, e, f, g, h, i, j, k)
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J, K, L, M>(
  _ function: @escaping (A, B, C, D, E, F, G, H, I, J, K, L) -> M)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K)
  -> (L)
  -> M {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in
            { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in
              { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in
                { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) -> M in
                  { (h: H) -> (I) -> (J) -> (K) -> (L) -> M in
                    { (i: I) -> (J) -> (K) -> (L) -> M in
                      { (j: J) -> (K) -> (L) -> M in
                        { (k: K) -> (L) -> M in
                          { (l: L) -> M in
                            function(a, b, c, d, e, f, g, h, i, j, k, l)
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

public func curry<A, B, C, D, E, F, G, H, I, J, K, L, M>(
  _ function: @escaping (A, B, C, D, E, F, G, H, I, J, K, L) throws -> M)
  -> (A)
  -> (B)
  -> (C)
  -> (D)
  -> (E)
  -> (F)
  -> (G)
  -> (H)
  -> (I)
  -> (J)
  -> (K)
  -> (L) throws
  -> M {
    return { (a: A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) throws -> M in
      { (b: B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) throws -> M in
        { (c: C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) throws -> M in
          { (d: D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) throws -> M in
            { (e: E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) throws -> M in
              { (f: F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) throws -> M in
                { (g: G) -> (H) -> (I) -> (J) -> (K) -> (L) throws -> M in
                  { (h: H) -> (I) -> (J) -> (K) -> (L) throws -> M in
                    { (i: I) -> (J) -> (K) -> (L) throws -> M in
                      { (j: J) -> (K) -> (L) throws -> M in
                        { (k: K) -> (L) throws -> M in
                          { (l: L) throws -> M in
                            try function(a, b, c, d, e, f, g, h, i, j, k, l)
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
}

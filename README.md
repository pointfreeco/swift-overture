# 🎼 Overture

[![Swift 5.1](https://img.shields.io/badge/swift-5-ED523F.svg?style=flat)](https://swift.org/download/)
[![CI](https://github.com/pointfreeco/swift-overture/workflows/CI/badge.svg)](https://actions-badge.atrox.dev/pointfreeco/swift-overture/goto)
[![@pointfreeco](https://img.shields.io/badge/contact-@pointfreeco-5AA9E7.svg?style=flat)](https://twitter.com/pointfreeco)

A library for function composition.

## Table of Contents

  - [Motivation](#motivation)
  - [Examples](#examples)
      - [`pipe`](#pipe)
      - [`with` and `update`](#with-and-update)
      - [`concat`](#concat)
      - [`curry`, `flip`, and `zurry`](#curry-flip-and-zurry)
      - [`get`](#get)
      - [`prop`](#prop)
      - [`over` and `set`](#over-and-set)
      - [`mprop`, `mver`, and `mut`](#mprop-mver-and-mut)
      - [`zip`](#zip-and-zipwith)
  - [FAQ](#faq)
  - [Installation](#installation)
  - [🎶 Prelude](#-prelude)
  - [Interested in learning more?](#interested-in-learning-more)
  - [License](#license)

## Motivation

We work with functions all the time, but function composition is hiding in plain sight!

For instance, we work with functions when we use higher-order methods, like `map` on arrays:

``` swift
[1, 2, 3].map { $0 + 1 }
// [2, 3, 4]
```

If we wanted to modify this simple closure to square our value after incrementing it, things begin to get messy.

``` swift
[1, 2, 3].map { ($0 + 1) * ($0 + 1) }
// [4, 9, 16]
```

Functions allow us to identify and extract reusable code. Let's define a couple functions that make up the behavior above.

``` swift
func incr(_ x: Int) -> Int {
  return x + 1
}

func square(_ x: Int) -> Int {
  return x * x
}
```

With these functions defined, we can pass them directly to `map`!

``` swift
[1, 2, 3]
  .map(incr)
  .map(square)
// [4, 9, 16]
```

This refactor reads much better, but it's less performant: we're mapping over the array twice and creating an intermediate copy along the way! While we could use `lazy` to fuse these calls together, let's take a more general approach: function composition!

``` swift
[1, 2, 3].map(pipe(incr, square))
// [4, 9, 16]
```

The `pipe` function glues other functions together! It can take more than two arguments and even change the type along the way!

``` swift
[1, 2, 3].map(pipe(incr, square, String.init))
// ["4", "9", "16"]
```

Function composition lets us build new functions from smaller pieces, giving us the ability to extract and reuse logic in other contexts.

``` swift
let computeAndStringify = pipe(incr, square, String.init)

[1, 2, 3].map(computeAndStringify)
// ["4", "9", "16"]

computeAndStringify(42)
// "1849"
```

The function is the smallest building block of code. Function composition gives us the ability to fit these blocks together and build entire apps out of small, reusable, understandable units.

## Examples

### `pipe`

The most basic building block in Overture. It takes existing functions and smooshes them together. That is, given a function `(A) -> B` and a function `(B) -> C`, `pipe` will return a brand new `(A) -> C` function.

``` swift
let computeAndStringify = pipe(incr, square, String.init)

computeAndStringify(42)
// "1849"

[1, 2, 3].map(computeAndStringify)
// ["4", "9", "16"]
```

### `with` and `update`

The `with` and `update` functions are useful for applying functions to values. They play nicely with the `inout` and mutable object worlds, wrapping otherwise imperative configuration statements in an expression.

``` swift
class MyViewController: UIViewController {
  let label = with(UILabel()) {
    $0.font = .systemFont(ofSize: 24)
    $0.textColor = .red
  }
}
```

And it restores the left-to-right readability we're used to from the method world.

``` swift
with(42, pipe(incr, square, String.init))
// "1849"
```

Using an `inout` parameter.

``` swift
update(&user, mut(\.name, "Blob"))
```

### `concat`

The `concat` function composes with single types. This includes composition of the following function signatures:

- `(A) -> A`
- `(inout A) -> Void`
- `<A: AnyObject>(A) -> Void`

With `concat`, we can build powerful configuration functions from small pieces.

``` swift
let roundedStyle: (UIView) -> Void = {
  $0.clipsToBounds = true
  $0.layer.cornerRadius = 6
}

let baseButtonStyle: (UIButton) -> Void = {
  $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
  $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
}

let roundedButtonStyle = concat(
  baseButtonStyle,
  roundedStyle
)

let filledButtonStyle = concat(roundedButtonStyle) {
  $0.backgroundColor = .black
  $0.tintColor = .white
}

let button = with(UIButton(type: .system), filledButtonStyle)
```

### `curry`, `flip`, and `zurry`

These functions make up the [Swiss army knife](https://www.pointfree.co/episodes/ep5-higher-order-functions) of composition. They give us the power to take existing functions and methods that don't compose (_e.g_, those that take zero or multiple arguments) and restore composition.

For example, let's transform a string initializer that takes multiple arguments into something that can compose with `pipe`.

``` swift
String.init(data:encoding:)
// (Data, String.Encoding) -> String?
```

We use `curry` to transform multi-argument functions into functions that take a single input and return new functions to gather more inputs along the way.

``` swift
curry(String.init(data:encoding:))
// (Data) -> (String.Encoding) -> String?
```

And we use `flip` to flip the order of arguments. Multi-argument functions and methods typically take data first and configuration second, but we can generally apply configuration before we have data, and `flip` allows us to do just that.

``` swift
flip(curry(String.init(data:encoding:)))
// (String.Encoding) -> (Data) -> String?
```

Now we have a highly-reusable, composable building block that we can use to build pipelines.

``` swift
let stringWithEncoding = flip(curry(String.init(data:encoding:)))
// (String.Encoding) -> (Data) -> String?

let utf8String = stringWithEncoding(.utf8)
// (Data) -> String?
```

Swift also exposes methods as static, unbound functions. These functions are already in curried form. All we need to do is `flip` them to make them more useful!

``` swift
String.capitalized
// (String) -> (Locale?) -> String

let capitalized = flip(String.capitalized)
// (Locale?) -> (String) -> String

["hello, world", "and good night"]
  .map(capitalized(Locale(identifier: "en")))
// ["Hello, World", "And Good Night"]
```

And `zurry` restores composition for functions and methods that take zero arguments.

``` swift
String.uppercased
// (String) -> () -> String

flip(String.uppercased)
// () -> (String) -> String

let uppercased = zurry(flip(String.uppercased))
// (String) -> String

["hello, world", "and good night"]
  .map(uppercased)
// ["HELLO, WORLD", "AND GOOD NIGHT"]
```

### `get`

The `get` function produces [getter functions](https://www.pointfree.co/episodes/ep8-getters-and-key-paths) from key paths.

``` swift
get(\String.count)
// (String) -> Int

["hello, world", "and good night"]
  .map(get(\.count))
// [12, 14]
```

We can even compose other functions into `get` by using the `pipe` function. Here we build a function that increments an integer, squares it, turns it into a string, and then gets the string's character count:

```swift
pipe(incr, square, String.init, get(\.count))
// (Int) -> Int
```

### `prop`

The `prop` function produces [setter functions](https://www.pointfree.co/episodes/ep7-setters-and-key-paths) from key paths.

``` swift
let setUserName = prop(\User.name)
// ((String) -> String) -> (User) -> User

let capitalizeUserName = setUserName(capitalized(Locale(identifier: "en")))
// (User) -> User

let setUserAge = prop(\User.age)

let celebrateBirthday = setUserAge(incr)
// (User) -> User

with(User(name: "blob", age: 1), concat(
  capitalizeUserName,
  celebrateBirthday
))
// User(name: "Blob", age: 2)
```

### `over` and `set`

The `over` and `set` functions produce `(Root) -> Root` transform functions that work on a `Value` in a structure given a key path (or [setter function](https://www.pointfree.co/episodes/ep7-setters-and-key-paths)).

The `over` function takes a `(Value) -> Value` transform function to modify an existing value.

``` swift
let celebrateBirthday = over(\User.age, incr)
// (User) -> User
```

The `set` function replaces an existing value with a brand new one.

```swift
with(user, set(\.name, "Blob"))
```

### `mprop`, `mver`, and `mut`

The `mprop`, `mver` and `mut` functions are _mutable_ variants of `prop`, `over` and `set`.

```swift
let guaranteeHeaders = mver(\URLRequest.allHTTPHeaderFields) { $0 = $0 ?? [:] }

let setHeader = { name, value in
  concat(
    guaranteeHeaders,
    { $0.allHTTPHeaderFields?[name] = value }
  )
}

let request = update(
  URLRequest(url: url),
  mut(\.httpMethod, "POST"),
  setHeader("Authorization", "Token " + token),
  setHeader("Content-Type", "application/json; charset=utf-8")
)
```

### `zip` and `zip(with:)`

This is a function that Swift ships with! Unfortunately, it's limited to pairs of sequences. Overture defines `zip` to work with up to ten sequences at once, which makes combining several sets of related data a snap.

```swift
let ids = [1, 2, 3]
let emails = ["blob@pointfree.co", "blob.jr@pointfree.co", "blob.sr@pointfree.co"]
let names = ["Blob", "Blob Junior", "Blob Senior"]

zip(ids, emails, names)
// [
//   (1, "blob@pointfree.co", "Blob"),
//   (2, "blob.jr@pointfree.co", "Blob Junior"),
//   (3, "blob.sr@pointfree.co", "Blob Senior")
// ]
```

It's common to immediately `map` on zipped values.

``` swift
struct User {
  let id: Int
  let email: String
  let name: String
}

zip(ids, emails, names).map(User.init)
// [
//   User(id: 1, email: "blob@pointfree.co", name: "Blob"),
//   User(id: 2, email: "blob.jr@pointfree.co", name: "Blob Junior"),
//   User(id: 3, email: "blob.sr@pointfree.co", name: "Blob Senior")
// ]
```

Because of this, Overture provides a `zip(with:)` helper, which takes a tranform function up front and is curried, so it can be composed with other functions using `pipe`.

``` swift
zip(with: User.init)(ids, emails, names)
```

Overture also extends the notion of `zip` to work with optionals! It's an expressive way of combining multiple optionals together.

``` swift
let optionalId: Int? = 1
let optionalEmail: String? = "blob@pointfree.co"
let optionalName: String? = "Blob"

zip(optionalId, optionalEmail, optionalName)
// Optional<(Int, String, String)>.some((1, "blob@pointfree.co", "Blob"))
```

And `zip(with:)` lets us transform these tuples into other values.

``` swift
zip(with: User.init)(optionalId, optionalEmail, optionalName)
// Optional<User>.some(User(id: 1, email: "blob@pointfree.co", name: "Blob"))
```

Using `zip` can be an expressive alternative to `let`-unwrapping!

``` swift
let optionalUser = zip(with: User.init)(optionalId, optionalEmail, optionalName)

// vs.

let optionalUser: User?
if let id = optionalId, let email = optionalEmail, let name = optionalName {
  optionalUser = User(id: id, email: email, name: name)
} else {
  optionalUser = nil
}
```

## FAQ

  - **Should I be worried about polluting the global namespace with free functions?**

    Nope! Swift has several layers of scope to help you here.

      - You can limit exposing highly-specific functions beyond a single file by using `fileprivate` and `private` scope.
      - You can define functions as `static` members inside types.
      - You can qualify functions with the module's name (_e.g._, `Overture.pipe(f, g)`). You can even autocomplete free functions from the module's name, so discoverability doesn't have to suffer!

  - **Are free functions that common in Swift?**

    It may not seem like it, but free functions are everywhere in Swift, making Overture extremely useful! A few examples:

      - Initializers, like `String.init`.
      - Unbound methods, like `String.uppercased`.
      - Enum cases with associated values, like `Optional.some`.
      - Ad hoc closures we pass to `map`, `filter`, and other higher-order methods.
      - Top-level Standard Library functions like `max`, `min`, and `zip`.

## Installation

### Carthage

If you use [Carthage](https://github.com/Carthage/Carthage), you can add the following dependency to your `Cartfile`:

``` ruby
github "pointfreeco/swift-overture" ~> 0.5
```

### CocoaPods

If your project uses [CocoaPods](https://cocoapods.org), just add the following to your `Podfile`:

``` ruby
pod 'Overture', '~> 0.5'
```

### SwiftPM

If you want to use Overture in a project that uses [SwiftPM](https://swift.org/package-manager/), it's as simple as adding a `dependencies` clause to your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/pointfreeco/swift-overture.git", from: "0.5.0")
]
```

### Xcode Sub-project

Submodule, clone, or download Overture, and drag `Overture.xcodeproj` into your project.

## 🎶 Prelude

This library was created as an alternative to [swift-prelude](https://www.github.com/pointfreeco/swift-prelude), which provides these tools (and more) using infix operators. For example, `pipe` is none other than the arrow composition operator `>>>`, which means the following are equivalent:

```swift
xs.map(incr >>> square)
xs.map(pipe(incr, square))
```

We know that many code bases are not going to be comfortable introducing operators, so we wanted to reduce the barrier to entry for embracing function composition.

## Interested in learning more?

These concepts (and more) are explored thoroughly in [Point-Free](https://www.pointfree.co), a video series exploring functional programming and Swift hosted by [Brandon Williams](https://twitter.com/mbrandonw) and [Stephen Celis](https://twitter.com/stephencelis).

The ideas in this episode were first explored in [Episode #11](https://www.pointfree.co/episodes/ep11-composition-without-operators):

<a href="https://www.pointfree.co/episodes/ep11-composition-without-operators">
  <img alt="video poster image" src="https://d1hf1soyumxcgv.cloudfront.net/0011-composition-without-operators/0011-poster.jpg" width="480">
</a>

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.

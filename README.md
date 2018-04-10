# 🎼 Overture

macOS [![CircleCI](https://circleci.com/gh/pointfreeco/swift-overture.svg?style=svg)](https://circleci.com/gh/pointfreeco/swift-overture) Linux [![Build Status](https://travis-ci.org/pointfreeco/swift-overture.svg?branch=master)](https://travis-ci.org/pointfreeco/swift-overture)

A library for function composition.

## Introduction

In Swift, functions are values, which gives us the power to explore function composition in a lot of interesting ways.

We're used to working with higher-order methods like `map` on arrays:

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

This refactor reads much better, but it's less performant: we're mapping over the array twice! How can we get the best of both worlds? Function composition to the rescue!

``` swift
[1, 2, 3].map(pipe(incr, square))
// [4, 9, 16]
```

The `pipe` function glues functions together! We can even change the type along the way.

``` swift
[1, 2, 3].map(pipe(incr, square, String.init))
// ["4", "9", "16"]
```

We took a function that comes with Swift and tacked it onto the end of our pipeline!

Function composition produces brand new functions that we can extract and reuse.

``` swift
let computeAndStringify = pipe(incr, square, String.init)

[1, 2, 3].map(computeAndStringify)
// ["4", "9", "16"]

computeAndStringify(42)
// "1849"
```

The function is the smallest building block of code. Function composition gives us the ability to fit these blocks together and build entire apps out of small, reusable, understandable units. Overture is a toolset for function composition in Swift.

## Examples

### `pipe`

The most basic building block in Overture. It takes existing functions and smooshes them together.

``` swift
let computeAndStringify = pipe(incr, square, String.init)

computeAndStringify(42)
// "1849"

[1, 2, 3].map(computeAndStringify)
// ["4", "9", "16"]
```

### `with`

The `with` function is useful for applying functions to values. It restores the left-to-right readability we're used to from the method world.

``` swift
with(42, pipe(incr, square, String.init))
// "1849"
```

It plays nicely with the `inout` and mutable object worlds, wrapping imperative configuration in an expression.

``` swift
class MyViewController: UIViewController {
  let label = with(UILabel()) {
    $0.font = .systemFont(ofSize: 24)
    $0.textColor = .red
  }
}
```

### `concat`

The `concat` function composes with single types. This includes composition of the following function signatures:

- `(A) -> A`
- `(inout A) -> Void`
- `<A: AnyObject>(A) -> Void`

With `concat`, we can build powerful configuration functions from small pieces.

``` swift
let roundedStyle: (UIView) -> Void {
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

These functions make up the Swiss army knife of composition. They give us the power to take existing functions and methods that don't compose (_e.g_, those that take zero or multiple arguments) and restore composition.

For example, let's transform a string initializer that takes multiple arguments into something that can compose with `pipe`.

``` swift
String.init(data:encoding:)
// (Data, String.Encoding) -> String?
```

We use `curry` to transform multi-argument functions into functions that take a single input and return new functions to gather more inputs along the way.

``` swift
curry(String.init(data:encoding:)
// (Data) -> (String.Encoding) -> String?
```

And we use `flip` to fix the order of arguments. Multi-argument functions and methods take data first and configuration second, but we can generally apply configuration before we have data.

``` swift
flip(curry(String.init(data:encoding:)
// (String.Encoding) -> (Data) -> String?
```

Now we can build reusable, composable pieces and put them to work in our pipelines.

``` swift
let stringWithEncoding = flip(curry(String.init(data:encoding:)))
// (String.Encoding) -> (Data) -> String?

let utf8String = stringWithEncoding(.utf8)
// (Data) -> String?
```

We can also take existing methods and extract functions from their already-curried, static versions.

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

The `get` function produces getter functions from key paths.

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

The `prop` function produces setter functions from key paths.

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

## Installation

### Carthage

If you use [Carthage](https://github.com/Carthage/Carthage), you can add the following dependency to your `Cartfile`:

``` ruby
github "pointfreeco/swift-overture" "master"
```

### CocoaPods

If your project uses [CocoaPods](https://cocoapods.org), just add the following to your `Podfile`:

``` ruby
pod 'Overture', :git => 'https://github.com/pointfreeco/swift-overture.git'
```

### SwiftPM

If you want to use Overture in a project that uses [SwiftPM](https://swift.org/package-manager/), it's as simple as adding a `dependencies` clause to your `Package.swift`:

``` swift
dependencies: [
  .package(
    url: "https://github.com/pointfreeco/swift-overture.git",
    .branch("master")),
]
```

### Xcode Sub-project

Submodule, clone, or download Overture, and drag `Overture.xcodeproj` into your project.

## Prelude

This library was created as an alternative to [swift-prelude](https://www.github.com/pointfreeco/swift-prelude), which provides these tools (and more) using infix operators. For example, `pipe` is none other than the arrow composition operator `>>>`, which means the following are equivalent:

```swift
xs.map(incr >>> square)
xs.map(pipe(incr, square))
```

We know that many code bases are not going to be comfortable introducing operators, so we wanted to reduce the barrier to entry for embracing function composition.

## Interested in learning more?

These concepts (and more) are explored thoroughly in [Point-Free](https://www.pointfree.co).

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.

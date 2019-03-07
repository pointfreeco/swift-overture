import Foundation
import Overture

func incr(_ x: Int) -> Int {
  return x + 1
}

func square(_ x: Int) -> Int {
  return x * x
}

[1, 2, 3].map(pipe(incr, square, String.init))

let stringWithEncoding = flip(curry(String.init(data:encoding:)))

let utf8String = stringWithEncoding(.utf8)

let capitalized = flip(String.capitalized)

["hello, world", "and good night"]
  .map(capitalized(Locale(identifier: "en")))

get(\String.count)

["hello, world", "and good night"]
  .map(get(\.count))

pipe(incr, square, String.init, get(\.count))

struct User {
  var name: String
  var age: Int
}

let setUserName = prop(\User.name)
let capitalizeUserName = setUserName(capitalized(Locale(identifier: "en")))

let setUserAge = prop(\User.age)
let celebrateBirthday = setUserAge(incr)

let blob = User(name: "Blob", age: 42)

with(blob, concat(
  capitalizeUserName,
  celebrateBirthday
))

let blobJr = with(blob, concat(
  mver(\.name) { $0 += ", Jr." },
  mver(\.age) { $0 -= 30 }
))

let blobSr = with(blob, concat(
  mver(\.name) { $0 += ", Sr." },
  mver(\.age) { $0 += 30 }
))

let users = [
  blob,
  blobJr,
  blobSr
]

users.reduce(0, combining(get(\.age), +))
users.reduce(into: 0, combining(get(\.age), +=))

users.sorted(by: their(get(\.age)))
users.sorted(by: their(get(\.age), >))

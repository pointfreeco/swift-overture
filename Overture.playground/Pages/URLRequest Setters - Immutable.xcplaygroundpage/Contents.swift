import Foundation
import Overture

let guaranteeHeaders = over(\URLRequest.allHTTPHeaderFields) { $0 ?? [:] }

let setHeader = { name, value in
  concat(
    guaranteeHeaders,
    set(compose(prop(\.allHTTPHeaderFields), map, prop(\.[name])), value)
  )
}

let postJson = concat(
  set(\.httpMethod, "POST"),
  setHeader("Content-Type", "application/json; charset=utf-8")
)

let gitHubAccept = setHeader("Accept", "application/vnd.github.v3+json")

let attachAuthorization = { token in setHeader("Authorization", "Token " + token) }

let request = with(
  URLRequest(url: URL(string: "https://www.pointfree.co/hello")!),
  concat(
    attachAuthorization("deadbeef"),
    gitHubAccept,
    postJson
  )
)

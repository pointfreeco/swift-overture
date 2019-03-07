import Foundation
import Overture

let guaranteeHeaders = mver(\URLRequest.allHTTPHeaderFields) { $0 = $0 ?? [:] }

let setHeader = { name, value in
  concat(guaranteeHeaders) { $0.allHTTPHeaderFields?[name] = value }
}

let postJson = concat(
  mut(\.httpMethod, "POST"),
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

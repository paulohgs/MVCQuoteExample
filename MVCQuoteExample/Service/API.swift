//
//  API.swift
//  MVCQuoteExample
//
//  Created by Paulo Henrique Gomes da Silva on 31/01/23.
//

import Foundation

struct API {
    func fetch() async throws -> Quote {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let quote: Quote = try JSONDecoder().decode(Quote.self, from: data)
            return quote
        } catch {
            print(error)
        }
        return Quote(anime: "", character: "", quote: "")
    }
}

extension API {
    var url: URL {
        guard let url = URL(string: "https://animechan.vercel.app/api/random") else {
            preconditionFailure(
                "Invalid URL"
            )
        }
        return url
    }

    var request: URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["Content-type":"application/json"]
        return request
    }
}

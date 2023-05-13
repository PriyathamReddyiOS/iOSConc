//
//  Network.swift
//  MovieBrowserSwiftUI
//
//  Created by priyatham reddy on 10/17/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
    case decodeError
}

class Network  {
   
    static let shared = Network()
    private init() { }
    private let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    private let urlStr = "https://api.themoviedb.org/3/search/movie?"
  
    func fetchMovies(queryStr: String) async throws -> Welcome {
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD"
        decoder.dateDecodingStrategy = .formatted(formatter)
        var comp = URLComponents(string: urlStr)
        comp?.queryItems = ["api_key" : "\(apiKey)",
                           "query" : queryStr].map{
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        guard let url = comp?.url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
            throw NetworkError.badID
        }
        do {
            let decodedData = try decoder.decode(Welcome.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodeError
        }
        
        
    }
    
}

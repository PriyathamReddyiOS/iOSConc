//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network {
    
    private init() { }
    private let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    static let shared = Network()
    private let urlStr = "https://api.themoviedb.org/3/search/movie?"
    
    func fetchResults(queryString: String, completion: @escaping (Result<Welcome,Error>) -> Void) {
        var urlComponents = URLComponents(string: urlStr)
        urlComponents?.queryItems = ["api_key" : "\(apiKey)",
                                     "query" : queryString].map{
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        let url = urlComponents?.url
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, err in
            guard let data = data, err == nil, let resp = resp as? HTTPURLResponse else { return }
            let decoder = JSONDecoder()
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY-MM-DD"
            decoder.dateDecodingStrategy = .formatted(formatter)
            do {
                let decodedData = try decoder.decode(Welcome.self, from: data)
                completion(.success(decodedData))
                print(decodedData.results)
            } catch {
                completion(.failure(error))
                print(error)
            }
           
            print(resp.statusCode)
            
        }.resume()
        
    }
    
    
    }
    



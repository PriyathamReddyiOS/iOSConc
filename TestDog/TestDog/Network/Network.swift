//
//  Network.swift
//  TestDog
//
//  Created by priyatham reddy on 10/27/22.
//

import Foundation

enum Err: Error {
    case badURL
    case networkError
}

class Network {
    
    private init() { }
    static let shared = Network() 
    private var urlStr = "https://dog.ceo/api/breeds/list/all"
   
 
    
    func fetchBreeds(completion : @escaping ((Result<Welcome,Error>) -> Void)) {
        guard let url = URL(string: urlStr) else { return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                
                let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
                completion(.success(decodedData))
                
            } catch {
                
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
            
        }.resume()
        
        
    }
    
    
//    func fetchSpecific(queryStr: String, completion : @escaping ((Result<Specific,Error>) -> Void)) {
//
//        var urlStrSpec = "https://dog.ceo/api/breed/\(queryStr)/images/random/3"
//        guard let url = URL(string: urlStrSpec) else { return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            do {
//
//                let decodedSpecificData = try JSONDecoder().decode(Specific.self, from: data)
//                completion(.success(decodedSpecificData))
//
//            } catch {
//
//                print(error.localizedDescription)
//                completion(.failure(error))
//            }
//
//
//        }.resume()
//
//
//    }
//
    
    
    
}
//    a.     https://dog.ceo/api/breeds/list/all (GET)
//    b.     https://dog.ceo/api/breed/{dog_breed}/images/random/3 (GET)

    

//
//  ApiCaller.swift
//  7ElevenTest
//
//  Created by priyatham reddy on 5/5/23.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    private init() { }
    
    func fetchUsers() async throws -> [User]? {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return nil}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            return nil
        }
        let users = try? JSONDecoder().decode([User].self
                                         , from: data)
        return users
    }
}

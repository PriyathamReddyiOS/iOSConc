//
//  UserViewModel.swift
//  7ElevenTest
//
//  Created by priyatham reddy on 5/5/23.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    func loadUsers() async {
        if let loadedUsers = try? await APICaller.shared.fetchUsers() {
            users = loadedUsers
        }
    }
}

//
//  MovieViewModel.swift
//  MovieBrowserSwiftUI
//
//  Created by priyatham reddy on 10/22/22.
//

import Foundation

@MainActor
class MovieViewModel: ObservableObject {
    
    @Published var welcome: Welcome
    
    init(welcome: Welcome) {
        self.welcome = welcome
    }
    
    func searchWithName(name: String) async {
        do {
            let welcome =  try await Network.shared.fetchMovies(queryStr: name)
            self.welcome = welcome
        } catch {
            print(error)
        }
    }
    
}




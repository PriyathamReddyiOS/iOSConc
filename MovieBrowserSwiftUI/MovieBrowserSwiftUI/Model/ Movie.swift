//
//   Movie.swift
//  MovieBrowserSwiftUI
//
//  Created by priyatham reddy on 10/17/22.
//

import Foundation

struct Welcome: Codable {
    
     var results: [Movie]
    
 }

struct Movie: Codable,Identifiable, Hashable {

     let id = UUID()
     let title: String
     let backdropPath: String?
     let overview: String
     let releaseDate: Date
     let voteAverage: Double

     enum CodingKeys: String, CodingKey {
         
         case title
         case backdropPath = "backdrop_path"
         case overview
         case releaseDate = "release_date"
         case voteAverage = "vote_average"
         
     }
 }

let movie1 = Movie(title: "Star wars", backdropPath: nil, overview: "Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good,Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good, Hey, How's it going? I have been doing good,", releaseDate: .now, voteAverage: 6.2)

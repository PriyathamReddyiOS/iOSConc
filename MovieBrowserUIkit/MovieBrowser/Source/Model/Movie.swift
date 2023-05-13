//
//  Movie.swift
//  MovieBrowser
//
//  Created by priyatham reddy on 10/15/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct Welcome: Codable {
     
    let results: [Movie]
    
 }

 struct Movie: Codable {
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





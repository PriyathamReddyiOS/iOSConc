//
//  User.swift
//  7ElevenTest
//
//  Created by priyatham reddy on 5/5/23.
//

import Foundation

struct User: Codable {
    var name: String
    var id: Int
    var username: String
    var email: String
    var company: Company
    
}

struct Company: Codable {
    var name: String
}







/*
 "id": 1,
     "name": "Leanne Graham",
     "username": "Bret",
     "email": "Sincere@april.biz",
     "address": {
       "street": "Kulas Light",
       "suite": "Apt. 556",
       "city": "Gwenborough",
       "zipcode": "92998-3874",
       "geo": {
         "lat": "-37.3159",
         "lng": "81.1496"
       }
     },
     "phone": "1-770-736-8031 x56442",
     "website": "hildegard.org",
     "company": {
       "name": "Romaguera-Crona",
       "catchPhrase": "Multi-layered client-server neural-net",
       "bs": "harness real-time e-markets"
     }
 */

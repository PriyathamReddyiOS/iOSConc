//
//  Extensions.swift
//  MovieBrowserSwiftUI
//
//  Created by priyatham reddy on 10/26/22.
//

import Foundation

extension Date {
    
    func shortDateFormatter() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = .current
        return formatter.string(from: self)
        
    }
    
    func longDateFormatter() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = .current
        return formatter.string(from: self)
        
    }
    
} 
    
    

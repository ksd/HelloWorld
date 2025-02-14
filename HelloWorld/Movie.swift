//
//  Movie.swift
//  HelloWorld
//
//  Created by ksd on 11/02/2025.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let year: String
    let runtime: String
    let genre: String
    let director: String
    let actors: String
    let plot: String
    let country: String
    let awards: String
    let poster: String
}


extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}

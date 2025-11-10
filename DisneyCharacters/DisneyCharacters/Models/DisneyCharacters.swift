//
//  DisneyCharactersApp.swift
//  DisneyCharacters
//
//  Created by Benjamin Whitfield.
//

import Foundation


struct DisneyCharacters: Codable, Identifiable {
    let _id: Int
    let name: String
    let imageURL: String?
    let films: [String]
    
    var id: Int {
        _id
    }
}

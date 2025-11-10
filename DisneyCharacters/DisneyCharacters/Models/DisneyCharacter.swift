//
//  DisneyCharactersApp.swift
//  DisneyCharacters
//
//  Created by Benjamin Whitfield.
//

import Foundation


struct DisneyCharacter: Codable, Identifiable {
    let _id: Int
    let name: String
    let imageUrl: String?
    let films: [String]
    
    var id: Int {
        _id
    }
}

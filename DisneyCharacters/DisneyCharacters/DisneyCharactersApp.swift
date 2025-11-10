//
//  DisneyCharactersApp.swift
//  DisneyCharacters
//
//  Created by Benjamin Whitfield on 11/9/25.
//

import SwiftUI

@main
struct DisneyCharactersApp: App {
    @StateObject private var model = DisneyCharactersViewModel()
    
    var body: some Scene {
        WindowGroup {
            CharacterListView()
                .environmentObject(model)
        }
    }
}


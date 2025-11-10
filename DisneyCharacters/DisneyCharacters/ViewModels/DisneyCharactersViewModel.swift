//
//  DisneyCharactersViewModel.swift
//  DisneyCharacters
//
//  Created by Benjamin Whitfield.
//

import SwiftUI
import Foundation

class DisneyCharactersViewModel : ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchCharacters() async {
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        
        guard let url = URL(string: "https://api.disneyapi.dev/character?page=1&pageSize=30") else {
            errorMessage = "Invalid URL"
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
            self.characters = decoded.data
        } catch {
            errorMessage = "Failed to load characters: \(error.localizedDescription)"
        }
    }
}

struct CharacterResponse: Codable {
    let data: [Character]
}

#Preview {
    DisneyCharactersViewModel()
}

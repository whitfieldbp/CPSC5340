//
//  CharacterDetailView.swift
//  DisneyCharacters
//
//  Created by Benjamin Whitfield.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: DisneyCharacter
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageUrl = character.imageUrl,
                   let url = URL(string: imageUrl)
                { AsyncImage(url: url) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                Text(character.name).font(.largeTitle).fontWeight(.bold)
                
                if !character.films.isEmpty {
                    Text("Films").font(.headline).padding(.bottom, 4)
                    
                    ForEach(character.films, id: \.self) { film in
                        Text("- \(film)").font(.subheadline)
                    }
                } else {
                    Text("No films listed.")
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CharacterDetailView(character: DisneyCharacter(_id: 1, name: "Mickey Mouse", imageUrl: nil, films: ["Fantasia"]))
}

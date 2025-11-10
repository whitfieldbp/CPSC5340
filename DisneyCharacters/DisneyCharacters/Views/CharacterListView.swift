//
//  CharacterListView.swift
//  DisneyCharacters
//
//  Created by Benjamin Whitfield on 11/9/25.
//

import SwiftUI

struct CharacterListView: View {
    @EnvironmentObject var viewModel: DisneyCharactersViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Characters...")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text("Error").font(.headline)
                        Text(error).font(.subheadline)
                        Button("Retry") {
                            Task {
                                await viewModel.fetchCharacters()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                } else {
                    List(viewModel.characters) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            HStack(spacing: 12) {
                                AsyncImage(url: URL(string: character.imageUrl ?? "")) { image in
                                    image.resizable().scaledToFill()
                                } placeholder: {
                                    Color.gray.opacity(0.3)
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                Text(character.name).font(.headline)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Disney Characters")
        }
        .task {
            await viewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharacterListView()
        .environmentObject(DisneyCharactersViewModel())
}

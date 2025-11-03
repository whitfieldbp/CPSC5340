//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var vm: FavoritesViewModel
    
    var body: some View {
        List {
            if vm.favoriteCities.isEmpty, vm favoriteHobbies.isEmpty, vm.favoriteBooks.isEmpty {
                Text("No favorites yet!")
                    .foregroundStyle(.secondary)
            } else {
                if !vm.filteredCities.isEmpty {
                    Section("Cities") {
                        ForEach(vm.favoriteCities) { city in
                            HStack {
                                Text(city.cityname)
                                Spacer()
                                Button(role: .destructive) { vm.toggleFavorite(city) } label: { Image(systemName: "heart.slash" )
                                }
                                .buttonStyle(.borderless)
                            }
                        }
                    }
                }
                if !vm.filteredHobbies.isEmpty {
                    Section("Hobbies") {
                        ForEach(vm.favoriteHobbies) { hobby in
                            HStack {
                                Text(hobby)
                                Spacer()
                                Button(role: .destructive) { vm.toggleFavoriteHobby(hobby) } label: { Image(systemName: "heart.slash" )
                                }.buttonStyle(.borderless)
                            }
                        }
                    }
                }
                if !vm.favoriteBooks.isEmpty {
                    Section("Books") {
                        ForEach(vm.favoriteBooks) { book in
                            HStack {
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(book.bookTitle).font(.headline)
                                    Text(book.bookAuthor).font(.subheadline).foregroundStyle(.secondary)
                                }
                                Spacer()
                                Button(role: .destructive) {vm.toggleFavorite(book) } Label: { Image(systemName: "heart.slash" )
                                }
                                .buttonStyle(.borderless)
                            }
                    }
                }
            }
        }
                .navigationTitle("Favorites")
    }
}

#Preview {
    FavoritesView()
}

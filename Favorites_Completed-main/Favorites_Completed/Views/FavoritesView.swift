//
// FavoritesView.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var body: some View {
        NavigationStack{
            List {
                if favorites.cities.contains(where: {$0.isFavorite }) {
                    Section("Favorite Cities") {
                        ForEach(favorites.cities.filter {$0.isFavorite}) { city in
                            CityCardView(city: city)
                                .listRowInsets(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .onTapGesture {}
                                .contentShape(Rectangle())
                        }
                    }
                }
                if favorites.hobbies.contains(where: {$0.isFavorite }) {
                    Section("Favorite Hobbies") {
                        ForEach(favorites.hobbies.filter {$0.isFavorite}) { hobby in
                            HobbyRowView(hobby: hobby)
                        }
                    }
                }
                if favorites.books.contains(where: {$0.isFavorite }) {
                    Section("Favorite Books") {
                        ForEach(favorites.books.filter {$0.isFavorite}) { book in
                            BookRowView(book: book)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesViewModel())
}

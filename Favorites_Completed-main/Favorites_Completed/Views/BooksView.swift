//
//  SwiftUIView.swift
//  Favorites_Completed
//
//  Created by Benjamin Whitfield on 11/2/25.
//

import SwiftUI

struct BooksView: View {
    @EnvironmentObject var favorites: FavoritesViewModel
    @Binding var searchText: String
    
    var body: some View {
        List {
            ForEach(favorites.filteredBooks(searchText: searchText)) { book in
                BookRowView(book: book)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    NavigationStack {
        BooksView(searchText: .constant(""))
            .environmentObject(FavoritesViewModel())
    }
}

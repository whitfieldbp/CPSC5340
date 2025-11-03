//
//  BookRowView.swift
//  Favorites_Completed
//
//  Created by Benjamin Whitfield on 11/2/25.
//

import SwiftUI

struct BookRowView: View {
    let book: BookModel
    @EnvironmentObject var favorites: FavoritesViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(book.bookTitle)
                    .font(.headline)
                Text(book.bookAuthor)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
        }
        Spacer()
            Button(action: {
                favorites.toggleFavoriteBook(book: book)
            }) {
                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(book.isFavorite ? .red : .gray)
                    .imageScale(.large)
            }
        .buttonStyle(.plain)
    }
        .padding(.vertical, 4)
    }
}

#Preview {
    CitiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}

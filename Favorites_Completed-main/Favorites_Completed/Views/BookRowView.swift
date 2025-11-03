//
//  BookRowView.swift
//  Favorites_Completed
//
//  Created by Benjamin Whitfield on 11/2/25.
//

import SwiftUI

struct BookRowView: View {
    let book: BookModel
    let isFavorite: Bool
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(book.bookTitle).font(.headline)
                Text(book.bookAuthor).font(.subheadline).foregroundStyle(.secondary)
        }
        Spacer()
        Button(action: onToggle) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                .foregroundStyle(isFavorite ? .red : .secondary)
            }
        .buttonStyle(.borderless)
    }
        .padding(.vertical, 4)
    }
}

#Preview {
    CitiesView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}

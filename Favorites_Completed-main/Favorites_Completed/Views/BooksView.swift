//
//  SwiftUIView.swift
//  Favorites_Completed
//
//  Created by Benjamin Whitfield on 11/2/25.
//

import SwiftUI

struct BooksView: View {
    @EnvironmentObject var vm: FavoritesViewModel
    @Binding var searchText: String
    
    var body: some View {
        List {
            ForEach(vm.filteredBooks(searchText: searchText)) { book in
                BookRowView(
                    book: book,
                            isFavorite: vm.isBookFavorite(book),
                            onToggle: { vm.toggleFavorite(book)})
        }
    }
    }
        .listStyle(.plain)
        .navigationTitle("Books")
}

#Preview {
    NavigationStack {
        BooksView(searchText: .constant(""))
            .environment(FavoritesViewModel())
    }
}

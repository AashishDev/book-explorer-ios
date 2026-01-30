//
//  BookExplorerApp.swift
//  BookExplorer
//
//  Created by Aashish Tyagi on 1/27/26.
//

import SwiftUI
import BooksListFeature
import BooksData
import BookDetailsFeature

@main
struct BookExplorerApp: App {
    
    var body: some Scene {
        WindowGroup {
            let viewModel = BookListViewModel(bookRepository:MockBookRepository())
            
            BookListView(viewModel: viewModel,
                         makeBookDetailView: { book in
                AnyView(
                    BookDetailView(book: book)
                )
            })
        }
    }
}

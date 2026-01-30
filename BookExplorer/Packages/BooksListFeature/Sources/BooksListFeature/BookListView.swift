// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct BookListView: View {
    @StateObject var viewModel: BookListViewModel
    
    public init(viewModel: BookListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        NavigationView {
            VStack {
                TextField("Search books...", text: $viewModel.searchQuery)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.books) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            BookRowView(book: book)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Books")
            .onChange(of: viewModel.searchQuery) {
                Task {
                    await viewModel.fetchBooks()
                }
            }
            .task {
                await viewModel.fetchBooks()
            }
        }
    }
}

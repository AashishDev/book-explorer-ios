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
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                List {
                    if viewModel.isLoading {
                        ProgressView("Loading...")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        
                        ForEach(viewModel.books) { book in
                            NavigationLink(destination: BookDetailView(book: book)) {
                                BookRowView(book: book){
                                }
                            }
                            .listRowBackground(Color.clear) // ✅ remove white
                            .listRowSeparator(.hidden)
                            .listRowInsets(
                                EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
                            )
                        }
                    }
                }
            }
            .navigationTitle("Books")
            .navigationBarTitleDisplayMode(.large)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .searchable(
            text: $viewModel.searchQuery,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search books"
        )
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



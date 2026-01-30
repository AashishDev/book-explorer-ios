//
//  BookListViewModel.swift
//  BooksListFeature
//
//  Created by Aashish Tyagi on 1/28/26.
//
import SwiftUI
import Core
import CoreInterfaces

@MainActor
public class BookListViewModel: ObservableObject {
    @Published var books: [Book] = []
    @Published var searchQuery: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let bookRepository: BookRepositoryProtocol
    public init(bookRepository: BookRepositoryProtocol) {
        self.bookRepository = bookRepository
    }
    
    func fetchBooks() async {
        
        isLoading = true
        do {
            let fetchedBooks = try await bookRepository.fetchBooks(query: searchQuery)
            books = fetchedBooks
            errorMessage = nil
            
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}



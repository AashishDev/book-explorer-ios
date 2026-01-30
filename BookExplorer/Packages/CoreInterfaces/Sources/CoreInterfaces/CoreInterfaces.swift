// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Core

// MARK: - CoreInterfaces Package
@MainActor
public protocol BookRepositoryProtocol {
    
    /// Fetch a list of books, optionally filtered by search query
    /// - Parameter query: Search string
    /// - Returns: Array of Book
    func fetchBooks(query: String?) async throws -> [Book]
    
//    /// Fetch details of a single book by ID
//    /// - Parameter id: Book ID
//    /// - Returns: Book object
//    func fetchBookDetails(id: Int) async throws -> Book
//
//    /// Add or remove book from favorites
//    func toggleFavorite(bookId: Int) async throws
//    
//    /// Check if a book is favorite
//    func isFavorite(bookId: Int) async throws -> Bool
}

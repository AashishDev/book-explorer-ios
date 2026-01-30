//
//  MockBookRepository.swift
//  BooksData
//
//  Created by Aashish Tyagi on 1/30/26.
//

import Foundation
import CoreInterfaces
import Core

@MainActor
public final class MockBookRepository: BookRepositoryProtocol {

    private var books: [Book] = [
        Book(
            id: 1,
            title: "Clean Architecture",
            author: "Robert C. Martin",
            publishedAt: Date(timeIntervalSince1970: 1_500_000_000),
            coverImage: nil,
            price: 499.0,
            isFavorite: false
        ),
        Book(
            id: 2,
            title: "Swift Concurrency",
            author: "Apple Inc.",
            publishedAt: Date(timeIntervalSince1970: 1_600_000_000),
            coverImage: nil,
            price: 0.0,
            isFavorite: false
        )
    ]

    private var favoriteBookIds: Set<Int> = []

    public init() {}

    // MARK: - BookRepositoryProtocol

    public func fetchBooks(query: String?) async throws -> [Book] {
        guard let query, !query.isEmpty else {
            return books
        }

        return books.filter {
            $0.title.localizedCaseInsensitiveContains(query) ||
            $0.author.localizedCaseInsensitiveContains(query)
        }
    }

    public func fetchBookDetails(id: Int) async throws -> Book {
        guard let book = books.first(where: { $0.id == id }) else {
            throw BookRepositoryError.bookNotFound
        }
        return book
    }

    public func toggleFavorite(bookId: Int) async throws {
        if favoriteBookIds.contains(bookId) {
            favoriteBookIds.remove(bookId)
        } else {
            favoriteBookIds.insert(bookId)
        }
    }

    public func isFavorite(bookId: Int) async throws -> Bool {
        favoriteBookIds.contains(bookId)
    }
}

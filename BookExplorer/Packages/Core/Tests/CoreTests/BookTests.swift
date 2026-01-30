//
//  BookTest.swift
//  Core
//
//  Created by Aashish Tyagi on 1/28/26.
//

import Testing
import SwiftUI
@testable import Core

@Suite("Book model tests")
struct BookTests {
    
    @Test
    func test_bookInitialization_setsAllPropertiesCorrectly() {
        
        let date = Date()
        let coverImage = URL(string: "https://example.com/image.jpg")
        
        let book = Book(
            id: 101,
            title: "a title",
            author: "a author",
            publishedAt: date,
            coverImage: coverImage,
            price: 299.0,
            isFavorite: true
        )
        
        #expect(book.id == 101)
        #expect(book.title == "a title")
        #expect(book.description == "a description")
        #expect(book.author == "a author")
        #expect(book.publishedAt == date)
        #expect(book.coverImage == coverImage)
        #expect(book.price == 299.0)
    }
    
    @Test
    func test_bookInitialization_allowsNilCoverImage() {
        let book = Book(
            id: 102,
            title: "No Image Book",
            description: "Book without cover",
            author: "Unknown",
            publishedAt: Date(),
            coverImage: nil,
            price: 0.0
        )
        
        #expect(book.coverImage == nil)
    }
}

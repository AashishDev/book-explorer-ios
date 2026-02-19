//
//  BookDetailView.swift
//  BooksListFeature
//
//  Created by Aashish Tyagi on 1/30/26.
//

import SwiftUI

public struct BookDetailView: View {

    private let book: Book

    public init(book: Book) {
        self.book = book
    }

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                // MARK: - Cover Image (placeholder for now)
                if let imageURL = book.coverImage {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity, minHeight: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                        case .failure:
                            Image(systemName: "book.closed")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .foregroundColor(.secondary)
                        @unknown default:
                            EmptyView()
                        }
                    }
                } else {
                    Image(systemName: "book.closed")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .foregroundColor(.secondary)
                }

                // MARK: - Title
                Text(book.title)
                    .font(.title)
                    .fontWeight(.bold)

                // MARK: - Author
                Text("by \(book.author)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                // MARK: - Published Date
                Text("Published: \(formattedDate(book.publishedAt))")
                    .font(.footnote)
                    .foregroundColor(.secondary)

                Divider()

                // MARK: - Description
                Text(book.author)
                    .font(.body)

                Divider()

                // MARK: - Price
                Text(priceText)
                    .font(.headline)

                Spacer(minLength: 24)
            }
            .padding()
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Helpers

    private var priceText: String {
        book.price > 0 ? "Price: ₹\(book.price)" : "Free"
    }

    private func formattedDate(_ date: Date) -> String {
        date.formatted(date: .long, time: .omitted)
    }
}

//
//  BookRow.swift
//  BooksListFeature
//
//  Created by Aashish Tyagi on 1/28/26.
//

import SwiftUI
import Core

struct BookRowView: View {
    let book: Book
    let onFavoriteTap: (() -> Void)?

    var body: some View {
        ZStack(alignment: .topTrailing) {

            // Card content
            HStack {
                AsyncImage(url: book.coverImage) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 130, height: 150)
                .cornerRadius(8)

                VStack(alignment: .leading, spacing: 6) {
                    Text(book.title)
                        .font(.headline)

                    Text(book.author)
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text("$\(book.price, specifier: "%.2f")")
                        .font(.subheadline)

                    Spacer()
                }

                Spacer()
            }
            .padding()

            // ❤️ Favorite button (top-right)
            Button(action: {
                onFavoriteTap?()
            }) {
                Image(systemName: book.isFavorite == true ? "heart.fill" : "heart")
                    .foregroundColor(book.isFavorite == true ? .red : .gray)
                    .background(
                        Circle()
                            .fill(Color(.systemBackground))
                    )
            }
            .padding(10)
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.05), radius: 4, y: 2)
        )
        //.padding(.horizontal,5)
    }
}



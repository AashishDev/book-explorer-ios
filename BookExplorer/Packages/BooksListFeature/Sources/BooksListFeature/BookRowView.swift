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

    var body: some View {
        HStack {
            AsyncImage(url: book.coverImage) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 60, height: 90)
            .cornerRadius(5)

            VStack(alignment: .leading, spacing: 5) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("$\(book.price, specifier: "%.2f")")
                    .font(.subheadline)
            }
            Spacer()
            if book.isFavorite ?? false {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 5)
    }
}

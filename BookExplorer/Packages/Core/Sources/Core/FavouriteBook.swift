//
//  FavouriteBook.swift
//  Core
//
//  Created by Aashish Tyagi on 1/28/26.
//

import Foundation

public struct FavoriteBook: Identifiable, Codable {
    public let id: Int
    public let bookId: Int
    public let addedAt: Date
}

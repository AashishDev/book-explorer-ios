//
//  FavouriteBook.swift
//  BookFeature
//
//  Created by Aashish Tyagi on 2/19/26.
//
import Foundation

public struct FavoriteBook: Identifiable, Codable {
    public let id: Int
    public let bookId: Int
    public let addedAt: Date
}

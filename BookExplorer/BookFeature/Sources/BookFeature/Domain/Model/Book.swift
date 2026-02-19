//
//  B.swift
//  BookFeature
//
//  Created by Aashish Tyagi on 2/19/26.
//
import Foundation

public struct Book:Identifiable,Sendable {
    public let id:Int
    public let title:String
    public let author:String
    public let publishedAt:Date
    public let coverImage:URL?
    public let price:Double
    public let isFavorite: Bool?
    
    public init(id: Int, title: String, author: String, publishedAt: Date, coverImage: URL?, price: Double, isFavorite: Bool?) {
        self.id = id
        self.title = title
        self.author = author
        self.publishedAt = publishedAt
        self.coverImage = coverImage
        self.price = price
        self.isFavorite = isFavorite
    }
    
}

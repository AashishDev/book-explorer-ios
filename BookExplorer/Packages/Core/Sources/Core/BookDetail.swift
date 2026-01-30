//
//  BookDetail.swift
//  Core
//
//  Created by Aashish Tyagi on 1/28/26.
//
import Foundation

public struct BookDetail: Identifiable {
    public let id:Int
    let title:String
    let description:String
    let author:String
    let publishedAt:Date
    let coverImage:URL?
    let price:Double
}

//
//  RemoteBookRepository.swift
//  BooksData
//
//  Created by Aashish Tyagi on 1/30/26.
//

import Foundation
import CoreInterfaces
import Core
import NetworkKit

@MainActor
public final class RemoteBookRepository: BookRepositoryProtocol {
    
    private let httpClient: HTTPClientProtocol
    
    public init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    public func fetchBooks(query: String?) async throws -> [Core.Book] {
        return []
    }
}

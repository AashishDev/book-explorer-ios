//
//  HTTPClient.swift
//  NetworkKit
//
//  Created by Aashish Tyagi on 1/30/26.
//

import Foundation

public protocol HTTPClientProtocol {
    func execute(_ request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse)
}

public class HTTPClient: HTTPClientProtocol {
    
    private let session: URLSession
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    public func execute(_ request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {
        
        do {
            let (data, response) = try await session.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard httpResponse.isSuccessful else {
                throw NetworkError.httpError(
                    statusCode: httpResponse.statusCode,
                    data: data
                )
            }
            return (data, httpResponse)
        }
        
        catch {
            throw NetworkError.transport(error)
        }
    }
    
}

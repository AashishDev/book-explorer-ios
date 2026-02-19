//
//  RetryingHTTPClient.swift
//  NetworkKit
//
//  Created by Aashish Tyagi on 1/30/26.
//

import Foundation

public final class HTTPClientWithRetry: HTTPClientProtocol {

    private let client: HTTPClientProtocol
    private let maxRetries: Int

    public init(
        client: HTTPClientProtocol,
        maxRetries: Int = 3
    ) {
        self.client = client
        self.maxRetries = maxRetries
    }

    public func execute(
        _ request: URLRequest) async throws -> (data: Data, response: HTTPURLResponse) {

        for attempt in 0...maxRetries {
            do {
                return try await client.execute(request)
            } catch {
                guard attempt < maxRetries else {
                    throw error
                }

                try await Task.sleep(nanoseconds: 500_000_000)
            }
        }

        throw URLError(.unknown)
    }

}

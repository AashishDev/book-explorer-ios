//
//  DefaultRetryPolicy.swift
//  NetworkKit
//
//  Created by Aashish Tyagi on 1/30/26.
//

public final class DefaultRetryPolicy: RetryPolicy {

    private let maxRetries: Int
    private let baseDelay: UInt64

    public init(
        maxRetries: Int = 3,
        baseDelay: UInt64 = 500_000_000
    ) {
        self.maxRetries = maxRetries
        self.baseDelay = baseDelay
    }

    public func shouldRetry(after error: Error, attempt: Int) async -> Bool {
        attempt < maxRetries
    }

    public func retryDelay(attempt: Int) async -> UInt64 {
        baseDelay * UInt64(attempt + 1)
    }
}

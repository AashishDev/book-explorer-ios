//
//  RetryPolicy.swift
//  NetworkKit
//
//  Created by Aashish Tyagi on 1/30/26.
//

public protocol RetryPolicy {
    func shouldRetry(after error: Error, attempt: Int) async -> Bool
    func retryDelay(attempt: Int) async -> UInt64
}

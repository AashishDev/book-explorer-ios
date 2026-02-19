//
//  NetworkError.swift
//  NetworkKit
//
//  Created by Aashish Tyagi on 1/30/26.
//

import Foundation

public enum NetworkError: Error {
    case invalidResponse
    case httpError(statusCode: Int, data: Data)
    case transport(Error)
}

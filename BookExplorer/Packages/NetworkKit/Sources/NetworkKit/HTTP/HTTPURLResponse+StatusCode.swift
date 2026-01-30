//
//  HTTPURLResponse+StatusCode.swift
//  NetworkKit
//
//  Created by Aashish Tyagi on 1/30/26.
//
import Foundation

extension HTTPURLResponse {
    private static var SUCCESS_200: Int { 200 }
    
    var isSuccessful: Bool { statusCode == HTTPURLResponse.SUCCESS_200 }
}

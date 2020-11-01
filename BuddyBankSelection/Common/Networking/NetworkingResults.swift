//
//  NetworkingResults.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 24/10/2020.
//

import Foundation
/// the possible error when we are requesting
public enum RequestErrorType: Error {
    case noInternet
    case badRequest
    case serverError
    case serializationError
    case finished
}

/// the result types
enum Result<T> {
    case success(T)
    case failure(Error)
}

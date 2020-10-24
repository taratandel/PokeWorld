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
}

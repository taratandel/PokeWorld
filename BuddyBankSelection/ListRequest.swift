//
//  RequestResults.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 23/10/2020.
//

import Foundation

struct ListRequest: Codable {
    var next: String?
    var previous: String?
    var results: [PokemonResults]
}

struct PokemonResults: Codable {
    var name: String?
    var url: String?
}


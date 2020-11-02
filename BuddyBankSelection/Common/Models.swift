//
//  RequestResults.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 23/10/2020.
//

import Foundation
// Models For List
struct ListRequest: Codable {
    var next: String?
    var previous: String?
    var results: [PokemonResults]?
}

struct PokemonResults: Codable {
    var name: String?
    var url: String?
}


// Models For Details

struct DetailsRequest: Codable {
    var name: String?
    var id: Int?
    var stats: [Stats]?
    var types: [Types]?
    
}

struct Stats: Codable {
    var base_stat: Int?
    var effort: Int?
    var stat: Stat?
}

struct Stat: Codable {
    var name: String?
    var url: String?
}

struct Types: Codable {
    var slot: Int?
    var type: Type?
}

struct Type: Codable {
    var name: String?
}

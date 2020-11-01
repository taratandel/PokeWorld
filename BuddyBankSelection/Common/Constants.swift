//
//  File.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 24/10/2020.
//

struct EndPoints {
    static let serverFirstList = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20"
    static let imageServer = "https://pokeres.bastionbot.org/images/pokemon/"
}

enum requestType {
    case image(pokemonId: Int)
    
    var path: String {
        switch self {
        case .image(let pokemonId):
            return String(format: "%@\(pokemonId).png", EndPoints.imageServer)
        }
    }
}

//
//  Networking.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 23/10/2020.
//

import Foundation
class Networking {
    
    weak var requestProtocol: RequestServices?
    /**
     initializes a client for the given protocol
     - Parameters:
        - requestProtocol: the class that we want the client to be initialized for
     */
    init(requestProtocol: RequestServices) {
        self.requestProtocol = requestProtocol
    }
    /**
     This  function will handle GET request pased in methods
     - Parameters:
        - url: the API url string

     */
    let session = URLSession.shared
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20")
    func doTheReq(url: String) {
        if !Reachability.isConnectedToNetwork() {
            self.requestProtocol?.reqFailed(error: RequestErrorType.noInternet)
        }
        let task = self.session.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            // Check the response
            if error != nil {
                self.requestProtocol?.reqFailed(error: error!)
                return
            }
            do {
                let json = try JSONDecoder().decode(RequestResults.self, from: data! )
                self.requestProtocol?.reqIsComplete(results: json)
            } catch {
                self.requestProtocol?.reqFailed(error: RequestErrorType.badRequest)
            }
            
        })
        task.resume()
    }
}

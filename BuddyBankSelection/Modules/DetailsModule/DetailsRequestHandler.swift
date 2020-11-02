//
//  DetailsRequestHandler.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 29/10/2020.
//

import Foundation
class DetailsRequestHandler {
    weak var requestProtocol: DetailsRequestHandlerDelegate?
    /**
     initializes a client for the given protocol
     - Parameters:
     - requestProtocol: the class that we want the client to be initialized for
     */
    init(requestProtocol: DetailsRequestHandlerDelegate) {
        self.requestProtocol = requestProtocol
    }
    var network = Networking()
    
}

extension DetailsRequestHandler: RequestHandlerDelegate {
    func requesForTheList(url: String) {
        self.network.doTheReq(url: url) {
            results in
            switch results {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(DetailsRequest.self, from: data ?? Data())
                    self.requestProtocol?.reqIsComplete(results: response)
                } catch {
                    self.requestProtocol?.reqFailed(error: RequestErrorType.serializationError)
                }
            case .failure(let error):
                self.requestProtocol?.reqFailed(error: error)
            }
        }
    }
}

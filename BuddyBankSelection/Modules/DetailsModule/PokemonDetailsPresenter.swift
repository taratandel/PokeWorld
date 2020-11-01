//
//  PokemonDetailsPresenter.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 31/10/2020.
//

import Foundation
class PokemonDetailsPresenter: DetailsRequestHandlerDelegate {
    // delegates
    var reqHandler: RequestHandlerDelegate?
    var view: DetailsPresenterDelegate?
    
    private var pokemonUrl: String?
    
    private var pokemonDetails: DetailsRequest?
    
    init(view: DetailsPresenterDelegate) {
        self.view = view
    }
    private func reqForTheDetails(url: String?) {
        var urlToReq = ""
        if url == nil && pokemonUrl != nil{
            urlToReq = pokemonUrl!
        }
        urlToReq = url ?? ""
        reqHandler = DetailsRequestHandler(requestProtocol: self)
        reqHandler?.requesForTheList(url: urlToReq)
    }
    
    func reqFailed(error: Error) {
        //TODO: view?.reqFailed(error: error)
    }
    
    func reqIsComplete(results: DetailsRequest) {
        pokemonDetails = results
        view?.reloadPage()
        //TODO: prepare the req for the image
        //TODO: prepare the req for the tagList
        //TODO: prepare the req for the image
        
    }

}

extension PokemonDetailsPresenter: DetailsViewDelegate {
    func viewDidLoad(url: String) {
        self.reqForTheDetails(url: url)
    }
    
    func reqAgain() {
        self.reqForTheDetails(url: nil)
    }
    
    func getImageURL() -> URL? {
        guard let id = pokemonDetails?.id else {
            return nil
        }
        return URL(string: requestType.image(pokemonId: id).path)
    }
    
    
}

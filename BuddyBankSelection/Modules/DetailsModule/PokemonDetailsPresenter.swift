//
//  PokemonDetailsPresenter.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 31/10/2020.
//

import Foundation
import UIKit

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
    
    
    func generateDataForBarChar() -> [DataEntry]? {
        let scope = pokemonDetails?.stats?.reduce(into: [Int: String]()) {
            print($0)

            $0[$1.base_stat ?? 0] = $1.stat?.name
        }
        guard let scopes = scope else {
            return nil
        }
        var dataForChart: [DataEntry] = []
        
        for element in scopes {
            let color = UIColor.random()
            let height = Float(element.key)/100
            let textValue = "\(height)"
            let title = element.value
            dataForChart.append(DataEntry(color: color, height: height, textValue: textValue, title: title))
        }
        return dataForChart
    }
}

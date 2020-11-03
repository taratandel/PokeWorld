//
//  PokemonDetailsPresenter.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 31/10/2020.
//

import Foundation
import UIKit

class PokemonDetailsPresenter: DetailsRequestHandlerDelegate {
    // data
    private var pokemonUrl: String?
    private var pokemonDetails: DetailsRequest?

    // delegates
    private weak var wireFrameDelegate: PokemonDetailsWireFrameDelegate?
    var reqHandlerDelegate: RequestHandlerDelegate?
    weak var detailsPresenterDelegate: DetailsPresenterDelegate?
    
    
    init(for detailsPresenterDelegate: DetailsPresenterDelegate, using wireFrameDelegate: PokemonDetailsWireFrameDelegate, with url: String) {
        self.detailsPresenterDelegate = detailsPresenterDelegate
        self.wireFrameDelegate = wireFrameDelegate
        self.pokemonUrl = url
    }
    
    private func reqForTheDetails() {
        guard let urlToReq = pokemonUrl else {
            //TODO: show the error
            return
        }
        reqHandlerDelegate?.requesForTheList(url: urlToReq)
    }
    
    func reqFailed(error: Error) {
        detailsPresenterDelegate?.reqFailed(error: error)
    }
    
    func reqIsComplete(results: DetailsRequest) {
        pokemonDetails = results
        detailsPresenterDelegate?.reloadPage()
    }

}
// MARK: - DetailsViewDelegate
extension PokemonDetailsPresenter: DetailsViewDelegate {
    func viewDidLoad() {
        self.reqForTheDetails()
    }
    
    func reqAgain() {
        self.reqForTheDetails()
    }
    
    func getImageURL() -> URL? {
        guard let id = pokemonDetails?.id else {
            return nil
        }
        return URL(string: requestType.image(pokemonId: id).path)
    }
    
    func shouldLoadTagList(tagList: inout TagBarViewController) {
        let scopes : [String]? = pokemonDetails?.types?.map {
            ($0.type?.name ?? "")
        }

        guard let tagListScopes = scopes else {
            return
        }

        tagList.scopes = tagListScopes
    }
    
    func generateDataForBarChar() -> [DataEntry]? {
        let scope = pokemonDetails?.stats?.reduce(into: [Int: String]()) {
            $0[$1.base_stat ?? 0] = $1.stat?.name
        }
        
        
        guard let scopes = scope else {
            return nil
        }
        
        
        var dataForChart: [DataEntry] = []
        
        for element in scopes {
            let color = UIColor.darkRandom()
            let height = Float(element.key)/100
            let textValue = "\(height)"
            let title = element.value
            dataForChart.append(DataEntry(color: color, height: height, textValue: textValue, title: title))
        }
        return dataForChart
    }
    
    func getPokemonName() -> String {
        if let name = pokemonDetails?.name {
            return name
        }
        else {
            return "Pokemon"
        }
    }
}

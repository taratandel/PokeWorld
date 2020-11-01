//
//  PokemonListPresenter.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 28/10/2020.
//

import Foundation
import UIKit

class PokemonListPresenter: ListRequestResponseDelegate {
    // delegates
    var reqHandler: RequestHandlerDelegate?
    var view: ListPresenterDelegate?
    
    private var pokemonResults = [PokemonResults]()
    
    var url = EndPoints.serverFirstList
    
    init(view: ListPresenterDelegate) {
        self.view = view
    }
    private func reqForTheList() {
        if url == "" {return}
        reqHandler?.requesForTheList(url: url)
    }
    
    func reqIsComplete(results: ListRequest) {
        if results.next == nil {
        let error = RequestErrorType.finished
            view?.reqFailed(error: error)
        }
         if results.results != nil{
            url = results.next!
            self.pokemonResults.append(contentsOf: results.results!)
            view?.reloadPage()
        }
        else {
            let error = RequestErrorType.finished
            view?.reqFailed(error: error)
        }
    }
    
    func reqFailed(error: Error) {
        view?.reqFailed(error: error)
    }
    
    func reqAgain() {
        self.reqForTheList()
    }
    
}

extension PokemonListPresenter: ListViewDelegate {
    func viewDidLoad() {
        reqHandler = ListRequestHandler(requestProtocol: self)
        self.reqForTheList()
    }
    
    func getElementForIndexPath(index: IndexPath) -> String? {
        let numberOfResults = pokemonResults.count
        if index.row == numberOfResults - 2 {
            self.reqForTheList()
        }
        if index.row < numberOfResults - 1 {
            return pokemonResults[index.row].name
        }
        else {
            view?.reqFailed(error: RequestErrorType.badRequest)
            return nil
        }
    }
    
    func getNumberOfElements(in section: Int?) -> Int {
        return pokemonResults.count
    }
}

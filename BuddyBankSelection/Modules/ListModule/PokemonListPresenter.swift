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
    private var wireFrameDelegate: ListWireFrameDelegate?
    var reqHandlerDelegate: RequestHandlerDelegate?
    weak var listPresenterDelegate: ListPresenterDelegate?
    
    // data
    private var pokemonResults = [PokemonResults]()
    private var url = EndPoints.serverFirstList
    
    init(for listPresenterDelegate: ListPresenterDelegate, using wireFrameDelegate: ListWireFrameDelegate) {
        self.listPresenterDelegate = listPresenterDelegate
        self.wireFrameDelegate = wireFrameDelegate
    }
    
    private func reqForTheList() {
        if url == "" {return}
        reqHandlerDelegate?.requesForTheList(url: url)
    }
    
    func reqIsComplete(response: ListRequest) {
        if response.next == nil {
        let error = RequestErrorType.finished
            listPresenterDelegate?.reqFailed(error: error)
            return
        }
        if response.results != nil {
            url = response.next!
            self.pokemonResults.append(contentsOf: response.results!)
            listPresenterDelegate?.reloadPage()
        }
        else {
            let error = RequestErrorType.finished
            listPresenterDelegate?.reqFailed(error: error)
        }
    }
    
    func reqFailed(error: Error) {
        listPresenterDelegate?.reqFailed(error: error)
    }
    
    func reqAgain() {
        self.reqForTheList()
    }
    
}
// MARK: - ListViewDelegate
extension PokemonListPresenter: ListViewDelegate {
    func viewDidLoad() {
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
            listPresenterDelegate?.reqFailed(error: RequestErrorType.badRequest)
            return nil
        }
    }
    
    func getNumberOfElements(in section: Int?) -> Int {
        return pokemonResults.count
    }
}

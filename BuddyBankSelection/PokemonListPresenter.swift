//
//  PokemonListPresenter.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 28/10/2020.
//

import Foundation
class PokemonListPresenter:RequestResponseDelegate {
    
    var reqHandler: ListRequestHandlerDelegate?
    var url = EndPoints.serverFirstList
    func reqForTheList() {
        if url == "" {return}
        reqHandler?.requesForTheList(url: url)
    }
    
    func reqIsComplete(results: ListRequest) {
        if results.next == nil {
            var alertText = "It's finished sorry :("
            url = ""
            //TODO: show alert that it's finished
        }
        else {
            url = results.next!
        }
         //TODO: pass the refactor list to the view
    }
    
    func reqFailed(error: Error) {
        var alertText = ""
       
        switch error {
        case RequestErrorType.noInternet:
        //TODO: ask To retry
            alertText = "Please check your internet and try again"
            
        case RequestErrorType.badRequest:
            alertText = "There is something wrong in our side sorry"
        case RequestErrorType.serverError:
            alertText = "Sever is not working :("
        case RequestErrorType.serializationError:
            alertText = "Something's changed on the server!"
        default:
            alertText = error.localizedDescription
        }
    }
    
}

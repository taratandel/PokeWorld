//
//  PokemonListPresenter.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 28/10/2020.
//

import Foundation
import UIKit

class PokemonListPresenter:RequestResponseDelegate {
    
    var reqHandler: ListRequestHandlerDelegate?
    var view: ListPresenterDelegate?
    
    var url = EndPoints.serverFirstList
    private func reqForTheList() {
        if url == "" {return}
        reqHandler?.requesForTheList(url: url)
    }
    
    func reqIsComplete(results: ListRequest) {
        if results.next == nil {
            let alertText = "It's finished sorry :("
            url = ""
            let actions = [UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })]
            view?.showAlert(title: "WoW you made it", message: alertText, actions: actions)
            //TODO: show alert that it's finished
        }
        else {
            url = results.next!
        }
         //TODO: pass the refactor list to the view
    }
    
    func reqFailed(error: Error) {
        var alertText = ""
        var actions = [UIAlertAction()]
        var title = ""
        switch error {
        case RequestErrorType.noInternet:
        //TODO: ask To retry
            alertText = "Please check your internet and try again"
            actions = [UIAlertAction(title: "Retry", style: .default, handler: { [weak self](action) in
                self?.reqForTheList()
            }), UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })
            ]
            title = "No Internet"
        case RequestErrorType.badRequest:
            alertText = "There is something wrong in our side sorry"
            actions = [UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })]
            title = "Bad Request"
        case RequestErrorType.serverError:
            alertText = "Sever is not working right now :("
            actions = [UIAlertAction(title: "Retry", style: .default, handler: { [weak self](action) in
                self?.reqForTheList()
            }), UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })
            ]
            title = "Server Error"
        case RequestErrorType.serializationError:
            alertText = "Something's changed on the server!"
            actions = [UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })]
            title = "Ooops!"
        default:
            title = "Ooops!"
            alertText = error.localizedDescription
            actions = [UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })]
        }
        view?.showAlert(title: title, message: alertText, actions: actions)
    }
    
}

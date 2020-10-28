//
//  Protocols.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 24/10/2020.
//

import Foundation
import UIKit
// handler -> networking
protocol RequestResponseDelegate: class {
    func reqIsComplete(results: ListRequest)
    func reqFailed(error: Error)
}
// presenter -> handler
protocol ListRequestHandlerDelegate: class {
    func requesForTheList(url: String)
}
// presenter -> view
protocol ListPresenterDelegate: class {
    func reloadPage (nameList: [String])
    func showAlert (title: String, message: String, actions: [UIAlertAction])
}

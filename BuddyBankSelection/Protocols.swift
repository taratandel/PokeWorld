//
//  Protocols.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 24/10/2020.
//

import Foundation
import UIKit
// Listhandler -> networking
protocol ListRequestResponseDelegate: class {
    func reqIsComplete(results: ListRequest)
    func reqFailed(error: Error)
}
// Listpresenter -> Listhandler
protocol RequestHandlerDelegate: class {
    func requesForTheList(url: String)
}
// Listpresenter -> Listview
protocol ListPresenterDelegate: class {
    func showAlert (title: String, message: String, actions: [UIAlertAction])
    func reloadPage()
}
// Listview -> Listpresenter
protocol ListViewDelegate: class {
    func getElementForIndexPath(index: IndexPath) -> String?
    func getNumberOfElements(in section: Int?) -> Int
    func viewDidLoad()
}


protocol DetailsRequestHandlerDelegate: class {
    func reqIsComplete(results: DetailsRequest)
    func reqFailed(error: Error)
}

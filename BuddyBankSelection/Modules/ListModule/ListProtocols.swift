//
//  ListProtocols.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 31/10/2020.
//

import UIKit

// Listhandler -> networking
protocol ListRequestResponseDelegate: ReqErrorDelegate {
    func reqIsComplete(results: ListRequest)
}
// Listpresenter -> Listview
protocol ListPresenterDelegate: ReqErrorDelegate {
    func reloadPage()
}
// Listview -> Listpresenter
protocol ListViewDelegate: class {
    func getElementForIndexPath(index: IndexPath) -> String?
    func getNumberOfElements(in section: Int?) -> Int
    func viewDidLoad()
    func reqAgain()
}

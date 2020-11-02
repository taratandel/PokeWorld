//
//  ListProtocols.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 31/10/2020.
//

import UIKit

// Listhandler -> networking
protocol ListRequestResponseDelegate: ReqErrorDelegate {
    var reqHandlerDelegate: RequestHandlerDelegate? { get set }
    func reqIsComplete(response: ListRequest)
}
// Listpresenter -> Listview
protocol ListPresenterDelegate: ReqErrorDelegate {
    func reloadPage()
}
// Listview -> Listpresenter
protocol ListViewDelegate: class {
    var listPresenterDelegate: ListPresenterDelegate? {set get}
    
    func getElementForIndexPath(index: IndexPath) -> String?
    func getNumberOfElements(in section: Int?) -> Int
    func viewDidLoad()
    func reqAgain()
    func prepareToPresent(indexPath: IndexPath)
}

// MARK: - Presenter -> WireFrame
protocol ListWireFrameDelegate: class {
    static func creatTheView(_ viewRef: ListPokemonViewController)
    func presentDetailsView(with url: String)
}

//
//  DetailsProtocol.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 31/10/2020.
//

import UIKit

protocol DetailsRequestHandlerDelegate: ReqErrorDelegate {
    var reqHandlerDelegate: RequestHandlerDelegate? { get set }
    func reqIsComplete(results: DetailsRequest)
}
// Detailspresenter -> Detailsview
protocol DetailsPresenterDelegate: ReqErrorDelegate {
    func reloadPage()
}
// Detailsview -> Detailspresenter
protocol DetailsViewDelegate: class {
    var detailsPresenterDelegate: DetailsPresenterDelegate? {set get}

    func viewDidLoad()
    func reqAgain()
    func getImageURL() -> URL?
    func shouldLoadTagList(tagList: inout TagBarViewController)
    func generateDataForBarChar() -> [DataEntry]?
    func getPokemonName() -> String
}

//Presenter -> WireFrame
protocol PokemonDetailsWireFrameDelegate: class {
    static func creatDetailsView(_ viewController: PokemonDetailsViewController, url: String)
//    func openMainView()
}

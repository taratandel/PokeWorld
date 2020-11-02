//
//  DetailsProtocol.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 31/10/2020.
//

import UIKit

protocol DetailsRequestHandlerDelegate: ReqErrorDelegate {
    func reqIsComplete(results: DetailsRequest)
}
// Detailspresenter -> Detailsview
protocol DetailsPresenterDelegate: ReqErrorDelegate {
    func reloadPage()
}
// Detailsview -> Detailspresenter
protocol DetailsViewDelegate: class {
    func viewDidLoad(url: String)
    func reqAgain()
    func getImageURL() -> URL?
    func generateDataForBarChar() -> [DataEntry]?
}

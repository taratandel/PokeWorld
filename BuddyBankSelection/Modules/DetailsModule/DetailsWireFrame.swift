//
//  DetailsWireFrame.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 02/11/2020.
//

import Foundation
import UIKit

class PokemonDetailsWireFrame: PokemonDetailsWireFrameDelegate {
    static func creatDetailsView(_ viewController: PokemonDetailsViewController, url: String) {
                
        let wireframe = PokemonDetailsWireFrame()
        
        let presenter: DetailsRequestHandlerDelegate & DetailsViewDelegate = PokemonDetailsPresenter(for: viewController, using: wireframe, with: url)
        let webClinet: RequestHandlerDelegate = DetailsRequestHandler(requestProtocol: presenter)
        presenter.reqHandlerDelegate = webClinet
        
        viewController.detailsViewDelegate = presenter
        viewController.detailsViewDelegate?.detailsPresenterDelegate = viewController

    }
}

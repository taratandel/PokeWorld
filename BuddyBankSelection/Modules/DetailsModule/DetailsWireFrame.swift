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
    
//    func openMainView() {
//        let nav = UINavigationController()
//        let initialStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vcs = initialStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        GestureListWireFrame.creatTheView(vcs)
//        nav.viewControllers = [vcs]
//        UIApplication.shared.keyWindow?.rootViewController = nav
//        
//    }
}

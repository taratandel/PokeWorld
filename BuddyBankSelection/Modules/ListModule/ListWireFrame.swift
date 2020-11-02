//
//  ListWireFrmae.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 02/11/2020.
//

import Foundation

class ListWireFrame: TopViewControllerGettable, ListWireFrameDelegate {
    
    class func creatTheView(_ viewController: ListPokemonViewController){
        let wireframe = ListWireFrame()
        
        let presenter: ListRequestResponseDelegate & ListViewDelegate = PokemonListPresenter(for: viewController, using: wireframe)
        let webClinet: RequestHandlerDelegate = ListRequestHandler(requestProtocol: presenter)
        presenter.reqHandlerDelegate = webClinet
        
        viewController.listViewDelegate = presenter
        viewController.listViewDelegate?.listPresenterDelegate = viewController
        
        
    }
    func presentDetailsView(with url: String) {
        let detailView = PokemonDetailsViewController()
        PokemonDetailsWireFrame.creatDetailsView(detailView, url: url)
        guard let listViewVC = topNavController else { return }
        listViewVC.pushViewController(detailView, animated: true)
        
    }
}

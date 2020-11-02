////
////  DetailsWireFrame.swift
////  BuddyBankSelection
////
////  Created by Tara Tandel on 02/11/2020.
////
//
//import Foundation
//import UIKit
//
//class GestureDetailsWireFrame: GestureDetailsWireFramProtocol {
//    
//    static func creatTheGestureDetailsView(_ view: GestureDetailsViewController) {
//        let interector = GestureDetailsInterector()
//        
//        let wireFrame = GestureDetailsWireFrame()
//        
//        let presenter: GestureDetailsPresenterProtocol & GestureDetailsOutputPresenterProtocol = GestureDetailsPresentor(interector: interector, router: wireFrame)
//        
//        let client = FetchRemoteData(requestProtocol: interector)
//        
//        view.presenter = presenter
//        view.presenter.interface = view
//        
//        interector.presenter = presenter
//        interector.client = client
//
//    }
//    
//    func openMainView() {
//        let nav = UINavigationController()
//        let initialStoryBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vcs = initialStoryBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        GestureListWireFrame.creatTheView(vcs)
//        nav.viewControllers = [vcs]
//        UIApplication.shared.keyWindow?.rootViewController = nav
//        
//    }
//}

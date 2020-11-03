//
//  MockClasses.swift
//  BuddyBankSelectionTests
//
//  Created by Tara Tandel on 03/11/2020.
//

import Foundation

@testable import BuddyBankSelection


class MockVC: ListPresenterDelegate {
    var pageIsReloaded = false
    var failedError: Error?
    
    var listViewDelegate: ListViewDelegate?
    
    func reloadPage() {
        pageIsReloaded = true
    }
    
    func reqFailed(error: Error) {
        failedError = error
    }
    
}

class MockWireFrame: ListWireFrameDelegate {
    var detailsVCPresented = false
    static func creatTheView(_ viewRef: ListPokemonViewController) {
        
    }
    
    func presentDetailsView(with url: String) {
        detailsVCPresented = true
    }
    
    
}

class MockHandler: RequestHandlerDelegate {
    var urlForTest = ""
    weak var requestProtocol: ListRequestResponseDelegate?
    
    func requesForTheList(url: String) {
        urlForTest = url
    }
}

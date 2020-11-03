//
//  BuddyBankSelectionTests.swift
//  BuddyBankSelectionTests
//
//  Created by Tara Tandel on 23/10/2020.
//

import XCTest
@testable import BuddyBankSelection

class ListPresenterTest: XCTestCase {
    var vc: MockVC!
    var handler: MockHandler!
    
    var testPresenter: PokemonListPresenter!
    
    override func setUpWithError() throws {
        setupView()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        vc = nil
        handler = nil
        
        testPresenter = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReqIsComplete() {
        let response: ListRequest = Helper().readFromJsonFile(for: "List", with: "json", of: ListRequest.self)!
        testPresenter.reqIsComplete(response: response)
        
        XCTAssertTrue(response.results?.count == 20)
        XCTAssertTrue(vc.pageIsReloaded, "testReqComplete is true")
    }
    
    func setupView() {
        let wireFrame = MockWireFrame()
        
        handler = MockHandler()
        vc = MockVC()
        
        testPresenter = PokemonListPresenter(for: vc, using: wireFrame)
        handler.requesForTheList(url: "Mock URL")
        testPresenter.reqHandlerDelegate = handler
        
        
    }
}


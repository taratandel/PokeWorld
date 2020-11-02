//
//  Protocols.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 24/10/2020.
//

import Foundation
import UIKit


protocol ReqErrorDelegate: class {
    func reqFailed(error: Error)
}

protocol RequestHandlerDelegate: class {
    func requesForTheList(url: String)
}

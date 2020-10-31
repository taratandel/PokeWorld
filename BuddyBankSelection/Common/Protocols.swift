//
//  Protocols.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 24/10/2020.
//

import Foundation
import UIKit
// Listhandler -> networking
protocol ListRequestResponseDelegate: class {
    func reqIsComplete(results: ListRequest)
    func reqFailed(error: Error)
}

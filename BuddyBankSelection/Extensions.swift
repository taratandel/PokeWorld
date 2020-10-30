//
//  Extensions.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import Foundation

extension Flia {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

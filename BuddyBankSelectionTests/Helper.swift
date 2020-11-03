//
//  Helper.swift
//  BuddyBankSelectionTests
//
//  Created by Tara Tandel on 03/11/2020.
//

import Foundation

class Helper {
    
    
    func readFromJsonFile<T: Codable>(for resource:String, with format: String, of type: T.Type) -> T? {
        if let data = readFromFile(for: resource, with: format) {
            do {
                let response: T = try JSONDecoder().decode(type, from: data )
                return response
            } catch {
                print("Error")

                return nil
            }
            
        } else {
            return nil
        }
        
    }
    
    private func readFromFile(for resource:String, with format: String) -> Data? {
        if let path = Bundle.main.path(forResource: resource
                                       , ofType: format) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch  {
                return nil
            }
        }
        return nil
    }
}

//
//  Networking.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 23/10/2020.
//

import Foundation
class Networking {
    
    /**
     This  function will handle GET request pased in methods
     - Parameters:
        - url: the API url string
        - completionHandler: the call back function

     */
    let session = URLSession.shared
    func doTheReq(url: String, completionHandler: @escaping (_ result: Result<Data?>) -> Void) {
        if !Reachability.isConnectedToNetwork() {
            completionHandler(.failure(RequestErrorType.noInternet))
        }
        let task = self.session.dataTask(with: URL(string: url)!, completionHandler: { data,_,error  in
            if error != nil {
                completionHandler(.failure(error!))
            } else if data != nil{
                completionHandler(.success(data))
            } else {
                completionHandler(.failure(RequestErrorType.badRequest))
            }
            
        })
        task.resume()
    }
}

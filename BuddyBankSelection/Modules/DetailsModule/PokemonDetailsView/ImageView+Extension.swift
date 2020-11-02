//
//  ImageView+Extension.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

extension UIImageView {
    func load(url: URL, completionHandler:  @escaping (_ isFinished: Bool) -> Void){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completionHandler(true)
                    }
                }
                else {
                    completionHandler(false)
                }
            } else {
                completionHandler(false)
            }
        }
    }
}


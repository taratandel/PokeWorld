//
//  BaseVC.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class BaseViewController: UIViewController {
    var indicatorView: IndicatorViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func showIndicatorView(with text: String) {
        indicatorView = IndicatorViewController(indicatorMessage: text, indicatorColor: .red)
        guard let indicator = indicatorView else {return}
        indicator.view.frame = self.view.frame
        self.view.addSubview(indicator.view)
        self.view.bringSubviewToFront(indicator.view)
    }
    
    func removeIndicator() {
        indicatorView?.view.removeFromSuperview()
        indicatorView = nil
    }
    
    func showAlert(title: String, message: String, actions: [UIAlertAction], completion: (() -> Void)? = nil)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach{alertController.addAction($0)}
        self.present(alertController, animated: true, completion: completion)
    }
}


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
    
    func reqFailed (error: Error) {
        var alertText = ""
        var actions = [UIAlertAction()]
        var title = ""
        switch error {
        case RequestErrorType.noInternet:
        //TODO: ask To retry
            alertText = "Please check your internet and try again"
            actions = [UIAlertAction(title: "Retry", style: .default, handler: { [weak self](action) in
                self?.reqAgain()
            }), UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })
            ]
            title = "No Internet"
        case RequestErrorType.badRequest:
            alertText = "There is something wrong in our side sorry"
            actions = [UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })]
            title = "Bad Request"
        case RequestErrorType.serverError:
            alertText = "Sever is not working right now :("
            actions = [UIAlertAction(title: "Retry", style: .default, handler: { [weak self](action) in
                self?.reqAgain()
            }), UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })
            ]
            title = "Server Error"
        case RequestErrorType.serializationError:
            alertText = "Something's changed on the server!"
            actions = [UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })]
            title = "Ooops!"
        default:
            title = "Ooops!"
            alertText = error.localizedDescription
            actions = [UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            })]
        }
        self.showAlert(title: title, message: alertText, actions: actions)

    }
    
    func reqAgain() {
        
    }
    
    func removeNavigation() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
}


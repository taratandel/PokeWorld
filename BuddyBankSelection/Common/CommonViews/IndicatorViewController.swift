//
//  IndicatorViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class IndicatorViewController: UIViewController {
    weak var indicatorLabel: UILabel!
    weak var indicator: UIActivityIndicatorView!
    
    private var indicatorLabelText: String?
    private var indicatorColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        indicatorLabel.text = indicatorLabelText
        indicator.color = indicatorColor
        // Do any additional setup after loading the view.
    }
    
    init(indicatorMessage: String, indicatorColor: UIColor) {
        self.indicatorLabelText = indicatorMessage
        self.indicatorColor = indicatorColor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    deinit {
        self.indicatorLabelText = nil
    }
    
    func setUPLayout(){
        // MARK: - Indicator Constainrs
        indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // MARK: - Label Constraints
        
        indicatorLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor).isActive = true
        indicatorLabel.centerYAnchor.constraint(equalTo: indicatorLabel.centerYAnchor).isActive = true
        
        
    }
}

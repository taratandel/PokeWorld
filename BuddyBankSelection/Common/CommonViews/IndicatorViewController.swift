//
//  IndicatorViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class IndicatorViewController: UIViewController {
    lazy var indicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = indicatorColor
        label.text = indicatorLabelText
        label.font = UIFont.defaultFont
        label.textAlignment = .center
        label.frame = CGRect(x: UIScreen.main.bounds.width - 16, y: UIScreen.main.bounds.height + 50, width: 50, height: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var indicator: UIActivityIndicatorView = {
        let indicView = UIActivityIndicatorView(style: .medium)
        indicView.color = indicatorColor
        indicView.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        indicView.translatesAutoresizingMaskIntoConstraints = false
        return indicView
        
    }()
    
    private var indicatorLabelText: String?
    private var indicatorColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        setupConstraints()
        
        self.view.backgroundColor = .white
        self.view.alpha = 0.7
        self.view.addSubview(indicator)
        self.view.addSubview(indicatorLabel)
        
        setUPLayout()
        
        indicator.startAnimating()
                
        self.view.superview?.bringSubviewToFront(self.view)
        

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
    func setupConstraints() {
        self.view.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        self.view.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.view.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor).isActive = true
 
    }

    func setUPLayout(){
        // MARK: - Indicator Constainrs
        indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // MARK: - Label Constraints
        
        indicatorLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor).isActive = true
        indicatorLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 8).isActive = true
        indicatorLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
        indicatorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}

//
//  PkemonListTableViewCell.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 27/10/2020.
//

import UIKit
import Foundation
class PkemonListTableViewCell: UITableViewCell {
    // MARK: - Views (computed properties)
    var pokemonName: String? {
        didSet {
            nameLabel.text = pokemonName
            stopActivityIndicator()
            customizeTheView()
            setNeedsLayout()
        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.defaultFont
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    
    var shadowView: ShadowView = {
        let view = ShadowView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    // MARK: inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUPlayout()
        showActivityIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func showActivityIndicator() {
        activityIndicator.center = contentView.center
        
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.startAnimating()
        contentView.addSubview(activityIndicator)
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    func setUPlayout() {
        // adding subview
        self.containerView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.containerView)
        self.contentView.addSubview(self.shadowView)
        
        // sending the shadow to the back
        self.contentView.sendSubviewToBack(shadowView)
        
        // specifying the constraints for containerView
        self.containerView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 4).isActive = true
        self.containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-11).isActive = true
        self.containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 11).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
        
        // specifying the constraints for shadowView

        self.shadowView.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 4).isActive = true
        self.shadowView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        self.shadowView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        self.shadowView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true

        // specifying the constraints for nameLabel
        self.nameLabel.centerXAnchor.constraint(equalTo:self.containerView.centerXAnchor).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo:self.centerYAnchor).isActive = true
        

    }
    
    func customizeTheView(){
        
        // MARK: - corner radius
        
        self.containerView.layer.cornerRadius = 5.0
        self.containerView.layer.borderWidth = 1.0
        self.containerView.layer.borderColor = UIColor.clear.cgColor
        self.containerView.layer.masksToBounds = true
        
        // MARK: - Shadow
        shadowView.bounds = containerView.bounds
        
        // MARK: - BackGround
        self.containerView.backgroundColor = .random()

    }
}

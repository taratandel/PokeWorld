//
//  PkemonListTableViewCell.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 27/10/2020.
//

import UIKit

class PkemonListTableViewCell: UITableViewCell {
    
    var pokemonName: String? {
        didSet {
            nameLabel.text = pokemonName
            setNeedsLayout()
        }
    }
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        self.containerView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.containerView)
        self.containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        self.containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        self.containerView.heightAnchor.constraint(equalToConstant:50).isActive = true
        
        self.nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        self.nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        self.nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        self.nameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func showActivityIndicator() {
        activityIndicator.center = containerView.center
        
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.startAnimating()
        containerView.addSubview(activityIndicator)
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
}

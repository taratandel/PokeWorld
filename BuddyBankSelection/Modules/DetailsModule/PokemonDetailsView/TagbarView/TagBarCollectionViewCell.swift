//
//  TagBarCollectionViewCell.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

protocol TagCollectionViewCellProtocol: class {
    func buttonClicked(at index: Int, shouldSelect: Bool)
}
class TagCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    var details: String = ""
    var index: Int = -1
    
    var borderColor: UIColor? = .red
    var cellBackgroundColor: UIColor? = .white
    var textColor: UIColor? = .red
    
    private var isSelectedBefore: Bool = false
    
    // MARK: - outlets
    var tagDetailLabel: UILabel = UILabel()
    var cellBackgroundView: UIView = UIView()
    
    // MARK: - Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    func setupLayOut() {
        // MARK: - constraint cellBackGroundView
        self.contentView.addSubview(cellBackgroundView)
        self.contentView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor).isActive = true
        self.cellBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.cellBackgroundView.bottomAnchor).isActive = true
        self.cellBackgroundView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        
        // MARK: - Constraint tagDetailLabel
        cellBackgroundView.addSubview(tagDetailLabel)
        self.cellBackgroundView.trailingAnchor.constraint(equalTo: self.tagDetailLabel.leadingAnchor, constant: 4).isActive = true
        self.tagDetailLabel.centerYAnchor.constraint(equalTo: cellBackgroundView.centerYAnchor).isActive = true
        self.tagDetailLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 4).isActive = true
    }

    func setup(details: String, index: Int) {
        self.details = details
        self.index = index
        setupUI()
    }
    
    func setup( with borderColor: UIColor, cellBackgroundColor: UIColor, textColor: UIColor, delegate: TagCollectionViewCellProtocol, details: String, index: Int) {
        self.borderColor = borderColor
        self.cellBackgroundColor = cellBackgroundColor
        self.textColor = textColor
        
        self.setup(details: details, index: index)
    }
    
    private func setupUI() {
        self.backgroundColor = backgroundColor
        self.layer.borderColor = borderColor?.cgColor
        self.layer.borderWidth = 1
        self.tagDetailLabel.text = details
        self.tagDetailLabel.font = UIFont.defaultFont
        self.tagDetailLabel.textColor = textColor
        self.tagDetailLabel.backgroundColor = UIColor.clear
        self.cellBackgroundView.backgroundColor = isSelectedBefore ? .red : .white
        self.tagDetailLabel.textColor = isSelectedBefore ? .white : .red

    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let newlayoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        let att = layoutAttributes
        
        att.frame.size.width = newlayoutAttributes.frame.width
        return att
    }
}

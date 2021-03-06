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
    var cellBackgroundColor: UIColor? = .clear
    var textColor: UIColor? = .white
    
    private var isSelectedBefore: Bool = false
    
    // MARK: - outlets
    var tagDetailLabel: UILabel = {
        let l =  UILabel()
        l.frame = CGRect(x: 4, y: 6, width: 52, height: 22)
        l.backgroundColor = .clear
        return l
    }()
    
    var cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    // MARK: - Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    func setupLayOut() {
        self.contentView.clipsToBounds = true
        self.contentView.contentMode = .center
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        // MARK: - constraint cellBackGroundView
        self.contentView.addSubview(cellBackgroundView)
        
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        self.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor).isActive = true
        self.cellBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.cellBackgroundView.bottomAnchor).isActive = true
        self.cellBackgroundView.topAnchor.constraint(equalTo: self.topAnchor ).isActive = true
        self.cellBackgroundView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        // MARK: - Constraint tagDetailLabel
        cellBackgroundView.addSubview(tagDetailLabel)
        
        tagDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cellBackgroundView.trailingAnchor.constraint(equalTo: self.tagDetailLabel.trailingAnchor, constant: 4).isActive = true
        self.tagDetailLabel.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor).isActive = true
        self.tagDetailLabel.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -4).isActive = true
        self.tagDetailLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 4).isActive = true
        self.tagDetailLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for:.horizontal)

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
        let color = UIColor.darkRandom()
        self.backgroundColor = color
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.tagDetailLabel.text = details
        self.tagDetailLabel.font = UIFont.defaultFont
        self.tagDetailLabel.textColor = textColor
        self.tagDetailLabel.textAlignment = .center
        self.tagDetailLabel.clipsToBounds = false
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

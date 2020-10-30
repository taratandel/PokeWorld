//
//  TagBarViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class TopBarViewController: UIViewController {
    // MARK: - IBOutlets
    weak var topBarCollectionView: UICollectionView!
    
    // MARK: - Properties
    var scopes: [String]?
    private let sectionInsets = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
    private var selectedIndexPath: IndexPath? = nil
        
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupUI()
    }
    
    func setupConstraints() {
        self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: topBarCollectionView.trailingAnchor, constant: 8).isActive = true
        
        self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: topBarCollectionView.bottomAnchor, constant: 8).isActive = true
        topBarCollectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        topBarCollectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        topBarCollectionView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func setupUI() {
        let nib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        topBarCollectionView.register(nib, forCellWithReuseIdentifier: "TagCell")
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        topBarCollectionView.collectionViewLayout = collectionViewFlowLayout
        topBarCollectionView.contentInsetAdjustmentBehavior = .always
        topBarCollectionView.collectionViewLayout.invalidateLayout()
        self.topBarCollectionView.delegate = self
        self.topBarCollectionView.dataSource = self
        
    }
}

// MARK: - UICollectionViewDelegate
extension TopBarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = selectedIndexPath != nil ? nil : indexPath

        guard let cell = topBarCollectionView.cellForItem(at: indexPath) as? TagCollectionViewCell else { return }
        cell.tapped(shouldSelect: selectedIndexPath != nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = topBarCollectionView.cellForItem(at: indexPath) as? TagCollectionViewCell else { return }
        cell.tapped(shouldSelect: false, with: selectedIndexPath?.row )
        selectedIndexPath = nil
    }
}
// MARK: - UICollectionViewDataSource
extension TopBarViewController: UICollectionViewDataSource {
        func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scopes?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let scopes = self.scopes else {
            return UICollectionViewCell()
        }
        let cell = topBarCollectionView.dequeueReusableCell(withReuseIdentifier: "TagCell", for: indexPath) as! TagCollectionViewCell
        cell.setup(delegate: self, details: scopes[indexPath.row], index: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TopBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 28.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

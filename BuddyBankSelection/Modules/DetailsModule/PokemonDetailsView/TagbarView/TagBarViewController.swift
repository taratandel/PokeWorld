//
//  TagBarViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class TopBarViewController: UIViewController {
    // MARK: - IBOutlets
    var topBarCollectionView: UICollectionView!
    
    // MARK: - Properties
    var scopes: [String]?
    private let sectionInsets = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
        
    // MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()

    }
    
    
    override init(nibName: String?, bundle: Bundle?){
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
    }

    
    func setupConstraints() {

        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(topBarCollectionView)
   
      // MARK: - Constraint Collection view
        self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: topBarCollectionView.trailingAnchor, constant: 8).isActive = true

        self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: topBarCollectionView.bottomAnchor, constant: 8).isActive = true
        
        self.view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: topBarCollectionView.leadingAnchor, constant: -8).isActive = true
        self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: topBarCollectionView.topAnchor, constant: -8).isActive = true

        topBarCollectionView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        topBarCollectionView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 16).isActive = true

    }
    
    func setupUI() {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collectionViewFlowLayout.scrollDirection = .horizontal
        topBarCollectionView = UICollectionView(frame: CGRect(x: 8, y: 8, width: 604, height: 32), collectionViewLayout: collectionViewFlowLayout)
        topBarCollectionView.clipsToBounds = true
        topBarCollectionView.contentMode = .scaleToFill
        topBarCollectionView.showsVerticalScrollIndicator = false
        topBarCollectionView.showsHorizontalScrollIndicator = false
        
        topBarCollectionView.clearsContextBeforeDrawing = false
        topBarCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: "TagCell")
        topBarCollectionView.collectionViewLayout = collectionViewFlowLayout
        topBarCollectionView.contentInsetAdjustmentBehavior = .always
        topBarCollectionView.collectionViewLayout.invalidateLayout()
        self.topBarCollectionView.delegate = self
        self.topBarCollectionView.dataSource = self
        topBarCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        topBarCollectionView.backgroundColor = .white
        
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
        cell.setup(details: scopes[indexPath.row], index: indexPath.row)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension TopBarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let scopes = self.scopes else {
            return CGSize(width: 200, height: 22.0)
        }
        let item = scopes[indexPath.row]
        let itemSize = item.size(withAttributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)
        ])
        return CGSize(width: itemSize.width + 14, height: 22.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

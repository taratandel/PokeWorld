//
//  PokemonDetailsViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class PokemonDetailsViewController: UIViewController {
    var scrollView = UIScrollView()
    var stackView = UIStackView()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size.height = 50
        return imageView
    }()
    
    lazy var tagBarView: TopBarViewController = {
        let view = TopBarViewController()
        view.view.frame.size.height = 48
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        
        // MARK: - constraint scrollView
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        
        // MARK: - constraint stackView
        stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor).isActive = true
        
        // MARK: - Scrollable stackView
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        setupStackView()
        // setup the tagbar view
        // setup the stats with their power
    }
    
    func setupStackView() {
        stackView.insertSubview(pokemonImage, at: 0)
        stackView.insertSubview(tagBarView.view, at: 1)
    }


}

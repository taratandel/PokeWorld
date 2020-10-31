//
//  PokemonDetailsViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class PokemonDetailsViewController: BaseViewController {
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame.size.height = 50
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    lazy var tagBarView: TopBarViewController = {
        let view = TopBarViewController()
        view.view.backgroundColor = .blue
        view.view.frame.size.height = 48
        return view
    }()
    
    lazy var barChartView: BeautifulBarChart = {
        let view = BeautifulBarChart()
        view.frame.size.height = 100
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        self.view.addSubview(stackView)
        
        // MARK: - constraint scrollView

//        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        
        
        // MARK: - constraint stackView
//        scrollView.addSubview(stview.safeAreaLayoutGuideackView)

        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
//        stackView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor).isActive = true
        
        
        // MARK: - Scrollable stackView
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.clipsToBounds = false
        
        setupStackView()
        // setup the tagbar view
        // setup the stats with their power
    }
    
    func setupStackView() {
        stackView.insertSubview(pokemonImage, at: 0)
//        stackView.insertSubview(tagBarView.view, at: 1)
        stackView.insertSubview(barChartView, at: 2)
    }


}

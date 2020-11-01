//
//  PokemonDetailsViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class PokemonDetailsViewController: BaseViewController, DetailsPresenterDelegate {
    //
//    let scrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
    var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size.height = 150
        imageView.frame.size.width = stackView.frame.size.width 
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
    
    var presenter: DetailsViewDelegate?
    override func reqAgain() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PokemonDetailsPresenter(view: self)
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad(url: "https://pokeapi.co/api/v2/pokemon/38/")
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
        
//        setupStackView()
        // setup the tagbar view
        // setup the stats with their power
    }
    func reloadPage() {
        createStackView()
    }
    
    func createStackView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
//            self.stackView.insertSubview(self.pokemonImage, at:0)
            guard let imageURL = self.presenter?.getImageURL() else {
            return //TODO: do smth for the erro
        }
            self.pokemonImage.load(url: imageURL){isFinished in
                if isFinished {
                    self.stackView.insertSubview(self.pokemonImage, at:0)
                }
            }
        }
    }
    
//    func setupStackView() {
//        stackView.insertSubview(pokemonImage, at: 0)
////        stackView.insertSubview(tagBarView.view, at: 1)
//        stackView.insertSubview(barChartView, at: 2)
//    }


}

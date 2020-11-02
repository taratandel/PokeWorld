//
//  PokemonDetailsViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class PokemonDetailsViewController: BaseViewController, DetailsPresenterDelegate {
    var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 + 48)

        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 + 48).isActive = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    lazy var tagBarView: TopBarViewController = {
        let view = TopBarViewController(nibName: nil, bundle: nil)
        view.view.translatesAutoresizingMaskIntoConstraints = false
        view.view.backgroundColor = .clear
        view.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 48)
        view.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        view.view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        view.view.clipsToBounds = true
        return view
    }()
    
    lazy var barChartView: BeautifulBarChart = {
        let view = BeautifulBarChart()
        view.frame.size.height = UIScreen.main.bounds.height / 2 - 96
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 - 96).isActive = true
        guard let data = presenter?.generateDataForBarChar() else {return view}
        view.updateDataEntries(dataEntries: data, animated: true)
        return view
    }()
    
    var presenter: DetailsViewDelegate?
    override func reqAgain() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        presenter = PokemonDetailsPresenter(view: self)
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.viewDidLoad(url: "https://pokeapi.co/api/v2/pokemon/38/")
    }
    
    private func setupView() {
        self.view.addSubview(stackView)
                
        
        // MARK: - constraint stackView
        
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.clipsToBounds = false
        
        
    }
    func reloadPage() {
        createStackView()
    }
    
    func createStackView() {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.presenter?.shouldLoadTagList(tagList: &self.tagBarView)


            
            // MARK: - Loading image
            guard let imageURL = self.presenter?.getImageURL() else {
                return //TODO: do smth for the erro
            }
            self.pokemonImage.load(url: imageURL){isFinished in
                if isFinished {
                    self.stackView.insertArrangedSubview(self.pokemonImage, at: 0)
                    self.stackView.insertArrangedSubview(self.tagBarView.view, at: 1)
                    self.stackView.insertArrangedSubview(self.barChartView, at: 2)

                } else {
                    self.stackView.insertArrangedSubview(self.tagBarView.view, at: 0)
                    self.stackView.insertArrangedSubview(self.barChartView, at: 1)
                }
            }
            self.stackView.layoutIfNeeded()
        }
    }
    
}

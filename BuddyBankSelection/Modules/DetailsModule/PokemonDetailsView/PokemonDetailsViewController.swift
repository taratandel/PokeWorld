//
//  PokemonDetailsViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 30/10/2020.
//

import UIKit

class PokemonDetailsViewController: BaseViewController, DetailsPresenterDelegate {
    // MARK: - subViews (computed properties)
    var stackView: UIStackView = {
        let view = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    // for adding the image
    lazy var pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2 + 48)

        imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 + 48).isActive = true
        
        imageView.backgroundColor = .clear
        
        return imageView
    }()
    // for showing the types
    lazy var tagBarVC: TagBarViewController = {
        let vc = TagBarViewController(nibName: nil, bundle: nil)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        vc.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 48)
        
        vc.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        vc.view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        vc.view.clipsToBounds = true
        vc.view.backgroundColor = .clear

        return vc
    }()
    // for showing the stats
    lazy var barChartView: BeautifulBarChart = {
        let view = BeautifulBarChart()
        
        view.frame.size.height = UIScreen.main.bounds.height / 2 - 96
        
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 - 96).isActive = true
        
        guard let data = detailsViewDelegate?.generateDataForBarChar() else {return view}
        view.updateDataEntries(dataEntries: data, animated: true)
        
        return view
    }()
    
    var detailsViewDelegate: DetailsViewDelegate?
    
    override func reqAgain() {
        detailsViewDelegate?.reqAgain()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        detailsViewDelegate?.viewDidLoad()
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
            self.detailsViewDelegate?.shouldLoadTagList(tagList: &self.tagBarVC)


            
            // MARK: - Loading image
            guard let imageURL = self.detailsViewDelegate?.getImageURL() else {
                return //TODO: do smth for the erro
            }
            self.pokemonImageView.load(url: imageURL){isFinished in
                if isFinished {
                    self.stackView.insertArrangedSubview(self.pokemonImageView, at: 0)
                    self.stackView.insertArrangedSubview(self.tagBarVC.view, at: 1)
                    self.stackView.insertArrangedSubview(self.barChartView, at: 2)

                } else {
                    self.stackView.insertArrangedSubview(self.tagBarVC.view, at: 0)
                    self.stackView.insertArrangedSubview(self.barChartView, at: 1)
                }
            }
            self.stackView.layoutIfNeeded()
        }
    }
    
}

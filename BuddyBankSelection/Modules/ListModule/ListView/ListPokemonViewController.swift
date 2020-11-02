//
//  ListPokemonViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 25/10/2020.
//

import UIKit

class ListPokemonViewController: BaseViewController {
    //view
    let pokemonTableView = UITableView()
    
    //delegate
    var listViewDelegate: ListViewDelegate?
    
    // alert functiom
    override func reqAgain() {
        listViewDelegate?.reqAgain()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        listViewDelegate?.viewDidLoad()
    }
    
    // MARK: - setup
    func setupViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(pokemonTableView)
        
        pokemonTableView.translatesAutoresizingMaskIntoConstraints = false
        // constraints
        pokemonTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        pokemonTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        pokemonTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        pokemonTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        // delegates for tableview
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        
        
        
        pokemonTableView.register(PkemonListTableViewCell.self, forCellReuseIdentifier: "pokemonListCell")
        
        navigationItem.title = "Pokemon List"
    }
}

// MARK: - TableView
extension ListPokemonViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewDelegate?.getNumberOfElements(in: section) ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonListCell", for: indexPath) as! PkemonListTableViewCell
        
        cell.pokemonName = listViewDelegate?.getElementForIndexPath(index: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listViewDelegate?.prepareToPresent(indexPath: indexPath)
    }
}

// MARK: - Presenter Delegate
extension ListPokemonViewController: ListPresenterDelegate {
    func reloadPage() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
            self.pokemonTableView.reloadData()
        }
    }
}

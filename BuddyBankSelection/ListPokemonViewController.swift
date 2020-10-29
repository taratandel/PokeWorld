//
//  ListPokemonViewController.swift
//  BuddyBankSelection
//
//  Created by Tara Tandel on 25/10/2020.
//

import UIKit

class ListPokemonViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let pokemonTableView = UITableView() // view
    var listViewDelegate: ListViewDelegate?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(pokemonTableView)
        
        pokemonTableView.translatesAutoresizingMaskIntoConstraints = false
        
        pokemonTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        pokemonTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        pokemonTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        pokemonTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
        
        
        
        pokemonTableView.register(PkemonListTableViewCell.self, forCellReuseIdentifier: "pokemonListCell")
        
        
        
        
        navigationItem.title = "Pokemon List"
        listViewDelegate = PokemonListPresenter(view: self)
        listViewDelegate?.viewDidLoad()
    }
    
    
    
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
    
}

extension ListPokemonViewController: ListPresenterDelegate {
    
    func showAlert(title: String, message: String, actions: [UIAlertAction]) {
        
    }
    
    func reloadPage() {
        DispatchQueue.main.async {            
            self.pokemonTableView.reloadData()
        }
    }
}

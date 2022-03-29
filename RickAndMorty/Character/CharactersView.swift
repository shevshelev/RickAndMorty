//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import UIKit

class CharactersView: UITableViewController {
    
    private var charactersViewModel: CharactersViewModelProtocol! {
        didSet {
            charactersViewModel.fetchCharacter { [unowned self] in
                self.tableView.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CharacterCellView.self, forCellReuseIdentifier: "Cell")
        charactersViewModel = CharactersViewModel()
//        tableView.rowHeight = 100
//        tableView.allowsSelection = false
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        charactersViewModel.numberOfRows()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CharacterCellView else { return UITableViewCell() }
        cell.characterCellViewModel = charactersViewModel.characterCellViewModel(at: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = CharacterDetailView()
        detailVC.characterDetailViewModel = charactersViewModel.characterCellViewModel(at: indexPath)
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}



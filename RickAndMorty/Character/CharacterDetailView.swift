//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 12.03.2022.
//

import UIKit

class CharacterDetailView: UITableViewController {
    
    var characterDetailViewModel: CharacterDetailViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavBar()
    }
    
    private func setupTableView() {
        tableView.register(CharacterImageCell.self, forCellReuseIdentifier: "ImageCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TitleCell")
        tableView.register(CharacterStatusCellView.self, forCellReuseIdentifier: "StatusCell")
        tableView.register(CharacterEpisodeCellView.self, forCellReuseIdentifier: "EpisodeCell")
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    private func setupNavBar() {
        navigationItem.title = characterDetailViewModel.name
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 2:
            return 1
        case 1:
            return 4
        default:
            return characterDetailViewModel.episodes.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? CharacterImageCell else { return UITableViewCell() }
            cell.characterDetailViewModel = characterDetailViewModel
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCell", for: indexPath) as? CharacterStatusCellView else { return UITableViewCell() }
            cell.characterStatusCellViewModel = CharacterStatusCellViewModel(characterDetail: characterDetailViewModel, indexPath: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.textProperties.font = .boldSystemFont(ofSize: 30)
            content.text = "Episodes:"
            cell.contentConfiguration = content
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? CharacterEpisodeCellView else { return UITableViewCell() }
            cell.characterEpisodeCellViewModel = characterDetailViewModel.characterEpisodeCellView(indexPath: indexPath)
            return cell
        }
    }
}

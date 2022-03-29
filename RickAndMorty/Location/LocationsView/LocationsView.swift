//
//  LocationsView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import UIKit

protocol LocationsViewInputProtocol: AnyObject {
    func reloadData(for section: LocationSectionViewModelProtocol)
}
protocol LocationsViewOutputProtocol {
    init(view: LocationsViewInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPAth: IndexPath)
}

class LocationsView: UITableViewController {
    
    var presenter: LocationsViewOutputProtocol!
    
    private var sectionViewModel: LocationSectionViewModelProtocol = LocationSectionViewModel()
    private let configurator: LocationsConfiguratior = LocationsConfiguratior()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(LocationCellView.self, forCellReuseIdentifier: "Cell")
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.title = "Locations"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

// MARK: - UITableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? LocationCellView else { return UITableViewCell()}
        cell.viewModel = cellViewModel
        return cell
    }
    
// MARK: - UITAbleViewDeligate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
}





// MARK: - LocationsViewInputProtocol

extension LocationsView: LocationsViewInputProtocol {
    func reloadData(for section: LocationSectionViewModelProtocol) {
        sectionViewModel = section
        tableView.reloadData()
    }
}

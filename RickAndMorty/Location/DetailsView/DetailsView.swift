//
//  DetailsView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import UIKit

protocol DetailsViewInputProtocol: AnyObject {
    var title: String? { get set }
    func reloadData(for section: DetailsSectionModelProtocol)
}
protocol DetailsViewOutputProtocol {
    init(view: DetailsViewInputProtocol)
    func viewDidLoad()
}


class DetailsView: UITableViewController {
    
    var presenter: DetailsPresenter!
    
    private let configurator: DetailsConfiguratorInputProtocol = DetailsConfigurator()
    private var sectionViewModel: DetailsSectionModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DetailsCellView.self, forCellReuseIdentifier: "Cell")
        tableView.allowsSelection = false
        presenter.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionViewModel?.rows.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailsCellView else { return UITableViewCell() }
        cell.viewModel = sectionViewModel?.rows[indexPath.row]
        return cell
    }
}

extension DetailsView: DetailsViewInputProtocol {
    func reloadData(for section: DetailsSectionModelProtocol) {
        sectionViewModel = section
        navigationItem.title = title
        tableView.reloadData()
    }
}

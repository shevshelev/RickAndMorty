//
//  DetailsPresenter.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

struct DetailsData {
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}


class DetailsPresenter: DetailsViewOutputProtocol {
    
    private unowned let viewController: DetailsViewInputProtocol
    var dataStore: DetailsData?
    
    var interactor: DetailsInteractorInputProtocol!
    
    required init(view: DetailsViewInputProtocol) {
        viewController = view
    }
    
    func viewDidLoad() {
        interactor.setupDataSource()
    }
    
    
}

extension DetailsPresenter: DetailsInteractorOutputProtocol {
    func dataSourceSetuped(with dataSourse: DetailsData) {
//        self.dataStore = dataSourse
        let section = DetailsSectionModel(data: dataSourse)
        viewController.title = dataSourse.name
        viewController.reloadData(for: section)
    }
}

//
//  DetailsInteractor.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

protocol  DetailsInteractorInputProtocol {
    init(presenter:  DetailsInteractorOutputProtocol, locations: Location)
    func setupDataSource()
}

protocol DetailsInteractorOutputProtocol: AnyObject {
    func dataSourceSetuped(with dataSourse: DetailsData)
}

class DetailsInteractor: DetailsInteractorInputProtocol {
    
    unowned let presenter: DetailsInteractorOutputProtocol
    
    private let locations: Location
    
    required init(presenter: DetailsInteractorOutputProtocol, locations: Location) {
        self.presenter = presenter
        self.locations = locations
    }
    
    func setupDataSource() {
        guard let type = locations.type else { return }
        guard let dimension = locations.dimension else { return }
        guard let residents = locations.residents else { return }
        
        let dataSource = DetailsData(
            name: locations.name,
            type: type,
            dimension: dimension,
            residents: residents
        )
        presenter.dataSourceSetuped(with: dataSource)
    }
}

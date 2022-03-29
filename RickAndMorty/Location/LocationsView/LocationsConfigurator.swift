//
//  LocationsConfigurator.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

protocol LocationsConfiguratorInputProtocol {
    func configure(with viewController: LocationsView)
}

class LocationsConfiguratior: LocationsConfiguratorInputProtocol {
    func configure(with viewController: LocationsView) {
        let presenter = LocationsPresenter(view: viewController)
        let interactor = LocationsInteractor(presenter: presenter)
        let router = LocationsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}

//
//  LocationsRouter.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

protocol LocationsRouterInputProtocol {
    init(viewController: LocationsView)
}

class LocationsRouter: LocationsRouterInputProtocol {
    
    unowned let viewController: LocationsView
    
    required init(viewController: LocationsView) {
        self.viewController = viewController
    }
    
    func openDetailViewController(with location: Location) {
        let detailVC = DetailsView()
        let detailConfigurator = DetailsConfigurator()
        detailConfigurator.configure(with: detailVC, and: location)
        viewController.navigationController?.pushViewController(detailVC, animated: true)
    }
}


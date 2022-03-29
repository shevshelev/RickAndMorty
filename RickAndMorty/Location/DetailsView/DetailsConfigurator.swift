//
//  DetailsConfigurator.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

protocol DetailsConfiguratorInputProtocol {
    func configure(with viewController: DetailsView, and location: Location)
}

class DetailsConfigurator: DetailsConfiguratorInputProtocol {

    func configure(with viewController: DetailsView, and location: Location) {
        let presenter = DetailsPresenter(view: viewController)
        let interactor = DetailsInteractor(presenter: presenter, locations: location)
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
}

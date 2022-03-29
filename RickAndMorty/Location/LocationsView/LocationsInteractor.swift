//
//  LocationsInteractor.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

protocol LocationsInteractorInputProtocol {
    init(presenter: LocationsInteractorOutputProtocol)
    func fetchLocations()
}

protocol LocationsInteractorOutputProtocol: AnyObject {
    func locationsDidReceive(with dataStore: LocationsDataStore)
}

class LocationsInteractor: LocationsInteractorInputProtocol {
    unowned let presenter: LocationsInteractorOutputProtocol
    
    required init(presenter: LocationsInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchLocations() {
        NetworkManager.shared.fetchCharacters(from: "https://rickandmortyapi.com/api/location", type: LocationAnswer.self) { answer in
            let dataStore = LocationsDataStore(locations: answer.results)
            self.presenter.locationsDidReceive(with: dataStore)
        }
    }
    
}

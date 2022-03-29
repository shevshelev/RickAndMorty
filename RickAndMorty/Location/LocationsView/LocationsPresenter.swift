//
//  LocationsPresenter.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

struct LocationsDataStore {
    let locations: [Location]
}

class LocationsPresenter: LocationsViewOutputProtocol {
    
    unowned let view: LocationsViewInputProtocol
    
    var interactor: LocationsInteractorInputProtocol!
    var router: LocationsRouter!

    
    private var dataStore: LocationsDataStore?
    
    required init(view: LocationsViewInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchLocations()
    }
    
    func didTapCell(at indexPath: IndexPath) {
        guard let location = dataStore?.locations[indexPath.row] else { return }
        router.openDetailViewController(with: location)
    }
}

extension LocationsPresenter: LocationsInteractorOutputProtocol {
    func locationsDidReceive(with dataStore: LocationsDataStore) {
        self.dataStore = dataStore
        let section = LocationSectionViewModel()
        dataStore.locations.forEach { section.rows.append(LocationCellViewModel(location: $0))}
        view.reloadData(for: section)
    }
    
    
}

//
//  LocationCellViewModel.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import Foundation

protocol LocationCellViewModelProtocol {
    var cellIdentifier: String { get }
    var cellHeight: Double { get }
    var locationName: String { get }
    var locationType: String { get }
    var locationDimension: String { get }
    init(location: Location)
}

protocol LocationSectionViewModelProtocol {
    var rows: [LocationCellViewModelProtocol] { get }
}

class LocationCellViewModel: LocationCellViewModelProtocol {
    
    
    var cellIdentifier: String {
        "Cell"
    }
    
    var cellHeight: Double {
        70
    }
    
    var locationName: String {
        location.name
    }
    var locationDimension: String {
        guard let dimension = location.dimension else { return ""}
        return "Dimension: \(dimension)"
    }
    
    var locationType: String {
        guard let type = location.type else { return ""}
        return "Type: \(type)"
    }
    
    private let location: Location
    
    required init(location: Location) {
        self.location = location
    }
}


class LocationSectionViewModel: LocationSectionViewModelProtocol {
    var rows: [LocationCellViewModelProtocol] = []
}

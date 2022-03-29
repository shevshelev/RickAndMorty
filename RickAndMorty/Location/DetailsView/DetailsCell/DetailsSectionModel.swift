//
//  DetailsSectionModel.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 28.03.2022.
//

import Foundation

protocol DetailsSectionModelProtocol {
    var rows: [DetailsCellViewModelProtocol] { get }
}

class DetailsSectionModel: DetailsSectionModelProtocol {
    var rows: [DetailsCellViewModelProtocol]
    
    init(data: DetailsData) {
        
        rows = [DetailsCellViewModelProtocol]()
        
        let detailsTypeCellModel = DetailsCellViewModel(title: data.type, info: data.type)
        let detailsDimensionCellModel = DetailsCellViewModel(title: "Dimension:", info: data.dimension)
        let detailsResidentsTitleCellModel = DetailsCellViewModel(info: "Residents:")
        
        rows.append(contentsOf: [
            detailsTypeCellModel,
            detailsDimensionCellModel,
            detailsResidentsTitleCellModel
        ])
        
        for resident in data.residents {
            let detailsResidentCellModel = DetailsCellViewModel(info: resident)
            rows.append(detailsResidentCellModel)
        }
        
    }
}


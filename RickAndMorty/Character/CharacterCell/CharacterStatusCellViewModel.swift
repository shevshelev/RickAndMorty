//
//  CharacterStatusCellViewModel.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 12.03.2022.
//

import Foundation

protocol CharacterStatusCellViewModelProtocol {
    var title: String { get }
    var value: String { get }
    init(characterDetail: CharacterDetailViewModelProtocol, indexPath: IndexPath)
}

class CharacterStatusCellViewModel: CharacterStatusCellViewModelProtocol {
    
    var title: String {
        switch rowNumber {
        case 0:
            return "Live status:"
        case 1:
            return "Species and gender:"
        case 2:
            return "Last know location:"
        default:
            return "First seen in"
        }
    }
    
    var value: String {
        switch rowNumber {
        case 0:
            return characterDetail.status
        case 1:
            return characterDetail.speciesAndGender
        case 2:
            return characterDetail.location
        default:
            return characterDetail.firstEpisode
        }
    }
    
    private let rowNumber: Int
    private let characterDetail: CharacterDetailViewModelProtocol
    
    required init(characterDetail: CharacterDetailViewModelProtocol, indexPath: IndexPath) {
        self.characterDetail = characterDetail
        rowNumber = indexPath.row
    }
    
    
}

//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import Foundation

protocol CharactersViewModelProtocol {
    func fetchCharacter(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func characterCellViewModel(at indexPath: IndexPath) -> CharacterDetailViewModelProtocol
}

class CharactersViewModel: CharactersViewModelProtocol {

    private var characters: [MultiCharacter] = []
    
    func fetchCharacter(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchCharacters(from: "https://rickandmortyapi.com/api/character", type: CharacterAnswer.self) { answer in
            self.characters = answer.results
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        characters.count
    }
    
    func characterCellViewModel(at indexPath: IndexPath) -> CharacterDetailViewModelProtocol {
        CharacterDetailViewModel(character: characters[indexPath.row])
    }
    
}

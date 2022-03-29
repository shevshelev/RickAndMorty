//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import Foundation

protocol CharacterDetailViewModelProtocol: AnyObject {
    var name: String { get }
    var status: String { get }
    var speciesAndGender: String { get }
    var location: String { get }
    var imageData: Data? { get }
    var firstEpisode: String { get }
    var episodes: [String] { get }
    var isFavorite: Box<Bool> { get }
    init(character: MultiCharacter)
    func favoritButtonPressed()
    func characterEpisodeCellView(indexPath: IndexPath) -> CharacterEpisodeCellViewModelProtocol?
}

class CharacterDetailViewModel: CharacterDetailViewModelProtocol {
    
    var name: String {
        character.name
    }
    
    var status: String {
        character.status
    }
    
    var speciesAndGender: String {
        "\(character.species), \(character.gender)"
    }
    
    var location: String {
        character.location.name
    }
    
    var imageData: Data? {
        NetworkManager.shared.fetchImageData(from: character.image)
    }
    
    var firstEpisode: String {
        var name = ""
        do {
            let episode = try NetworkManager.shared.fetchEpisode(from: character.episode[0], type: Episode.self)
            name = episode.name
        } catch {
            print(error)
        }
        return name
    }
    
    var episodes: [String] {
        character.episode
    }
    
    var isFavorite: Box<Bool>
    
    private var character: MultiCharacter
    
    required init(character: MultiCharacter) {
        self.character = character
        isFavorite = Box(DataManager.shared.getFavoriteStatus(for: character.name))
    }
    
    func characterEpisodeCellView(indexPath: IndexPath) -> CharacterEpisodeCellViewModelProtocol? {
        guard let episode = try? NetworkManager.shared.fetchEpisode(from: episodes[indexPath.row], type: Episode.self) else { return nil }
        return CharacterEpisodeCellViewModel(episode: episode)
    }

    @objc func favoritButtonPressed() {
        isFavorite.value.toggle()
        DataManager.shared.setFavoriteStatus(for: name, with: isFavorite.value)
    }
    
}

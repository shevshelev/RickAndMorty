//
//  DataManager.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoriteStatus(for characterName: String, with status: Bool) {
        userDefaults.set(status, forKey: characterName)
    }
    
    func getFavoriteStatus(for characterName: String) -> Bool {
        userDefaults.bool(forKey: characterName)
    }
}

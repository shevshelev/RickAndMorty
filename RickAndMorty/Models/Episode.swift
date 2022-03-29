//
//  Episode.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 12.03.2022.
//

import Foundation

class Episode: Decodable {
    let id: Int
    let name: String
    let airDate: String?
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

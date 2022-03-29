//
//  Location.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import Foundation

struct LocationAnswer: Decodable {
    let info: Info
    let results: [Location]
}

class Location: Decodable {
    let id: Int?
    let name: String
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String
    let created: String?
    
}

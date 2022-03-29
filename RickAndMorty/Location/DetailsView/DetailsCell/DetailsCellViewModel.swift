//
//  DetailsCellViewModel.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 16.03.2022.
//

import Foundation

protocol DetailsCellViewModelProtocol {
    var title: String? { get }
    var info: String { get }
    init (title: String?, info: String)
}

class DetailsCellViewModel: DetailsCellViewModelProtocol {
    var title: String?
    
    var info: String
    
    required init(title: String? = nil, info: String) {
        self.title = title
        self.info = info
    }
}

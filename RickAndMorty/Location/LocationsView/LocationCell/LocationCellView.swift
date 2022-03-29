//
//  LocationCellView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 15.03.2022.
//

import UIKit



class LocationCellView: UITableViewCell {
    var viewModel: LocationCellViewModelProtocol! {
        didSet {
            setupUI()
        }
    }
    
    lazy private var nameLabel: UILabel = {
        setupLabel(with: nil, font: .boldSystemFont(ofSize: 30))
    }()
    
    lazy private var typeLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: 20))
    }()
    
    lazy private var dimensionLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: 20))
    }()
    
    private func setupConstraints(for label: UILabel, near view: UIView) {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            label.heightAnchor.constraint(equalToConstant: label.font.pointSize),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16)
            
        ])
        if view == self {
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.topAnchor),
            ])
        } else {
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
    }
    
    private func setupUI() {
        nameLabel.text = viewModel.locationName
        typeLabel.text = viewModel.locationType
        dimensionLabel.text = viewModel.locationDimension
        addSubviews([nameLabel, typeLabel, dimensionLabel])
        setupConstraints(for: nameLabel, near: self)
        setupConstraints(for: typeLabel, near: nameLabel)
        setupConstraints(for: dimensionLabel, near: typeLabel)
        
    }
}

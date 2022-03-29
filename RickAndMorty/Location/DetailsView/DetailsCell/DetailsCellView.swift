//
//  DetailsCellView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 16.03.2022.
//

import UIKit

class DetailsCellView: UITableViewCell {

    var viewModel: DetailsCellViewModelProtocol! {
        didSet {
            setupUI(title: viewModel.title, info: viewModel.info)
        }
    }
    
    private lazy var titleLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: 17))
    }()
    
    private lazy var infoLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: 27))
    }()
    
    private func setupConstraints() {
        if titleLabel.text == nil {
            NSLayoutConstraint.activate([
                infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
                infoLabel.heightAnchor.constraint(equalToConstant: 27)
            ])
        } else {
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                titleLabel.heightAnchor.constraint(equalToConstant: 17),
                
                infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                infoLabel.heightAnchor.constraint(equalToConstant: 27),
                
                contentView.bottomAnchor.constraint(equalTo: infoLabel.bottomAnchor)
            ])
        }
    }
    
    private func setupUI(title: String?, info: String) {
        titleLabel.text = title
        infoLabel.text = info
        addSubviews([infoLabel, titleLabel])
        setupConstraints()
    }
    
    
}

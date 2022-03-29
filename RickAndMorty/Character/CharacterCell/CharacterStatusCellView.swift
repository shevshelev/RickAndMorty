//
//  CharacterStatusCellView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 12.03.2022.
//

import UIKit

class CharacterStatusCellView: UITableViewCell {

    var characterStatusCellViewModel: CharacterStatusCellViewModelProtocol! {
        didSet {
            setupUI()
        }
    }
    
    lazy private var titleLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: 17))
    }()
    
    lazy private var valueLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: 24))
    }()
    
    lazy private var statusView: UIView = {
        setupView(cornerRadius: 12)
    }()
    
    private func setupUI() {
        titleLabel.text = characterStatusCellViewModel.title
        valueLabel.text = characterStatusCellViewModel.value
        addSubviews([titleLabel, valueLabel])
        if characterStatusCellViewModel.title == "Live status:" {
            addSubview(statusView)
            setupStatusViewColor(status: characterStatusCellViewModel.value)
        }
        setupConstraints()
    }
    
    private func setupStatusViewColor(status: String) {
        switch status {
        case "Alive":
            statusView.backgroundColor = .systemGreen
        case "Dead":
            statusView.backgroundColor = .systemRed
        default:
            statusView.backgroundColor = .systemGray
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 17),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            valueLabel.heightAnchor.constraint(equalToConstant: 24),
            valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        if characterStatusCellViewModel.title == "Live status:" {
            NSLayoutConstraint.activate([
                statusView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                statusView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                statusView.heightAnchor.constraint(equalToConstant: 20),
                statusView.widthAnchor.constraint(equalTo: statusView.heightAnchor),
                
                valueLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor),
                valueLabel.leadingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: 5),
            ])
        } else {
            NSLayoutConstraint.activate([
                valueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
            ])
        }
    }
}

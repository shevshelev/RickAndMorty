//
//  CharacterCellView.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import UIKit

class CharacterCellView: UITableViewCell {
    
    var characterCellViewModel: CharacterDetailViewModelProtocol! {
        didSet {
            setupUI()
        }
    }
    
    private let standardFontSize: CGFloat = 17
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 45
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        setupLabel(with: nil, font: .boldSystemFont(ofSize: standardFontSize))
    }()
    
    private lazy var statusView: UIView = {
        setupView(cornerRadius: standardFontSize / 2)
    }()
    
    private lazy var statusLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: standardFontSize))
    }()
    
    private lazy var lastLocationLabel: UILabel = {
        setupLabel(with: "Last known location:", font: .systemFont(ofSize: standardFontSize))
    }()
    
    private lazy var locationLabel: UILabel = {
        setupLabel(with: nil, font: .systemFont(ofSize: standardFontSize))
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private func setupUI() {
        guard let imageData = characterCellViewModel.imageData else { return }
        characterImageView.image = UIImage(data: imageData)
        nameLabel.text = characterCellViewModel.name
        statusLabel.text = characterCellViewModel.status
        setupStatusViewColor(characterCellViewModel.status)
        locationLabel.text = characterCellViewModel.location
        favoriteButton.addTarget(characterCellViewModel, action: Selector(("favoritButtonPressed")), for: .touchUpInside)
        characterCellViewModel.isFavorite.bind { [unowned self] value in
            setupFavoriteButtonColor(value)
        }
        addSubviews([
            characterImageView,
            nameLabel,
            statusView,
            statusLabel,
            lastLocationLabel,
            locationLabel,
            favoriteButton
        ])
        setupConstraints()
    }
    
    private func setupStatusViewColor(_ status: String) {
        switch status {
        case "Alive":
            statusView.backgroundColor = .systemGreen
        case "Dead":
            statusView.backgroundColor = .systemRed
        default:
            statusView.backgroundColor = .systemGray
        }
    }
    
    private func setupFavoriteButtonColor(_ isFavorite: Bool) {
        favoriteButton.tintColor = isFavorite ? .systemRed : .systemGray
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 100),
            
            characterImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            characterImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            characterImageView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -10),
            characterImageView.widthAnchor.constraint(equalTo: characterImageView.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 5),
            nameLabel.heightAnchor.constraint(equalToConstant: standardFontSize),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            
            statusView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            statusView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 5),
            statusView.heightAnchor.constraint(equalToConstant: standardFontSize),
            statusView.widthAnchor.constraint(equalToConstant: standardFontSize),
            
            statusLabel.centerYAnchor.constraint(equalTo: statusView.centerYAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: statusView.trailingAnchor, constant: 3),
            statusLabel.heightAnchor.constraint(equalToConstant: standardFontSize),
            statusLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            lastLocationLabel.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 5),
            lastLocationLabel.leadingAnchor.constraint(equalTo: statusView.leadingAnchor),
            lastLocationLabel.heightAnchor.constraint(equalToConstant: standardFontSize),
            lastLocationLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: lastLocationLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: lastLocationLabel.leadingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: standardFontSize),
            lastLocationLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            favoriteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
}


extension UITableViewCell {
    func setupLabel(with text: String?, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = font
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    
    func setupView(cornerRadius: CGFloat) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = cornerRadius
        return view
    }
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { subview in
            addSubview(subview)
        }
    }
}

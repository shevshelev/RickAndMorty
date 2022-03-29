//
//  TabBarController.swift
//  RickAndMorty
//
//  Created by Shevshelev Lev on 11.03.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    private let characterVC = UINavigationController(rootViewController: CharactersView())
    private let locationVC = UINavigationController(rootViewController: LocationsView())
    private let episodeVC = UINavigationController(rootViewController: EpisodeView())

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController(VC: characterVC, title: "Characters", imageName: "person.fill")
        setupViewController(VC: locationVC, title: "Locations", imageName: "globe.europe.africa.fill")
        setupViewController(VC: episodeVC, title: "Episodes", imageName: "theatermasks")

        self.setViewControllers([characterVC, locationVC, episodeVC], animated: false)
    }
    
    private func setupViewController(VC: UINavigationController, title: String, imageName: String) {
        VC.tabBarItem.title = title
        VC.tabBarItem.image = UIImage(systemName: imageName)
    }
}

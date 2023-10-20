//
//  RMCharacterViewController.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import UIKit

/// Controller to search for character information
class RMCharacterViewController: UIViewController {

    let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        layoutUI()
    }
    
    private func layoutUI(){
        
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

//
//  RMCharacterViewController.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import UIKit

/// Controller to search for character information
class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
               
        let request = RMRequest(
            endpoint: .character,
            queryParameters: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
        print(request.url)
        
        RMService.shared.execute(request, expecting: RMCharacter.self) { result in
            switch result {
            case.success(let character):
                break
            case .failure(let error):
                break
            }
        }
        
    }
    
}

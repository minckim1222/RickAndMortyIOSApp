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
         
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total " + String(model.info.count))
                print("Pages " + String(model.info.pages))
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

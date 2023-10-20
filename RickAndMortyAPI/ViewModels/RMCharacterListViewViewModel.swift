//
//  CharacterListViewViewModel.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/20/23.
//

import UIKit

/// ViewModel to populate our CharacterList
class RMCharacterListViewViewModel: NSObject {
    func fetchCharacters() {
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


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
               print("Example url: " + String(model.results.first?.image ?? "none"))
           case .failure(let error):
               print(error)
           }
       }
    }
}


//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/23/23.
//

import Foundation

/// ViewModel for a single characters detail view
class RMCharacterDetailViewViewModel {
    
    let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    /// Computed property to get the name of the passed in Character
    var title: String {
        character.name.uppercased()
    }
    
}

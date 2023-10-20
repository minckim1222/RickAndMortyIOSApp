//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/20/23.
//

import Foundation

/// ViewModel for configuring CollectionView cell
struct RMCharacterCollectionViewCellViewModel {
    
    let characterName: String
    let characterStatus: RMCharacterStatus
    let characterImageUrl: URL?
    
    /// Public init
    /// - Parameters:
    ///   - characterName: Name of character
    ///   - characterStatus: Status of character
    ///   - characterImageUrl: URL for the character's image
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    /// Computed property to get the character's status
    var characterStatusText: String {
        return characterStatus.rawValue
    }
    
}

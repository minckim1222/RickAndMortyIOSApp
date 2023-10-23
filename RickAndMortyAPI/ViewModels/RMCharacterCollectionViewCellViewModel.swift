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
        return "Status: \(characterStatus.text)"
    }
    
    /// Function to fetch the image for a character cell
    /// - Parameter completion:
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void){
        guard let url = characterImageUrl else {
            completion(.failure((URLError(.badURL))))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
}

//
//  CharacterListViewViewModel.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/20/23.
//

import UIKit

/// Protocol connecting CharacterListView and the viewModel
protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
}

/// ViewModel to populate our CharacterList
class RMCharacterListViewViewModel: NSObject {
    
    weak var delegate: RMCharacterListViewViewModelDelegate?
    
    /// Holds the array of RMCharacter objects retrieved from fetchCharacters
    var characters : [RMCharacter] = []{
        
        didSet {
            /// Loop through characters array to create a ViewModel object for each
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            }
            
        }
    }
    
    
    /// Holds the array of cellViewModels to populate the collection view
    var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    func fetchCharacters() {
       RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
           switch result {
           case .success(let response):
               let results = response.results
               self?.characters = results
               DispatchQueue.main.async {
                   self?.delegate?.didLoadInitialCharacters()
               }
           case .failure(let error):
               print(error)
           }
       }
    }
}

/// Protocol stubs for CollectionView delegates
extension RMCharacterListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.reuseIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        
        return CGSize(width: width, height: width * 1.5)
    }
}

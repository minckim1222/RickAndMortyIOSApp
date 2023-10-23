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
    func didSelectCharacter(_ character: RMCharacter)
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
    
    /// Property to hold onto the response info
    var apiInfo: RMGetAllCharactersResponse.Info?
    
    /// Fetch the initial set of characters (20)
    func fetchCharacters() {
       RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
           switch result {
           case .success(let response):
               let results = response.results
               let info = response.info
               self?.characters = results
               self?.apiInfo = info
               DispatchQueue.main.async {
                   self?.delegate?.didLoadInitialCharacters()
               }
           case .failure(let error):
               print(error)
           }
       }
    }
    
    /// Paginate if additional characters are needed
    func fetchAdditionalCharacters(){
        
    }
    
    /// Bool to show more characters are loading
    var showLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    /// Bool to check to see if we are alreading loading more characters in our network call
    var isLoadingMoreCharacters: Bool = false
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
    
    /// CollectionView function that adds our footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter, let footer = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: RMLoadingFooterCollectionReusableView.reuseIdentifier,
            for: indexPath) as? RMLoadingFooterCollectionReusableView else {
            return UICollectionReusableView()
        }
        footer.startAnimating()
        return footer
    }
    
    /// CollectionView function to specify our footer size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard showLoadMoreIndicator else {
            return .zero
        }
        return CGSize(width: collectionView.frame.width, height: 100)
    }
}

extension RMCharacterListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard showLoadMoreIndicator, !isLoadingMoreCharacters else { return }
        let offset = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let totalScrollViewHeight = scrollView.frame.size.height
        
        if offset >= (totalContentHeight - totalScrollViewHeight - 120){
            print("Load More Followers")
            isLoadingMoreCharacters = true
        }
    }
}

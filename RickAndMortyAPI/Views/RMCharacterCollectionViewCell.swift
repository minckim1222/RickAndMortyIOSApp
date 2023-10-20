//
//  RMCharacterCollectionViewCell.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/20/23.
//

import UIKit

/// CollectionView cell for a single character
class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "RMCharacterCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with: RMCharacterCollectionViewCellViewModel) {
        
    }
    
}

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
    
    /// ImageView to hold the Character image
    private let characterImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    /// Label to hold the character name
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// Label to hold the character status
    private let statusLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(characterImageView, nameLabel, statusLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Empty out our cell before reusing
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    /// Function that configures our CollectionViewCell
    /// - Parameter with: ViewModel for our cell configuration
    public func configure(with: RMCharacterCollectionViewCellViewModel) {
        
    }
    
}

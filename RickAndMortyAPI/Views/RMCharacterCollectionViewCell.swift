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
        imageView.contentMode = .scaleAspectFill
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
        layoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Function that lays out the constraints for our views
    func layoutConstraints(){
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),
        ])
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
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.characterImageView.image = image
                }
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
}

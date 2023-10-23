//
//  RMLoadingFooterCollectionReusableView.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/23/23.
//

import UIKit

/// CollectionView footer to show our pagination loading indicator
class RMLoadingFooterCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "RMLoadingFooterCollectionReusableView"
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(spinner)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutUI(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func startAnimating() {
        spinner.startAnimating()
    }
    
}

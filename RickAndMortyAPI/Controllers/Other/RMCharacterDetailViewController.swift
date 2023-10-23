//
//  RMCharacterDetailViewController.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/23/23.
//

import UIKit

/// ViewController to show information about a single character
class RMCharacterDetailViewController: UIViewController {

    let viewModel: RMCharacterDetailViewViewModel
    
    init(viewModel: RMCharacterDetailViewViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

}

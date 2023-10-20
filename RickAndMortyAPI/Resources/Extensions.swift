//
//  Extensions.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/20/23.
//

import UIKit

/// Extension on UIView to add multiple subviews at once
extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach { addSubview($0)        }
    }
}

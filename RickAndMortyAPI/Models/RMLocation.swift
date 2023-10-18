//
//  RMLocation.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import Foundation

/// Data model for a location 
struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}

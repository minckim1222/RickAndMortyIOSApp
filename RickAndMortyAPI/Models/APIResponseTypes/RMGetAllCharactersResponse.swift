//
//  RMGetAllCharactersResponse.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/20/23.
//

import Foundation

/// Model for api response when getting characters
struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMCharacter]
}

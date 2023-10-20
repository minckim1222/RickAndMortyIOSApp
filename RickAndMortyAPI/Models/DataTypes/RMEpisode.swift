//
//  RMEpisode.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import Foundation

/// Data model for a single episode
struct RMEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

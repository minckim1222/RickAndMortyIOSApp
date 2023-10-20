//
//  RMCharacterStatus.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import Foundation

/// Enum that displays the current status of a character
enum RMCharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"

    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}

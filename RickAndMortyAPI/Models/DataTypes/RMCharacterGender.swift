//
//  RMCharacterGender.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import Foundation

/// Enum that displays the gender of a character
enum RMCharacterGender: String, Codable {
    case male = "Male"
    case female = "Female"
    case genderless = "Genderless"
    case unknown = "unknown"
}

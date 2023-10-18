//
//  RMService.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import Foundation


/// Main API Service object
class RMService {
    /// Shared singleton
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    
    /// Send the API call
    /// - Parameters:
    ///   - request: Request object
    ///   - completion: Callback with result or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {}
}

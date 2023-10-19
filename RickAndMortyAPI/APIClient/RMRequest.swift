//
//  RMRequest.swift
//  RickAndMortyAPI
//
//  Created by Min Kim on 10/18/23.
//

import Foundation

/// Object that represents an API call
class RMRequest {
    
    /// Initializer
    /// - Parameters:
    ///   - endpoint: Endpoint for building url
    ///   - pathComponents: Any additional path components for url
    ///   - queryParameters: Any parameters for filtering and querying
    init(endpoint: RMEndpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    /// Create a Constant for our base url
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Endpoint that will be passed in for the request
    let endpoint: RMEndpoint
    
    /// An array that holds any path components required for creating the url
    let pathComponents: [String]
    
    /// Any query parameters for filtering
    let queryParameters : [URLQueryItem]
    
    /// Computed property to build url string
    var urlString: String {
        
        /// Start our string with the base url
        var string = Constants.baseUrl
        /// Append a / to the end of the URL
        string += "/"
        /// Add the endpoint to the URL
        string += endpoint.rawValue
        
        /// Check to see if the path components is empty
        if !pathComponents.isEmpty {
            /// Loop through path components and append each to our current URL
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        
        /// Check to see if query parameters is empty
        if !queryParameters.isEmpty {
            /// Append a ? to begin querying
            string += "/?"
            /// Build the string to append to the end of the URL
            let argumentString = queryParameters.compactMap({
                /// QueryItem values can be nil, guard against that
                guard let value = $0.value else { return nil }
                /// Create query parameters based on key value pair of QueryItem
                return "\($0.name)=\(value)"})
                /// Join each separate QueryItem with an &
                .joined(separator: "&")
            
            /// Append the final argument string to the URL
            string += argumentString
        }
        
        /// Return the fully built URL
        return string
    }
    
    /// Computed property for our URL
    var url: URL? {
        /// Create a URL with our computed URL String property
        return URL(string: urlString)
    }
    
    /// Desired HTTPMethod
    public let httpMethod = "GET"
    
}

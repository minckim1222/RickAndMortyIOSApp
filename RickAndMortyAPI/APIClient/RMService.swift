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
    
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    
    /// Send the API call
    /// - Parameters:
    ///   - request: Request object
    ///   - expecting: The type of of object we expect back
    ///   - completion: Callback with result or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            
//            guard let url = request.url else { return }
//            let task = URLSession.shared.dataTask(with: url) { data, _, error in
//                guard let data = data else {return}
//                do {
//                    
//                    let json = try JSONSerialization.jsonObject(with: data)
//                    print(String(describing: json))
//                    
//                } catch {
//                    completion(.failure(error))
//                }
//
//            }
//            task.resume()
        
            guard let urlRequest = self.request(from: request) else {
                completion(.failure(RMServiceError.failedToCreateRequest))
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? RMServiceError.failedToGetData))
                    return
                }
                
                do {
                    
                    let result = try JSONDecoder().decode(type.self, from: data)
                    completion(.success(result))
                    
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
    }
    
    /// Function that converts our RMRequest URL object into a URLRequest Object
    /// - Parameter rmRequest: Passed in RMRequest object to convert
    /// - Returns: URLRequest object to use in network calls
    private func request(from rmRequest: RMRequest) -> URLRequest? {
        guard let url = rmRequest.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod
        return request
    }
    
}

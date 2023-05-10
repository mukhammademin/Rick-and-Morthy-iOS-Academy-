//
//  RMService.swift
//  Rick&Morthy
//
//  Created by Mukhammademin Eminov on 04/05/23.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    
    /// API Constants
    private struct Contents {
        static let baseURL = "https://rickandmortyapi.com/api/character"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndPoint
    
    /// Path components for APi
    private let pathComponents: [String]
    
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String{
        
        var string = Contents.baseURL
        //string += "/"
        //string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                string += "/\($0)"
            }
        }
        if !queryParameters.isEmpty {
            string += "?"
            let argumentedString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            string += argumentedString 
        }
        return string
    }
    
    /// Computed & constructed API url
        public var url: URL? {
        return URL(string: urlString)
            
    }
    
    /// Desired http method
    public let httpMethod = "GET"
    
    /// Constucted request
    /// - Parameters:   
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of Path components
    ///   - queryParameters: Collection of query parametres
    init(endpoint: RMEndPoint,
         pathComponents: [String],
         queryParameters: [URLQueryItem]) {
        
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}

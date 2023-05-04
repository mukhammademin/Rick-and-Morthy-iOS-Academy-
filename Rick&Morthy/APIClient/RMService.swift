//
//  RMRequest.swift
//  Rick&Morthy
//
//  Created by Mukhammademin Eminov on 04/05/23.
//

import Foundation
final class RMService {
    static let shared = RMRequest()
    private init() {}
    
    public func execute(_ request: RMRequest, completion: @escaping () -> Void) {
        
    }
}

//
//  RMLocation.swift
//  Rick&Morthy
//
//  Created by Mukhammademin Eminov on 27/04/23.
//

import Foundation

struct RMLoacation: Codable {
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
}

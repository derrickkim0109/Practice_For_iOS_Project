//
//  Animal.swift
//  Sample_CollectionView
//
//  Created by Derrick kim on 2022/06/16.
//

import Foundation

struct Animal: Codable, Hashable {
    let name: String
    let latinName: String
    let animalType: String
    let activeTime: String
    let lifespan: String
    let habitat: String
    let diet: String
    let geoRange: String
    let imageLink: String
    let id: Int
    
    let identifier = UUID()
    
    enum CodingKeys: String, CodingKey {
        case name
        case latinName
        case animalType
        case activeTime
        case lifespan
        case habitat
        case diet
        case geoRange
        case imageLink
        case id
    }
}

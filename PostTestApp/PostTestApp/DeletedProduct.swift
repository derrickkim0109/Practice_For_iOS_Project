//
//  DeletedProduct.swift
//  PostTestApp
//
//  Created by Derrick kim on 2022/07/27.
//

import Foundation

struct DeletedProduct {
    let id: Int
    let vendor_id: Int
    let name: String
    let description: String
    let thumbnail: String
    let currency: String
    let price: Int
    let bargain_price: Int
    let discounted_price: Int
    let stock: Int
    
    let images: [Image]
    let vendors: String
    let created_at: String
    let issued_at: String
}

//
//  PatchProductEntity.swift
//  PostTestApp
//
//  Created by Derrick kim on 2022/07/27.
//

import Foundation

struct PatchProductEntity {
    let name: String?
    let descriptions: String?
    let thumbnail_id: Int?
    let price: Int?
    let currency: String?
    let discounted_price: Int
    let stock: Int
    let secret: String
    
    init(name: String?, descriptions: String?, thumbnail_id: Int?, price: Int?, currency: String = "KRW", discounted_price: Int = 0, stock: Int = 0, secret: String) {
        self.name = name
        self.descriptions = descriptions
        self.thumbnail_id = thumbnail_id
        self.price = price
        self.currency = currency
        self.discounted_price = discounted_price
        self.stock = stock
        self.secret = secret
    }
}

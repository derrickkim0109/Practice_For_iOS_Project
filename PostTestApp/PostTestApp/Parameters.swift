//
//  Parameters.swift
//  PostTestApp
//
//  Created by Derrick kim on 2022/07/26.
//

import Foundation
enum Currency: String {
    case KRW = "KRW"
    case USD = "USD"
}

struct Parameters {
    static let key: String = "params"
    
    let name: String
    let descriptions: String
    let price: Int
    let currency: Currency
    let discountedPrice: Int?
    let stock: Int?
    let secret: String
    
    init(name: String, descriptions: String, price: Int, currency: Currency, secret: String, discounted_price: Int? = 0, stock: Int? = 0) {
        self.name = name
        self.descriptions = descriptions
        self.price = price
        self.currency = currency
        self.discountedPrice = discounted_price
        self.stock = stock
        self.secret = secret
    }
    
    func returnParamatersString() -> String {
        var returnString = String()
        returnString.append("{\n")
        returnString.append("""
                            "name": "\(name)",
                            "descriptions": "\(descriptions)",
                            "price": \(price),
                            "currency": "\(currency.rawValue)",
                            "secret": "\(secret)",
                            """)
        
        if let discountedPrice = discountedPrice {
            returnString.append("\n\"discounted_price\": \(discountedPrice),")
        }
        
        if let stock = stock {
            returnString.append("\n\"stock\": \(stock)")
        }
        
        returnString.append("\n}")
        
//        print(returnString)
                        
        return returnString
    }
}

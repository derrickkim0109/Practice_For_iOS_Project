//
//  Model.swift
//  0801-CoreData-Activity
//
//  Created by minsson on 2022/08/01.
//

import Foundation

struct Model {
    let content: String
    let category: Category
    let id: UUID

    enum Category: String {
        case 유행어
        case 아재개그
    }
}

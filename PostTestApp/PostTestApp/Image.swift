//
//  Image.swift
//  PostTestApp
//
//  Created by Derrick kim on 2022/07/26.
//

import UIKit
struct Image {
    static let key: String = "images"
    
    let filename: String
    let data: Data
    let mimeType: String
    
    init?(withImage image: UIImage) {
        self.mimeType = "image/jpeg"
        self.filename = "image\(arc4random()).jpeg"
        
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
    
        self.data = data
    }
}

//
//  HorizontalStackView.swift
//  UIImagePicker_Sample
//
//  Created by Derrick kim on 2022/07/28.
//

import UIKit

final class HorizontalStackView: UIStackView {
    init(image: UIImage) {
        super.init(frame: .null)
        
        setDefaultAttribute()
        addImageView(image)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension HorizontalStackView {
    func addImageView(_ image: UIImage) {
        let imageView = createImage(with: image)
        self.addArrangedSubview(imageView)
    }
    
    func setDefaultAttribute() {
        self.spacing = 0
        self.alignment = .fill
        self.distribution = .fill
        self.axis = .horizontal
    }
    
    func createImage(with image: UIImage) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = image
        return imageView
    }
}

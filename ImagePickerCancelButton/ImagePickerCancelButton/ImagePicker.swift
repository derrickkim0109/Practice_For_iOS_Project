//
//  ImagePicker.swift
//  ImagePickerCancelButton
//
//  Created by Derrick kim on 2022/08/06.
//

import UIKit

protocol ImagePickerDelegate : AnyObject {
    func clickButton()
}

class ImagePicker : UIView {
    weak var delegate : ImagePickerDelegate?
    private var image : UIImageView!
    private var button : UIButton!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
    }
    
    convenience init () {
        self.init(frame:.zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        backgroundColor = .clear
        
        createImage()        
        createButton()
    }
    
    private func createImage() {
        image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named : "image1")
        image.layer.cornerRadius = 10
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor(red: 0.46, green: 0.47, blue: 0.91, alpha: 1.00).cgColor
        image.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [image.topAnchor.constraint(equalTo: topAnchor,constant: 15),
             image.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -15),
             image.leftAnchor.constraint(equalTo: leftAnchor,constant: 15),
             image.rightAnchor.constraint(equalTo: rightAnchor,constant: -15)])
    }
    
    private func createButton() {
        button = UIButton()
        button.setImage(UIImage(systemName: "x.circle.fill"), for: .normal)
        button.imageView?.tintColor = .gray
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [button.topAnchor.constraint(equalTo: topAnchor, constant: 7),
             button.heightAnchor.constraint(equalToConstant: 20),
             button.widthAnchor.constraint(equalToConstant: 20),
             button.rightAnchor.constraint(equalTo: rightAnchor,constant: -7)])
        
        button.addTarget(self, action: #selector(click), for: .touchDown)
    }

    @objc private func click() {
        delegate?.clickButton()
    }
}

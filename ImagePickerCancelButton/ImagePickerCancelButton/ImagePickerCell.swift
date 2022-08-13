//
//  ImagePickerCell.swift
//  ImagePickerCancelButton
//
//  Created by Derrick kim on 2022/08/06.
//

import UIKit

final class ImagePickerCell : UICollectionViewCell {
    weak var removeCellDelegate : RemoveDelegate?
    
    let imagePicker  = ImagePicker()
    var indexPath : IndexPath!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        imagePicker.delegate  = self
        imagePicker.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imagePicker)
        NSLayoutConstraint.activate(
            [imagePicker.topAnchor.constraint(equalTo: topAnchor),
             imagePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
             imagePicker.trailingAnchor.constraint(equalTo : trailingAnchor),
             imagePicker.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
}
extension ImagePickerCell : ImagePickerDelegate {
    func clickButton() {
        removeCellDelegate?.removeCell( indexPath)
    }
}

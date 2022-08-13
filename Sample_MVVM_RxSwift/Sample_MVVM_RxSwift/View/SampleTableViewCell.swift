//
//  SampleTableViewCell.swift
//  Sample_MVVM_RxSwift
//
//  Created by Derrick kim on 2022/08/13.
//

import UIKit
import Then
import SnapKit

class SampleTableViewCell: UITableViewCell {
    static let identifier: String = "SampleTableViewCell"
    
    let nameLabel = UILabel().then { label in
        label.translatesAutoresizingMaskIntoConstraints = false
    }
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addSubView() {
        contentView.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.contentView).offset(30)
            make.bottom.equalTo(self.contentView).offset(-30)
            make.leading.equalTo(self.contentView).offset(10)
            make.trailing.equalTo(self.contentView).offset(-10)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
    }
}

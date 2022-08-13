//
//  MyTableViewCell.swift
//  SampleTableView
//
//  Created by Derrick kim on 2022/06/16.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    static let id = "MyTableViewCell"
    var indexRow: Int = 0
    
    let indexLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .white
        detailLabel.text = nil
    }
    
    private func setConstraint() {
        contentView.addSubview(indexLabel)
        contentView.addSubview(detailLabel)
        NSLayoutConstraint.activate([
            indexLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            indexLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            indexLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            indexLabel.trailingAnchor.constraint(equalTo: detailLabel.leadingAnchor, constant: 10),
            
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            detailLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            detailLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
        ])
    }
}

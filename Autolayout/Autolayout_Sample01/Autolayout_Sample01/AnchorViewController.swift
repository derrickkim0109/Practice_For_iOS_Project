//
//  AnchorViewController.swift
//  Autolayout_Sample01
//
//  Created by Derrick kim on 2022/05/15.
//

import UIKit

class AnchorViewController: UIViewController {
    let button: UIButton = {
       var button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemGreen
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        button.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16).isActive = true
        button.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16).isActive = true // 안쪽으로 들어오려면 마이너스 처리해야함
        
        let safeBottomAnchor = button.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        safeBottomAnchor.isActive = true
        
        safeBottomAnchor.priority = .init(rawValue: 999 ) //.defaultHigh
        
        let viewBottomAnchor = button.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -20)
        viewBottomAnchor.isActive = true
    }
}

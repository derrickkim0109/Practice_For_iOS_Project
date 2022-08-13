//
//  ViewController.swift
//  mvvmPattern
//
//  Created by Derrick kim on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Example
        // 1
        let birthday = Date(timeIntervalSinceNow: (-2 * 86400 * 366))
        let image = UIImage(named: "stuart") ?? .add
        let stuart = Pet(name: "Stuart",
                         birthday: birthday,
                         rarity: .veryRare,
                         image: image)

        // 2
        let viewModel = PetViewModel(pet: stuart)

        // 3
        let frame = CGRect(x: 0, y: 0, width: 300, height: 420)
        let view = PetView(frame: frame)

        // 4
        viewModel.configure(view)
    }
}


//
//  SecondViewController.swift
//  ViewLifeCycle
//
//  Created by Do Yi Lee on 2022/05/05.
//

import UIKit

class SecondViewController: UIViewController {
    
    //뷰가 메모리에 로드 될 것이다.
    override func loadView() {
        super.loadView()
        print("\(title ?? "") loadView")
    }
    
    //뷰가 방금 메모리에 로드 됐다.
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(title ?? "") viewDidLoad")
    }
    
    //뷰가 보여질 것이다
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(title ?? "") viewWillAppear")
    }
    
    // 뷰가 나타난 직후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(title ?? "") viewDidAppear")
    }
    
    // 뷰가 사라질 것이다
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(title ?? "") viewWillDisappear")
    }
    
    //뷰가 사라진 직후
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(title ?? "") viewDidDisappear")
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func pop(_ sender: Any) {
        guard let firstVC = navigationController?.viewControllers
            .first(where: { $0 is ViewController}) else {
            return
        }
        
        navigationController?
            .popToViewController(firstVC, animated: true)
    }
}

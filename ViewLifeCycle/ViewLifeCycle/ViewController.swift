//
//  ViewController.swift
//  ViewLifeCycle
//
//  Created by Do Yi Lee on 2022/05/05.
//

import UIKit

class ViewController: UIViewController {
    //뷰를 메모리에 로드하려한다.
    override func loadView() {
        super.loadView()
        print("\(title ?? "") loadView")
    }
    
    //뷰가 방금 메모리에 로드 됐다.(뷰가 보이는것 보장하지 않음)
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(title ?? "") viewDidLoad")
    }
    
    //뷰가 보여질 것이다
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(title ?? "") viewWillAppear")
        changeBackgroundColor()
    }
    
    // 뷰가 나타난 직후
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\(title ?? "") viewDidAppear")
       // changeBackgroundColor()
    }
    
    // 뷰가 사라질 것이다
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(title ?? "") viewWillDisappear")
        //changeBackgroundColor()
    }
    
    //뷰가 사라진 직후
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("\(title ?? "") viewDidDisappear")
    }
    
    deinit {
        print("\(title ?? "") deinit")
    }
    
    //뷰 색깔 바꾸기
    private func changeBackgroundColor() {
        let randomColor = UIColor(red: CGFloat(Double.random(in: 0...1)),
                                  green: CGFloat(Double.random(in: 0...1)),
                                  blue: CGFloat(Double.random(in: 0...1)),
                                  alpha: 1)
        self.view.backgroundColor = randomColor
    }
}


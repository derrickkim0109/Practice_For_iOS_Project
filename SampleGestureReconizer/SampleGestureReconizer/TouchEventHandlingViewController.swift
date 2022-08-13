//
//  TouchEventHandlingViewController.swift
//  SampleGestureReconizer
//
//  Created by Derrick kim on 2022/07/04.
//

import UIKit

class TouchEventHandlingViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let x = touch!.location(in: self.view).x
//        let y = touch!.location(in: self.view).y
//        myLabel.text = "x: \(String(format: "%.2f", x)), y: \(String(format: "%.2f", y))"
//
//        if let location = touch?.location(in: UIScreen.main.focusedView) {
//            let halfScreenWidth = UIScreen.main.bounds.width / 2
//            if location.x < halfScreenWidth {
//                directionLabel.text = "왼쪽"
//            } else {
//                directionLabel.text = "오른쪽"
//            }
//        }
//    }
}

class TouchEventHandlingView: UIView {
    private var startPoint: CGPoint = .zero

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {
            return
        }
        startPoint = point
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else {
            return
        }
        
        if point.x < startPoint.x {
            
        } else {
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            
    }
}

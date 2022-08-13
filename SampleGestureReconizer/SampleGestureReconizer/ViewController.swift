//
//  ViewController.swift
//  SampleGestureReconizer
//
//  Created by Derrick kim on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        sender.maximumNumberOfTouches = 1
        
        let velocity = sender.velocity(in: view)
        print(velocity)
        if abs(velocity.x) > abs(velocity.y) {
            directionLabel.text = velocity.x < 0 ? "왼쪽" : "오른쪽"
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let x = touches.first!.location(in: self.view).x
        let y = touches.first!.location(in: self.view).y
        locationLabel.text = "x: \(String(format: "%.2f", x)), y: \(String(format: "%.2f", y))"
    }
}


/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information

    Abstract:
    A view controller that demonstrates changing the size of elements inside UIStackViews.
*/

import UIKit

class DynamicHeightColumnsViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet var labels: [UILabel]!
    
    var usingLargeFont = false
    
    var timer: NSTimer?
    
    // MARK: UIViewController
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "changeFontSizeTimerDidFire:", userInfo: nil, repeats: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: Timer
    
    func changeFontSizeTimerDidFire(timer: NSTimer) {
        // Toggle the font preference.
        usingLargeFont = !usingLargeFont
        
        // Determine which font should now be used.
        let font = usingLargeFont ? UIFont.systemFontOfSize(36.0) : UIFont.systemFontOfSize(17.0)
        
        for label in labels {
            label.font = font
        }
    }
}

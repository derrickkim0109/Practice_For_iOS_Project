/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information

    Abstract:
    A view controller that demonstrates changing the size of elements inside UIStackViews.
*/

import UIKit

class DynamicHeightLabelAndTextFieldViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
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
        
        // Set the `nameLabel`'s font for the appropriate size.
        nameLabel.font = usingLargeFont ? UIFont.systemFontOfSize(36.0) : UIFont.systemFontOfSize(17.0)
    }
}

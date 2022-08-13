/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information

    Abstract:
    A view controller demonstrating how to dynamically add and remove items from a stack view while animating the change.
*/

import UIKit

class DynamicStackViewController: UIViewController {
    // MARK: Properties
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the scrollview.
        let insets = UIEdgeInsets(top: 20, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = insets
        scrollView.scrollIndicatorInsets = insets
    }
    
    // MARK: Interface Builder actions

    @IBAction func addEntry(_: AnyObject) {
        guard let addButtonContainerView = stackView.arrangedSubviews.last else { fatalError("Expected at least one arranged view in the stack view.") }
        let nextEntryIndex = stackView.arrangedSubviews.count - 1
        
        let offset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + addButtonContainerView.bounds.size.height)

        let newEntryView = createEntryView()
        newEntryView.hidden = true
        
        stackView.insertArrangedSubview(newEntryView, atIndex: nextEntryIndex)

        UIView.animateWithDuration(0.25) {
            newEntryView.hidden = false
            self.scrollView.contentOffset = offset
        }
    }
    
    func deleteStackView(sender: UIButton) {
        guard let entryView = sender.superview else { return }
        
        UIView.animateWithDuration(0.25, animations: {
            entryView.hidden = true
        }, completion: { _ in
            entryView.removeFromSuperview()
        })
    }

    // MARK: Convenience
    
    /// Creates a horizontal stack view entry to place within the parent `stackView`.
    private func createEntryView() -> UIView {
        let date = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .ShortStyle, timeStyle: .NoStyle)
        let number = NSUUID().UUIDString
        
        let stack = UIStackView()
        stack.axis = .Horizontal
        stack.alignment = .Center
        stack.distribution = .Fill
        stack.spacing = 8
        
        let dateLabel = UILabel()
        dateLabel.text = date
        dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        numberLabel.setContentHuggingPriority(UILayoutPriorityDefaultLow - 1.0, forAxis: .Horizontal)
        numberLabel.setContentCompressionResistancePriority(UILayoutPriorityDefaultHigh - 1.0, forAxis: .Horizontal)
        
        let deleteButton = UIButton(type: .RoundedRect)
        deleteButton.setTitle("Delete", forState: .Normal)
        deleteButton.addTarget(self, action: "deleteStackView:", forControlEvents: .TouchUpInside)
        
        stack.addArrangedSubview(dateLabel)
        stack.addArrangedSubview(numberLabel)
        stack.addArrangedSubview(deleteButton)
        
        return stack
    }
}

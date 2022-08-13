/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information

    Abstract:
    A view controller that demonstrates self sizing table view cells and how to ensure they're updated when the user changes the system font size.
*/

import UIKit

class SelfSizingTableViewController: UITableViewController {
    // MARK: Properties
    
    var fontChangeObserver: AnyObject?
    
    let sampleTexts = ["Short Text Example",
        "All the world's a stage, and all the men and women merely players: they have their exits and their entrances; and one man in his time plays many parts, his acts being seven ages.",
        "This life, which had been the tomb of his virtue and of his honor, is but a walking shadow; a poor player, that struts and frets his hour upon the stage, and then is heard no more: it is a tale told by an idiot, full of sound and fury, signifying nothing."
    ]
    
    // MARK: Initialization

    deinit {
        if let observer = fontChangeObserver {
            NSNotificationCenter.defaultCenter().removeObserver(observer)
        }
    }
    
    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable self sizing rows.
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Set up font change observer
        let application = UIApplication.sharedApplication()
        let notificationCenter = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        
        fontChangeObserver = notificationCenter.addObserverForName(UIContentSizeCategoryDidChangeNotification, object: application, queue: queue) { [unowned self] _ in
            self.tableView.invalidateIntrinsicContentSize()
        }
    }

    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleTexts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(SelfSizingTableViewCell.reuseIdentifier, forIndexPath: indexPath) as? SelfSizingTableViewCell else {
            fatalError("Unable to dequeue a SelfSizingTableViewCell.")
        }
        
        cell.textView.text = sampleTexts[indexPath.row]
        
        return cell
    }
}

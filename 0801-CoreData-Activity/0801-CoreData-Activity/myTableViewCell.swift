//
//  myTableViewCell.swift
//  0801-CoreData-Activity
//
//  Created by minsson on 2022/08/01.
//

import UIKit

class myTableViewCell: UITableViewCell {

    
    @IBOutlet weak var myTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

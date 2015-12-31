//
//  PersonalEndingCell.swift
//  The Ending
//
//  Created by Xin on 23/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class PersonalEndingCell: UITableViewCell {
    @IBOutlet weak var personalImageView: ProfileImageView!
    @IBOutlet weak var personalImageName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var like: UILabel!
    @IBOutlet weak var collection: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

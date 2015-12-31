//
//  ProfileImageView.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class ProfileButtonView: UIButton {
    
    private struct Constants {
        static let BorderWidth: CGFloat = 1.5
        static let BorderColor: CGColor = UIColor.whiteColor().CGColor
    }

    private func setup() {
        self.layer.masksToBounds = true;
        self.layer.borderWidth = Constants.BorderWidth
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.borderColor = Constants.BorderColor
    }
    
    override func awakeFromNib() {
        setup()
    }

}

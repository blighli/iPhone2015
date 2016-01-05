//
//  ProfileImageView.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class BigProfileView: UIView {
    
    private struct Constants {
        static let BorderWidth: CGFloat = 4
        static let BorderColor: CGColor = UIColor.whiteColor().CGColor
        static let ShadowOffset: CGSize = CGSizeMake(0, 3)
        static let ShadowColor: CGColor = UIColor.blackColor().CGColor
        static let ShadowOpacity: Float = 1.0
        static let ShadowRadius: CGFloat = 2.0
    }

    private func setup() {
        //make subview circle.
        self.subviews[0].layer.masksToBounds = true;
        self.subviews[0].layer.borderWidth = Constants.BorderWidth
        self.subviews[0].layer.cornerRadius = self.frame.size.width / 2
        self.subviews[0].layer.borderColor = Constants.BorderColor

        self.layer.shadowColor = Constants.ShadowColor
        self.layer.shadowOffset = Constants.ShadowOffset
        self.layer.shadowOpacity = Constants.ShadowOpacity
        self.layer.shadowRadius = Constants.ShadowRadius
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

}

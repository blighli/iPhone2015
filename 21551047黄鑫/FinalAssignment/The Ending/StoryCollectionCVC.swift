//
//  StoryCollectionCVC.swift
//  The Ending
//
//  Created by Xin on 22/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class StoryCollectionCVC: UICollectionViewCell {
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var collectionStoryBrief: UITextView!
    
    private struct Constants {
        static let CornerRadius: CGFloat = 3.0
        static let ShadowOffset: CGSize = CGSizeMake(0, 3)
        static let ShadowColor: CGColor = UIColor.blackColor().CGColor
        static let ShadowOpacity: Float = 1.0
        static let ShadowRadius: CGFloat = 10.0
    }
    
    private func setup() {
        self.layer.masksToBounds = true;
        self.layer.cornerRadius = Constants.CornerRadius
        self.layer.shadowColor = Constants.ShadowColor
        self.layer.shadowOffset = Constants.ShadowOffset
        self.layer.shadowOpacity = Constants.ShadowOpacity
        self.layer.shadowRadius = Constants.ShadowRadius
    }
    
    override func awakeFromNib() {
        setup()
    }
}

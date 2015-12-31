//
//  StoryCardView.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class StoryCardView: UIView {
    
    private struct Constants {
        static let CornerRadius: CGFloat = 8.0
        static let ShadowOffset: CGSize = CGSizeMake(0, 3)
        static let ShadowColor: CGColor = UIColor.blackColor().CGColor
        static let ShadowOpacity: Float = 1.0
        static let ShadowRadius: CGFloat = 10.0
        static let EdgeInset: CGFloat = 10//字体左右间距
    }
    
    @IBOutlet weak var eyeView: UIView!
    @IBOutlet weak var story: UITextView!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var storyImage: UIImageView!
    @IBOutlet weak var seeCountLabel: UILabel!
    @IBOutlet weak var writerNameLabel: UILabel!
    @IBOutlet weak var writerProfileImage: UIImageView!
    
    private func setup() {
        self.view.layer.masksToBounds = true;
        self.view.layer.cornerRadius = Constants.CornerRadius
        self.layer.shadowColor = Constants.ShadowColor
        self.layer.shadowOffset = Constants.ShadowOffset
        self.layer.shadowOpacity = Constants.ShadowOpacity
        self.layer.shadowRadius = Constants.ShadowRadius
        self.story.selectable = false
        self.story.textContainerInset = UIEdgeInsets(top: Constants.EdgeInset, left: Constants.EdgeInset, bottom: 0, right: Constants.EdgeInset)
    }
    
    func setup(info: CardInfo) {
        story.text = info.story
        storyImage.image = UIImage(named: info.imageSrc)
        seeCountLabel.text = "\(info.seeCount)"
        writerNameLabel.text = info.writerNickname
        writerProfileImage.image = UIImage(named: info.writerImageSrc)
    }
    
    override func awakeFromNib() {
        setup()
    }
}

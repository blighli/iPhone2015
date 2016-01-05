//
//  ComposeBeginningView.swift
//  The Ending
//
//  Created by Xin on 24/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class ComposeBeginningView: UIView {
    private struct Constants {
        static let EdgeInset: CGFloat = 10//字体左右间距
        static let StartFontColor: UIColor = UIColor(red: 0.6824, green: 0.6824, blue: 0.6824, alpha: 1)//字体颜色

    }
    
    var contentView: StoryCardView!
    
    override func awakeFromNib() {
        contentView = NSBundle.mainBundle().loadNibNamed("StoryCardView", owner: self, options: nil).last as! StoryCardView
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.story.selectable = true
        contentView.story.textContainerInset = UIEdgeInsets(top: Constants.EdgeInset, left: Constants.EdgeInset, bottom: 0, right: Constants.EdgeInset)
        contentView.story.attributedText = AppUtils.attributedString("\n   请发起一段开头吧!", attributes: [NSForegroundColorAttributeName, NSFontAttributeName], values: [Constants.StartFontColor, UIFont(name: "PingFang SC", size: 15.0)!], inRange: [NSMakeRange(0, 13), NSMakeRange(0, 13)])
        contentView.eyeView.layer.opacity = 0
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
    }
}

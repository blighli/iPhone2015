//
//  AboutView.swift
//  Timer
//
//  Created by Hardor on 15/12/31.
//  Copyright © 2015年 Hardor. All rights reserved.
//

import UIKit

final class AboutView: UIView {
    
    let csdnButton: UIButton
    let githubButton: UIButton
    let stackView: UIStackView
    
    override init(frame: CGRect) {
        
        let avatarWidth = CGFloat(120)
        
        let avatarImageView = UIImageView(image: UIImage(named: "avatar"))
        avatarImageView.layer.cornerRadius = avatarWidth/2.0
        avatarImageView.clipsToBounds = true
        
        let handleLabel = UILabel(frame: .zero)
        handleLabel.text = "@hardor"
        handleLabel.textColor = TimerStyleKit.timerColor
        
        let emailLabel = UILabel(frame: .zero)
        emailLabel.text = "Email:903637886@qq.com"
        emailLabel.textColor = TimerStyleKit.timerColor
        
        let buttonWithTitle = { (title: String) -> UIButton in
            let button = UIButton(type: .System)
            button.setTitle(title, forState: .Normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.yellowColor().CGColor
            button.layer.cornerRadius = 5
            button.widthAnchor.constraintEqualToConstant(120).active = true
            return button
        }
        
        csdnButton = buttonWithTitle("CSDN博客")
        githubButton = buttonWithTitle("Github")
        
        
        stackView = UIStackView(arrangedSubviews: [avatarImageView, handleLabel, emailLabel,csdnButton, githubButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .Vertical
        stackView.alignment = .Center
        stackView.spacing = 10
        
        super.init(frame: frame)
        
        tintColor = .yellowColor()
        backgroundColor = TimerStyleKit.backgroundColor
        
        addSubview(stackView)
        
        var layoutConstraints = [NSLayoutConstraint]()
        layoutConstraints.append(stackView.centerXAnchor.constraintEqualToAnchor(centerXAnchor))
        layoutConstraints.append(avatarImageView.widthAnchor.constraintEqualToConstant(avatarWidth))
        layoutConstraints.append(avatarImageView.heightAnchor.constraintEqualToConstant(avatarWidth))
        NSLayoutConstraint.activateConstraints(layoutConstraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

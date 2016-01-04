//
//  RatingControl.swift
//  BookTracker
//
//  Created by 朱坤 on 15/12/27.
//  Copyright © 2015年 zhukun. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    var rating = 0 {
    didSet{
       //setNeedsLayout()
    }
    }
    var spacing = 5;
    var stars = 5
    
    var ratingButtons = [UIButton]()
    
    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar")
        let filledImage = UIImage(named: "filledStar")
        
        
        for _ in 0..<stars {
            
            let Button  = UIButton()
            Button.setImage( emptyStarImage, forState: .Normal)
            Button.setImage(filledImage, forState: .Selected)
            Button.setImage(filledImage, forState: [.Highlighted, .Selected])
            Button.adjustsImageWhenHighlighted = false
    
            //let Button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44 ))
            //Button.backgroundColor = UIColor.redColor()
            Button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown )
            addSubview(Button)
            ratingButtons+=[Button]
        }

    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for(index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        
        for(index, button ) in ratingButtons.enumerate(){
            button.selected = index < rating
        }
    }
}

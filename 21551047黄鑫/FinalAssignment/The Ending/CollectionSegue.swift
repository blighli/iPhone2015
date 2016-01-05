//
//  CollectionSegue.swift
//  The Ending
//
//  Created by Xin on 21/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class CollectionSegue: UIStoryboardSegue {
    private struct Constants {
        static let ButtonSubviewIndex = 5
        static let ButtonHighlightImageName = "collection_01"
    }
    
    ///TODO：时间可以进一步地优化，目前iPhone 5时间为0.3s左右，应该优化到0.1s以下，可以采取优化getViewSnapshot函数或者分开处理. (View Hierarchy同时也是导致滚动的时候性能低下的原因)，叉号可以出来后再弹出
    override func perform() {
        let source = sourceViewController
        let destination = destinationViewController
        
        destination.view.backgroundColor = UIColor.clearColor()
        
        let overlayBlurView = UIVisualEffectView()
        overlayBlurView.effect = UIBlurEffect(style: .Dark)
        overlayBlurView.frame = source.view.frame
 
        //restore the button selected view back to normal to create smoother background image
        let btnView = source.view.subviews[Constants.ButtonSubviewIndex] as! UIButton
        btnView.setBackgroundImage(UIImage(named: Constants.ButtonHighlightImageName), forState: .Highlighted)
        
        let sImage = AppUtils.getViewSnapshot(source.view, scale: UIScreen.mainScreen().scale)
        let newView = UIImageView(image: sImage)
        newView.addSubview(overlayBlurView)
        let imageBackground = UIImageView(image: AppUtils.getViewSnapshot(newView, scale: UIScreen.mainScreen().scale))
        
        source.view.addSubview(overlayBlurView)
        source.view.addSubview(destination.view)
        overlayBlurView.center = CGPointMake(overlayBlurView.center.x, source.view.bounds.height * 3 / 2)
        destination.view.center = CGPointMake(destination.view.center.x, source.view.bounds.height * 3 / 2)
        
        UIView.animateWithDuration(0.5, animations: {
                destination.view.center = CGPointMake(destination.view.center.x, source.view.bounds.height / 2)
                overlayBlurView.center = CGPointMake(overlayBlurView.center.x, source.view.bounds.height / 2)
            }
            , completion: { finished in
                destination.view.insertSubview(imageBackground, atIndex: 0)
                btnView.setBackgroundImage(nil, forState: .Highlighted)//restore background image.
                source.navigationController?.pushViewController(destination, animated: false)
                overlayBlurView.removeFromSuperview()
                if destination.respondsToSelector("steupViews") {
                    destination.performSelector("steupViews")
                }
        })
    }
}

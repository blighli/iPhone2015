//
//  MasterDetailViewController.swift
//  The Ending
//
//  Created by Xin on 23/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class MasterDetailViewController: UIViewController {
    private var isAnimating: Bool = false
    
    private struct Constants {
        static let GapWidth: CGFloat = 72
        static let AnimationTime = 0.3
    }
    
    ///This method must be overriden to make this controller work
    func detailControllerIdentifierName()->String {
        preconditionFailure("This method must be overridden")
    }
    
    lazy var child: UIViewController? = {
        return self.storyboard?.instantiateViewControllerWithIdentifier(self.detailControllerIdentifierName())
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewController(child!)
        self.view.addSubview(child!.view)
        var cFrame = child!.view.frame
        cFrame.size.width -= Constants.GapWidth
        child!.view.frame = cFrame
        child!.view.center = CGPointMake(-child!.view.bounds.size.width / 2, child!.view.center.y)
    }
    
    func slide(isUp: Bool) {
        if isAnimating {
            return
        }
        self.isAnimating = true
        if (isUp) {
            let overlayBlurView = UIVisualEffectView()
            overlayBlurView.frame = view.frame
            overlayBlurView.tag = 101
            view.insertSubview(overlayBlurView, belowSubview: child!.view)
            
            UIView.animateWithDuration(Constants.AnimationTime, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.child!.view.center = CGPointMake(self.view.bounds.size.width / 2 - Constants.GapWidth / 2, self.view.bounds.size.height / 2)
                overlayBlurView.effect = UIBlurEffect(style: .Dark)
                }, completion: { finished in
                    self.isAnimating = false
            })
            
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTapGesture:")
            gestureRecognizer.numberOfTapsRequired = 1
            overlayBlurView.addGestureRecognizer(gestureRecognizer)
            
        } else {
            var overlayBlurView: UIVisualEffectView? = nil
            for subView in view.subviews {
                if subView.tag == 101 {
                    overlayBlurView = subView as? UIVisualEffectView
                }
            }
            if let blurView = overlayBlurView {
                UIView.animateWithDuration(Constants.AnimationTime, animations: {
                    self.child!.view.center = CGPointMake(-self.child!.view.bounds.size.width / 2, self.child!.view.center.y)
                    blurView.effect = nil
                    }, completion: { finished in
                        blurView.removeFromSuperview()
                        self.isAnimating = false
                })
            }
        }
    }
    
    func handleTapGesture(gesture: UIPanGestureRecognizer) {
        if gesture.numberOfTouches() == 1 {
            slide(false)
        }
    }
}

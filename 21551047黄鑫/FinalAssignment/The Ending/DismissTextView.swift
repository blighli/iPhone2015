//
//  DismissTextView.swift
//  The Ending
//
//  Created by Xin on 26/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class DismissTextView: UITextView {
    var dismissView: UIView!

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if dismissView.layer.opacity == 1 {
            UIView.animateWithDuration(0.3) {
                self.dismissView.layer.opacity = 0
            }
        }
        super.touchesBegan(touches, withEvent: event)
    }
}

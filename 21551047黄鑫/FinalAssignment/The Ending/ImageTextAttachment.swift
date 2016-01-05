//
//  ImageTextAttachment.swift
//  The Ending
//
//  Created by Xin on 27/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

//Create a full width image text attachment
class ImageTextAttachment: NSTextAttachment {
    func scaleImageSizeToWidth(width: CGFloat) -> CGRect{
        let factor = CGFloat(width / self.image!.size.width)
        return CGRectMake(0, 0, self.image!.size.width * factor, self.image!.size.height * factor)
    }
    
    override func attachmentBoundsForTextContainer(textContainer: NSTextContainer?, proposedLineFragment lineFrag: CGRect, glyphPosition position: CGPoint, characterIndex charIndex: Int) -> CGRect {
        let attachmentWidth = CGRectGetWidth(lineFrag) - textContainer!.lineFragmentPadding * 2
        return scaleImageSizeToWidth(attachmentWidth)
    }
}

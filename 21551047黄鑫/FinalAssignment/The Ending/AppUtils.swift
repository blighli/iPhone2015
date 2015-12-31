//
//  AppUtils.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class AppUtils: NSObject {
    ///Get UIImage from specific UIView, it will display the whole view hierarchy.
    static func getViewSnapshot(view: UIView, scale: CGFloat) -> UIImage! {
        let startTime = CFAbsoluteTimeGetCurrent()
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, scale)
        view.drawViewHierarchyInRect(view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("getViewSnapshot costs:\(timeElapsed)s")
        return image
    }
    
    static func getDateString(date: NSDate) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM-dd HH:mm"
        return formatter.stringFromDate(date)
    }
    
    static func attributedString(string: String, attributes: [String], values: [AnyObject], inRange:[NSRange]) -> NSAttributedString? {
        if attributes.count != values.count || attributes.count != inRange.count { return nil}
        let res = NSMutableAttributedString(string: string)
        var index = 0
        for eachAttr in attributes {
            res.addAttribute(eachAttr, value: values[index], range: inRange[index])
            index++
        }
        return res
    }
    
    static func getResizeImage(sourceImage: UIImage, toWidth width: CGFloat) -> UIImage {
        let oldWidth = sourceImage.size.width;
        let scaleFactor = width / oldWidth;
        
        let newHeight = sourceImage.size.height * scaleFactor;
        let newWidth = oldWidth * scaleFactor;
        
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight));
        sourceImage.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return newImage;
    }
    
    static func getLineBreakerText() -> NSAttributedString{
        let res: NSMutableAttributedString = NSMutableAttributedString(string: "")
        let textAttachment = NSTextAttachment()
        textAttachment.image = UIImage(named: "line_breaker")
        let lineBreaker = NSAttributedString(attachment: textAttachment)
        res.appendAttributedString(lineBreaker)
        res.appendAttributedString(NSAttributedString(string: "\r\n\n\n"))
        return res
    }
    
    static func getImageText(resourceSrc: String!) -> NSAttributedString {
        let res: NSMutableAttributedString = NSMutableAttributedString(string: "")
        let textAttachment = ImageTextAttachment()
        textAttachment.image = UIImage(named: resourceSrc)
        let lineBreaker = NSAttributedString(attachment: textAttachment)
        res.appendAttributedString(lineBreaker)
        res.appendAttributedString(NSAttributedString(string: "\r\n\n\n"))
        return res
    }
    
    static func centerLineBreakerAndImageView(attributedString: NSMutableAttributedString) {
        attributedString.enumerateAttribute(NSAttachmentAttributeName, inRange: NSRange(location: 0, length: attributedString.length), options: .LongestEffectiveRangeNotRequired) { (attribute, range, stop) -> Void in
            if let _ = attribute as? NSTextAttachment {
                // this example assumes you want to center all attachments. You can provide additional logic here. For example, check for attachment.image.
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = .Center
                attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            }
        }
    }
    
}

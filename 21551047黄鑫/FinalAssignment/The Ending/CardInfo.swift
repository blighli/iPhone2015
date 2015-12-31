//
//  CardInfo.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class CardInfo: NSObject {
    
    var story: String!
    var imageSrc: String!
    var seeCount: Int = 0
    var writerImageSrc: String!
    var writerNickname: String!
    
    override var description: String {
        get {
            return "CardInfo{story=\(story), imageSrc=\(imageSrc), seeCount=\(seeCount), writerImageSrc=\(writerImageSrc), writerNickname=\(writerNickname)}"
        }
    }
}

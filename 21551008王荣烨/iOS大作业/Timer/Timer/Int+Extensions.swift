//
//  Int+Extensions.swift
//  Timer
//
//  Created by Hardor on 15/12/31.
//  Copyright © 2015年 Hardor. All rights reserved.
//

import Foundation
extension Int {
    func format(f: String) -> String {
        return NSString(format: "%\(f)d", self) as String
    }
}
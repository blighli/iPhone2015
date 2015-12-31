//
//  PersonalInfoSegue.swift
//  The Ending
//
//  Created by Xin on 23/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class PersonalInfoSegue: UIStoryboardSegue {
    override func perform() {
        let source = sourceViewController
        let destination = destinationViewController
    
        let indexViewController = source.parentViewController?.parentViewController as? IndexViewController
        indexViewController?.slide(false)
        indexViewController?.navigationController?.pushViewController(destination, animated: true)
    }
}

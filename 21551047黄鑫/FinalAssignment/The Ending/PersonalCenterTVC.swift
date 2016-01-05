//
//  PersonalCenterTVC.swift
//  The Ending
//
//  Created by Xin on 23/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class PersonalCenterTVC: UITableViewController {

    private func getSegueIdentifier(tag: Int) -> String?{
        switch tag {
        case 102:
            return "PersonalInfoSegue"
        case 100:
            return "ComposeBeginningSegue"
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if let identifier = getSegueIdentifier(cell!.tag) {
            performSegueWithIdentifier(identifier, sender: self)
        }
    }
}

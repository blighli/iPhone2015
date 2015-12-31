//
//  RegisterViewController.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var nickNameTF: UITextField!
    @IBOutlet weak var phoneOrEmailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.closeButton.rac_signalForControlEvents(.TouchUpInside)
            .subscribeNext { x in
                self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}

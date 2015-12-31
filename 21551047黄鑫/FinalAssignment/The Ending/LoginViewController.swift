//
//  LoginViewController.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit
import ReactiveCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var weiboButton: UIButton!
    @IBOutlet weak var wechatButton: UIButton!
    @IBOutlet weak var qqButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private struct Constants {
        static let LoginSegueName: String = "loginSegue"
        static let PersonalSegueName: String = "personalSegue"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.rac_signalForControlEvents(.TouchUpInside)
            .subscribeNext { _ in
                self.performSegueWithIdentifier(Constants.LoginSegueName, sender: self)
        }
        let userSignal = usernameTF.rac_signalForControlEvents(.EditingDidEndOnExit)
        let passwordSignal = passwordTF.rac_signalForControlEvents(.EditingDidEndOnExit)
        let combineSignal = RACSignal.combineLatest([userSignal, passwordSignal])
        combineSignal.subscribeNext { x in
            
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if (identifier == Constants.LoginSegueName) {
                
            }
        }
    }

}

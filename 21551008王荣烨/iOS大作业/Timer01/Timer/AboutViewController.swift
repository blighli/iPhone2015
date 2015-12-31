//
//  AboutViewController.swift
//  Timer
//
//  Created by Hardor on 15/12/31.
//  Copyright © 2015年 Hardor. All rights reserved.
//

import UIKit
import SafariServices

final class AboutViewController: UIViewController {
    
    private var aboutView: AboutView {
        return view as! AboutView
    }
    
    override func loadView() {
        let contentView = AboutView(frame: .zero)
        
        title = NSLocalizedString("关于", comment: "About")
        //    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: TimerStyleKit.timerColor]
        
        contentView.csdnButton.addTarget(self, action: "openCsdn", forControlEvents: .TouchUpInside)
        contentView.githubButton.addTarget(self, action: "openGithub", forControlEvents: .TouchUpInside)
        view = contentView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        aboutView.stackView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 20).active = true
        
        let doneButton = UIBarButtonItem(title: "退出", style: .Plain,target: self, action: "dismissAbout")
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func dismissAbout() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

//MARK: - Button actions
extension AboutViewController {
    func openCsdn() {
        let safariViewController = SFSafariViewController(URL: NSURL(string: "http://write.blog.csdn.net/postlist")!)
        presentViewController(safariViewController, animated: true, completion: nil)
    }
    
    func openGithub() {
        let safariViewController = SFSafariViewController(URL: NSURL(string: "https://github.com/Tipharodr/Timer")!)
        presentViewController(safariViewController, animated: true, completion: nil)
    }
}
//
//  ViewController.swift
//  homework_1
//
//  Created by 常惠源 on 15/10/12.
//  Copyright © 2015年 zhukunkun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mlabel: UILabel!

    @IBAction func btnClick(sender: UIButton){
        let btnText = sender.currentTitle!
        mlabel.text = "You clicked \(btnText)"
        
    }


}


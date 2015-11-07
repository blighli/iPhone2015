//
//  ViewController.swift
//  work1_ywh
//
//  Created by ywh on 15/10/24.
//  Copyright © 2015年 ywh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MyLabel: UILabel!
    @IBOutlet weak var MyButton: UIButton!
    
    @IBAction func ButtonClicked(sender: UIButton) {
        MyLabel.text = "the button is clicked!";
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MyButton.setTitle("按下按钮显示文字", forState:UIControlState.Normal);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


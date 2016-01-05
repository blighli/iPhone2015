//
//  ComposeBeginningVC.swift
//  The Ending
//
//  Created by Xin on 23/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class ComposeBeginningVC: UIViewController, WritingViewControllerDelegate {
    private struct Constants {
        static let WritingSegue: String = "WritingSegue"
        static let ImageBackground: UIColor = UIColor(red: 0.8281, green: 0.8281, blue: 0.8281, alpha: 1)
    }

    @IBOutlet weak var composeView: ComposeBeginningView!
    @IBOutlet weak var publishButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    private var imagePickerAlertViewController: UIAlertController!
    
    private var content: NSAttributedString! = NSAttributedString(string: "") {
        didSet {
            self.composeView.contentView.story.attributedText = content
        }
    }
    
    private var localResource: String?
    
    func handleTextViewTapGesture(gesture: UITapGestureRecognizer) {
        if gesture.numberOfTouches() == 1 {
            performSegueWithIdentifier(Constants.WritingSegue, sender: self)
        }
    }
    
    func handleImageViewTapGesture(gesture: UITapGestureRecognizer) {
        if gesture.numberOfTouches() == 1 {
            presentViewController(imagePickerAlertViewController, animated: true, completion: nil)
        }
    }
    
    private func setImageWithLocalResource(resource: String?) {
        if let r = resource {
            self.composeView.contentView.storyImage.image = UIImage(named: r)
        }
    }
    
    private func setup() {
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTextViewTapGesture:")
        gestureRecognizer.numberOfTapsRequired = 1
        composeView.contentView.story.addGestureRecognizer(gestureRecognizer)
        backButton.rac_signalForControlEvents(.TouchUpInside)
            .subscribeNext { _ in
                self.navigationController?.popViewControllerAnimated(true)
        }
        publishButton.rac_signalForControlEvents(.TouchUpInside)
            .subscribeNext { _ in
                self.publish()
        }
        composeView.contentView.storyImage.clipsToBounds = true
        composeView.contentView.storyImage.backgroundColor = Constants.ImageBackground
        composeView.contentView.storyImage.image = UIImage(named: "icon_add")
        composeView.contentView.storyImage.contentMode = .Center
        composeView.contentView.storyImage.userInteractionEnabled = true
        let imageGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleImageViewTapGesture:")
        imageGestureRecognizer.numberOfTapsRequired = 1
        composeView.contentView.storyImage.addGestureRecognizer(imageGestureRecognizer)
        
        //setup imagePickerAlertViewController
        imagePickerAlertViewController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        imagePickerAlertViewController.view.backgroundColor = UIColor.whiteColor()
        
        //图片滚动视图
        let bottomView = UIView(frame: CGRectMake(0, 0, imagePickerAlertViewController.view.bounds.size.width - 20, 140))
        bottomView.backgroundColor = UIColor.whiteColor()
        
        //滚动视图
        let scrollView = UIScrollView(frame: bottomView.bounds)
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        let cnt = 10
        var buttonList = [UIButton]()
        var localResourceName = [String]()
        for var i = 0; i < cnt; i++ {
            localResourceName.append("temp_\(i % 2 + 1)")
            let image = UIImage(named: localResourceName[i])
            let buttonView = UIButton(frame: CGRectMake(30 + 130 * CGFloat(i), 20, 100, 100))
            buttonView.setImage(image, forState: .Normal)
            buttonView.imageView?.contentMode = .ScaleAspectFill
            buttonView.layer.masksToBounds = true
            buttonView.layer.cornerRadius = 2
            buttonList.append(buttonView)
            scrollView.addSubview(buttonView)
        }
        for var i = 0; i < cnt; i++ {
            buttonList[i].rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
                for var j = 0; j < cnt; j++ {
                    buttonList[j].imageView?.layer.borderWidth = 0
                }
                let button = x as! UIButton
                button.imageView?.layer.borderColor = UIColor.grayColor().CGColor
                button.imageView?.layer.borderWidth = 3
                self.localResource = localResourceName[buttonList.indexOf(button)!]
            }
        }
        scrollView.contentSize = CGSizeMake(30 + 130 * CGFloat(cnt), scrollView.bounds.height)
        bottomView.addSubview(scrollView)
        imagePickerAlertViewController.view.addSubview(bottomView)
        
        //分界线视图
        let seperatorView = UIView(frame: CGRectMake(0, 140, imagePickerAlertViewController.view.bounds.size.width - 20, 1))
        seperatorView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        imagePickerAlertViewController.view.addSubview(seperatorView)
        
        //取消视图
        let cancelView = UIView(frame: CGRectMake(0, 155, imagePickerAlertViewController.view.bounds.size.width - 20, 50))
        cancelView.backgroundColor = UIColor.clearColor()
        imagePickerAlertViewController.view.addSubview(cancelView)
        
        //取消按钮
        let cancelButton = UIButton()
        cancelButton.setTitle("取   消", forState: .Normal)
        cancelButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        cancelButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        cancelButton.sizeToFit()
        cancelButton.center = CGPointMake(cancelView.bounds.size.width / 4, cancelButton.bounds.size.height / 2)
        cancelButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        cancelView.addSubview(cancelButton)
        
        //确定按钮
        let positiveButton = UIButton()
        positiveButton.setTitle("确   定", forState: .Normal)
        positiveButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        positiveButton.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        positiveButton.sizeToFit()
        positiveButton.center = CGPointMake(cancelView.bounds.size.width * 3 / 4, cancelButton.bounds.size.height / 2)
        positiveButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            self.dismissViewControllerAnimated(true, completion: nil)
            self.setImageWithLocalResource(self.localResource)
        }
        cancelView.addSubview(positiveButton)
        
        //伪取消视图(由于iOS 8的限制，只能给一个伪取消视图从而能够在点击屏幕外面条件下取消alert controller)
        let action = UIAlertAction(title: "", style: .Cancel, handler: nil)
        imagePickerAlertViewController.addAction(action)
        action.enabled = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.WritingSegue {
            if let destiny = segue.destinationViewController as? WritingViewController {
                destiny.delegate = self
                destiny.content = self.content
            }
        }
    }
    
    func getTextViewContent(content: NSAttributedString) {
        self.content = content
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    private func publish() {
        let beginningContent = composeView.contentView.story.text
        print(beginningContent)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

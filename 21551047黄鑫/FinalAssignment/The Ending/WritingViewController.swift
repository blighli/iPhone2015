//
//  WritingViewController.swift
//  The Ending
//
//  Created by Xin on 24/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

protocol WritingViewControllerDelegate: class { //The only function of this protocol is get data.
    func getTextViewContent(content: NSAttributedString)
}

//TODO:对于键盘X的Redo与Undo效果还有待完善
//TODO:对于键盘高度改变的时候可以改变font view的位置
//TODO:对于分隔线的删除细节还需要优化
class WritingViewController: UIViewController, UITextViewDelegate {
    
    private struct Constants {
        static let EdgeInset: CGFloat = 10//字体左右间距
        static let StartFontColor: UIColor = UIColor(red: 0.6824, green: 0.6824, blue: 0.6824, alpha: 1)//字体颜色
    }

    @IBOutlet weak var textView: DismissTextView! {
        didSet {
            textView.textContainerInset = UIEdgeInsets(top: 0, left: Constants.EdgeInset, bottom: 0, right: Constants.EdgeInset)
            textView.delegate = self
        }
    }
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    weak var delegate: WritingViewControllerDelegate?
    
    var content: NSAttributedString?
    
    private var isFirstEdit: Bool = false {
        didSet {
            if isFirstEdit {
                textView.attributedText = AppUtils.attributedString(" ", attributes: [NSForegroundColorAttributeName, NSFontAttributeName], values: [UIColor.blackColor(), UIFont(name: "PingFang SC", size: 18.0)!], inRange: [NSMakeRange(0, 1), NSMakeRange(0, 1)])//first change the style
                textView.text = ""//after that change the content
            } else {
                textView.attributedText = AppUtils.attributedString("请发起一段开头吧!", attributes: [NSForegroundColorAttributeName, NSFontAttributeName], values: [Constants.StartFontColor, UIFont(name: "PingFang SC", size: 15.0)!], inRange: [NSMakeRange(0, 9), NSMakeRange(0, 9)])
            }
        }
    }
    private var redoManager: RedoManager<String> = RedoManager()
    private var needsPush = true
    private var isBold = false {
        didSet {
            replaceFontInRange(textView.selectedRange, text: textView.attributedText.attributedSubstringFromRange(textView.selectedRange).string)
        }
    }
    private var selectFont = 2 {
        didSet {
            replaceFontInRange(textView.selectedRange, text: textView.attributedText.attributedSubstringFromRange(textView.selectedRange).string)
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if !isFirstEdit {
            isFirstEdit = true
        }
    }
    
    private func dismissKeyboard() {
        dismissFontView()
        textView.resignFirstResponder()
    }
    
    private func dismissFontView() {
        if textView.dismissView.layer.opacity == 1 {
            UIView.animateWithDuration(0.3) {
                self.textView.dismissView.layer.opacity = 0
            }
        }
    }
    
    private func undo() {
        if let res = redoManager.undo(textView.text) {
            textView.text = res
        }
        needsPush = true
        dismissFontView()
    }
    
    private func redo() {
        if let res = redoManager.redo(textView.text) {
            textView.text = res
        }
        needsPush = true
        dismissFontView()
    }
    
    private func replaceFontInRange(range: NSRange, text: String) {
        let font = UIFont(name: "PingFang-SC" + (isBold ? "-Medium" : "-Regular"), size: 20.0 - CGFloat(2 * selectFont))!
        textView.textStorage.replaceCharactersInRange(range, withAttributedString: AppUtils.attributedString(text, attributes: [NSForegroundColorAttributeName, NSFontAttributeName], values: [UIColor.blackColor(), font], inRange: [NSMakeRange(0, text.characters.count), NSMakeRange(0, text.characters.count)])!)
    }
    
    private var replaceRange: NSRange?
    private var isInputChinese = false
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if self.needsPush {
            self.redoManager.push(textView.text)
            self.needsPush = false
        }
        if !isInputChinese {
            replaceRange = NSRange(location: range.location, length: text.characters.count)
        }
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        //利用中文的选中textRange的特殊F特性去处理中文
        if textView.selectedTextRange!.description.characters.last == "F" {
            if isInputChinese {
                replaceRange?.length = textView.text.characters.count - replaceRange!.location
            }
            isInputChinese = false
            let text = (textView.text as NSString).substringWithRange(replaceRange!)
            replaceFontInRange(self.replaceRange!, text: text)
        } else {
            isInputChinese = true
        }
    }

    /*
        对于如何实现attribuedText与HTML的互转参见:
        http://stackoverflow.com/questions/20309606/ios-nsattributedstring-to-html
        do {
            let data = try textView.attributedText.dataFromRange(NSMakeRange(0, textView.attributedText.length), documentAttributes: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType])
            print(NSString(data: data, encoding: NSUTF8StringEncoding))
        } catch { }
    */
    private func changeFont() {
        let view = textView.dismissView
        if view.layer.opacity == 0 {
            UIView.animateWithDuration(0.3) {
                view!.layer.opacity = 1
            }
        } else {
            dismissFontView()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
    }
    
    private func addPressed() {
        dismissFontView()
        let result = NSMutableAttributedString()
        result.appendAttributedString(self.textView.attributedText!)
        result.appendAttributedString(NSAttributedString(string: "\n\n\n"))
        result.appendAttributedString(AppUtils.getLineBreakerText())
        AppUtils.centerLineBreakerAndImageView(result)
        self.textView.attributedText = result
    }
    
    private func morePressed() {
        dismissFontView()
    }
    
    private func buildBarButtonItem(imageName: String, event: () -> Void) -> UIBarButtonItem {
        let button: UIButton = UIButton()
        button.setImage(UIImage(named: imageName), forState: .Normal)
        button.sizeToFit()
        button.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            event()
        }
        return UIBarButtonItem(customView: button)
    }
    
    private func buildPositionBarButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
    }
    
    private func buildFontImageView() -> UIView {
        let view = UIImageView(image: UIImage(named: "tb_blackbg"))
        view.userInteractionEnabled = true
        view.center = CGPointMake(view.center.x + 70, textView.bounds.size.height - 189)
        let boldButton = UIButton()
        boldButton.center = CGPointMake(boldButton.center.x + 15, boldButton.center.y)
        boldButton.setTitleColor(UIColor.orangeColor(), forState: .Highlighted)
        boldButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            let button = x as! UIButton
            let isSelected = button.titleColorForState(.Normal) != UIColor.whiteColor()
            button.setTitleColor(!isSelected ? UIColor.orangeColor() : UIColor.whiteColor(), forState: .Normal)
            self.isBold = !isSelected
        }
        boldButton.setTitle("B", forState: .Normal)
        boldButton.titleLabel!.font = UIFont.systemFontOfSize(24)
        boldButton.sizeToFit()
        let colorButton = UIButton()
        colorButton.backgroundColor = UIColor.blackColor()
        colorButton.frame = CGRectMake(0, 0, 20, 20)
        colorButton.layer.borderWidth = 1
        colorButton.layer.borderColor = UIColor.orangeColor().CGColor
        colorButton.layer.cornerRadius = colorButton.frame.size.width / 2
        colorButton.center = CGPointMake(boldButton.center.x + 50, boldButton.center.y)
        view.addSubview(boldButton)
        view.addSubview(colorButton)
        var buttonList = [UIButton]()
        for var i = 1; i <= 3; i++ {
            let buttonTitle = "H\(i)"
            let hButton = UIButton()
            hButton.center = CGPointMake(colorButton.center.x + CGFloat((i > 1 ? 44 : 40) * i), hButton.center.y + CGFloat(Double(i) * 2.5))
            hButton.setTitleColor(UIColor.orangeColor(), forState: .Highlighted)
            hButton.setTitle(buttonTitle, forState: .Normal)
            let size = 22 - CGFloat((i - 1) * 3)
            let text = AppUtils.attributedString(buttonTitle, attributes: [NSFontAttributeName, NSFontAttributeName], values: [UIFont(name: "Helvetica-Light", size: size)!, UIFont(name: "Helvetica-Light", size: 10)!], inRange: [NSMakeRange(0,1), NSMakeRange(1,1)])
            hButton.titleLabel?.attributedText = text
            hButton.sizeToFit()
            buttonList.append(hButton)
            view.addSubview(hButton)
        }
        buttonList[self.selectFont].setTitleColor(UIColor.orangeColor(), forState: .Normal)
        for var i = 0; i < 3; i++ {
            let button = buttonList[i]
            button.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
                for var j = 0; j < 3; j++ {
                    buttonList[j].setTitleColor(UIColor.whiteColor(), forState: .Normal)
                }
                x.setTitleColor(UIColor.orangeColor(), forState: .Normal)
                self.selectFont = buttonList.indexOf(button)! + 1
                print(self.selectFont)
            }
        }
        view.layer.opacity = 0
        return view
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = .Default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFirstEdit = false
        if content != nil && content?.string.characters.count != 0 {
            isFirstEdit = true
            self.textView.attributedText = content
        }
        
        closeButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        finishButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            self.dismissViewControllerAnimated(true, completion: nil)
            self.delegate?.getTextViewContent(self.textView.attributedText)
        }
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        toolbar.barStyle = .Default
        toolbar.items = [buildBarButtonItem("tb_keyboard", event: dismissKeyboard),buildPositionBarButtonItem(), buildBarButtonItem("revoke", event: undo),buildPositionBarButtonItem(),buildBarButtonItem("rollback", event: redo),buildPositionBarButtonItem(),buildBarButtonItem("tb_font", event: changeFont),buildPositionBarButtonItem(),buildBarButtonItem("tb_add", event: addPressed),buildPositionBarButtonItem(),buildBarButtonItem("tb_more", event: morePressed)]
        toolbar.sizeToFit()
        textView.inputAccessoryView = toolbar
        self.view.addSubview(buildFontImageView())
        textView.dismissView = self.view.subviews.last
    }
    
    
}

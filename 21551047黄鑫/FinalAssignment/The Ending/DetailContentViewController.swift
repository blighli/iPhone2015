//
//  DetailContentViewController.swift
//  The Ending
//
//  Created by Xin on 27/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

//TODO:这里面有一些常量需要优化，另外Profile View的hide也需要优化
class DetailContentViewController: UIViewController, UITextViewDelegate, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    private struct Constants {
        static let CellIdentifier: String = "ChooseEndingCellID"
    }

    var writerProfileImageSrc: String! {
        didSet {
            writerProfileImage.image = UIImage(named: writerProfileImageSrc)
        }
    }
    var writerNickname: String! {
        didSet {
            writerNicknameLabel.text = writerNickname
        }
    }
    var contentDate: NSDate! {
        didSet {
            writeDateLabel.text = AppUtils.getDateString(contentDate)
        }
    }
    var content: NSMutableAttributedString! {
        didSet {
            AppUtils.centerLineBreakerAndImageView(content)
            textView.attributedText = content
        }
    }
    var currentPage: Int = 1
    var totalPage: Int = 1
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var writerProfileImage: UIImageView!
    @IBOutlet weak var writerNicknameLabel: UILabel!
    @IBOutlet weak var writeDateLabel: UILabel!
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.textContainer.lineFragmentPadding = 0
            textView.delegate = self
            textView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleTextViewTapGesture:"))
        }
    }
    
    private var gestureTranslation: CGPoint!
    private var isDisplayingTopView = false
    
    func handleTextViewTapGesture(gesture: UITapGestureRecognizer) {
        if gesture.numberOfTouches() == 1 {
            showOrDimissTopBottomNavView()
        }
    }
    
    func handlePanGesture(gesture: UIPanGestureRecognizer) {
        if gesture.state == .Began {
            gestureTranslation = gesture.translationInView(self.topNavView)
            UIView.animateWithDuration(0.3) {
                self.topNavView.subviews.last!.layer.opacity = 0
                self.bottomNavView.layer.opacity = 0
            }
        } else if gesture.state == .Changed {
            let translation = gesture.translationInView(self.topNavView)
            gestureTranslation = translation
            self.topNavView.frame = CGRectMake(self.topNavView.bounds.origin.x, self.topNavView.bounds.origin.y, self.topNavView.bounds.size.width, self.topNavView.bounds.size.height + gestureTranslation.y)
            gesture.setTranslation(CGPointZero, inView: self.topNavView)
            self.topNavView.subviews[0].frame = self.topNavView.frame
        } else if gesture.state == .Ended {
            if self.topNavView.frame.height <= self.view.frame.height / 2 {
                UIView.animateWithDuration(0.5) {
                    self.topNavView.frame = CGRectMake(self.topNavView.bounds.origin.x, self.topNavView.bounds.origin.y, self.topNavView.bounds.size.width, 75)
                    self.topNavView.subviews[0].frame = self.topNavView.frame
                    self.topNavView.subviews.last!.layer.opacity = 1
                    self.bottomNavView.layer.opacity = 1
                }
            } else {
                UIView.animateWithDuration(0.5, animations: {
                    self.topNavView.frame = CGRectMake(self.topNavView.bounds.origin.x, self.topNavView.bounds.origin.y, self.topNavView.bounds.size.width, self.view.bounds.size.height)
                    self.topNavView.subviews[0].frame = self.topNavView.frame
                    }, completion: {finished in
                })
                isDisplayingTopView = true
            }
        }
    }
    
    private func showOrDimissTopBottomNavView() {
        if self.topNavView.layer.opacity == 0 {
            hideProfileView(false)
            UIApplication.sharedApplication().statusBarStyle = .LightContent
            UIView.animateWithDuration(0.3) {
                self.topNavView.layer.opacity = 1
                self.bottomNavView.layer.opacity = 1
            }
        } else {
            dismissTopBottomNavView()
        }
    }
    
    private func dismissTopBottomNavView() {
        if self.topNavView.layer.opacity == 0 { return }
        UIApplication.sharedApplication().statusBarStyle = .Default
        UIView.animateWithDuration(0.3) {
            self.topNavView.layer.opacity = 0
            self.bottomNavView.layer.opacity = 0
            self.topNavView.frame = CGRectMake(self.topNavView.bounds.origin.x, self.topNavView.bounds.origin.y, self.topNavView.bounds.size.width, 75)
            self.topNavView.subviews[0].frame = self.topNavView.frame
            self.topNavView.subviews.last!.layer.opacity = 1
        }
    }
    
    private lazy var topNavView: UIView = {
        let resView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 75))
        resView.backgroundColor = UIColor.clearColor()
        resView.clipsToBounds = true
        
//        let imageView = UIView(frame: resView.bounds)
//        imageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
//        imageView.contentMode = .ScaleAspectFill
//        resView.addSubview(imageView)
        
        let overlayBlurView = UIVisualEffectView()
        overlayBlurView.effect = UIBlurEffect(style: .Dark)
        overlayBlurView.frame = resView.frame
        resView.addSubview(overlayBlurView)
        
        resView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "handlePanGesture:"))
        
        let tableView = UITableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - resView.frame.size.height - 60), style: .Plain)
        tableView.center = CGPointMake(tableView.center.x, tableView.center.y + resView.frame.size.height)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        resView.addSubview(tableView)
        
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "back"), forState: .Normal)
        backButton.sizeToFit()
        backButton.center = CGPointMake(backButton.center.x + 20, 20 + (resView.bounds.size.height - 20) / 2)
        resView.addSubview(backButton)
        backButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        let pageLabel = UILabel()
        pageLabel.text = "1/1"
        pageLabel.font = UIFont.systemFontOfSize(24)
        pageLabel.textColor = UIColor.whiteColor()
        pageLabel.sizeToFit()
        pageLabel.center = CGPointMake(resView.bounds.width / 2, 20 + (resView.bounds.size.height - 20) / 2)
        resView.addSubview(pageLabel)

        let arrowView = UIImageView(image: UIImage(named: "down_arrow"))
        arrowView.center = CGPointMake(pageLabel.center.x + 28, pageLabel.center.y + 5)
        resView.addSubview(arrowView)
        
        resView.layer.opacity = 0
        return resView
    }()
    
    private lazy var bottomNavView: UIView = {
        let resView = UIView(frame: CGRectMake(0, self.view.frame.size.height - 61, self.view.frame.size.width, 61))
        resView.backgroundColor = UIColor.clearColor()
        
//        let imageView = UIImageView(image: UIImage(named: "bottomBar"))
//        imageView.frame = resView.bounds
//        imageView.contentMode = .ScaleAspectFill
//        resView.addSubview(imageView)
        let overlayBlurView = UIVisualEffectView()
        overlayBlurView.effect = UIBlurEffect(style: .Dark)
        overlayBlurView.frame = resView.bounds
        resView.addSubview(overlayBlurView)
        
        let likeButton = UIButton()
        likeButton.setImage(UIImage(named: "heart_white"), forState: .Normal)
        likeButton.sizeToFit()
        likeButton.center = CGPointMake(40, resView.bounds.size.height / 2 - 8)
        resView.addSubview(likeButton)
        let likeLabel = UILabel()
        likeLabel.text = "喜欢(21)"
        likeLabel.font = UIFont.systemFontOfSize(12)
        likeLabel.textColor = UIColor.whiteColor()
        likeLabel.sizeToFit()
        likeLabel.center = CGPointMake(40, resView.bounds.size.height / 2 + 14)
        resView.addSubview(likeLabel)
        
        let collectionButton = UIButton()
        collectionButton.setImage(UIImage(named: "star_white"), forState: .Normal)
        collectionButton.sizeToFit()
        collectionButton.center = CGPointMake(likeLabel.center.x + 70, resView.bounds.size.height / 2 - 8)
        resView.addSubview(collectionButton)
        let collectionLabel = UILabel()
        collectionLabel.text = "收藏(22)"
        collectionLabel.font = UIFont.systemFontOfSize(12)
        collectionLabel.textColor = UIColor.whiteColor()
        collectionLabel.sizeToFit()
        collectionLabel.center = CGPointMake(likeLabel.center.x + 70, resView.bounds.size.height / 2 + 14)
        resView.addSubview(collectionLabel)
        
        let circleView = UIButton(frame: CGRectMake(0,0,60,60))
        circleView.backgroundColor = UIColor(red: 0.992210, green: 0.3984, blue: 0.3047, alpha: 1)
        circleView.center = CGPointMake(resView.bounds.size.width / 2, resView.bounds.size.height / 2 - 14)
        circleView.layer.cornerRadius = circleView.bounds.size.width / 2
        let image = UIImageView(image: UIImage(named: "write_ending"))
        circleView.addSubview(image)
        image.center = CGPointMake(circleView.bounds.size.width / 2, circleView.bounds.size.height / 2)
        resView.addSubview(circleView)
        
        let shareButton = UIButton()
        shareButton.setImage(UIImage(named: "upload"), forState: .Normal)
        shareButton.sizeToFit()
        shareButton.center = CGPointMake(resView.bounds.size.width - 40, resView.bounds.size.height / 2 - 8)
        resView.addSubview(shareButton)
        let shareLabel = UILabel()
        shareLabel.text = "分享"
        shareLabel.font = UIFont.systemFontOfSize(12)
        shareLabel.textColor = UIColor.whiteColor()
        shareLabel.sizeToFit()
        shareLabel.center = CGPointMake(resView.bounds.size.width - 40, resView.bounds.size.height / 2 + 14)
        resView.addSubview(shareLabel)
        
        let reportButton = UIButton()
        reportButton.setImage(UIImage(named: "report"), forState: .Normal)
        reportButton.sizeToFit()
        reportButton.center = CGPointMake(shareLabel.center.x - 70, resView.bounds.size.height / 2 - 8)
        resView.addSubview(reportButton)
        let reportLabel = UILabel()
        reportLabel.text = "举报"
        reportLabel.font = UIFont.systemFontOfSize(12)
        reportLabel.textColor = UIColor.whiteColor()
        reportLabel.sizeToFit()
        reportLabel.center = CGPointMake(shareLabel.center.x - 70, resView.bounds.size.height / 2 + 14)
        resView.addSubview(reportLabel)
        
        resView.layer.opacity = 0
        return resView
    }()
    
    private var contentOffsetY: CGFloat = 0
    private var oldContentOffsetY: CGFloat = 0
    private var newContentOffsetY: CGFloat = 0
    private var originTextViewFrame: CGRect!
    private var isDown: Bool = false {
        didSet {
            if oldValue != isDown {
                isDown ? hideProfileView(true) : showProfileView()
            }
        }
    }
    
    func textView(textView: UITextView, shouldInteractWithTextAttachment textAttachment: NSTextAttachment, inRange characterRange: NSRange) -> Bool {
        return false
    }
    
    private func hideProfileView(animated: Bool) {
        if self.profileView.layer.opacity == 0 { return }
        if animated {
            UIView.animateWithDuration(0.2) {
                self.profileView.center = CGPointMake(self.profileView.center.x, self.profileView.center.y - self.profileView.bounds.height-20)
                self.profileView.layer.opacity = 0
            }
        } else {
            self.profileView.center = CGPointMake(self.profileView.center.x, self.profileView.center.y - self.profileView.bounds.height-20)
            self.profileView.layer.opacity = 0
        }
        originTextViewFrame = textView.frame
        self.textView.frame = CGRectMake(0, 20, self.textView.frame.width, self.textView.frame.height + self.textView.frame.origin.y - 20)
        self.textView.contentOffset = CGPointMake(self.textView.contentOffset.x, self.textView.contentOffset.y - (originTextViewFrame.origin.y - 20))
    }
    
    private func showProfileView() {
        if self.profileView.layer.opacity == 1 { return }
        UIView.animateWithDuration(0.2) {
            self.profileView.center = CGPointMake(self.profileView.center.x, self.profileView.center.y + self.profileView.bounds.height+20)
            self.profileView.layer.opacity = 1
        }
        self.textView.frame = self.originTextViewFrame
        self.textView.contentOffset = CGPointMake(self.textView.contentOffset.x, self.textView.contentOffset.y + (originTextViewFrame.origin.y - 20))
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(Constants.CellIdentifier)
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ChooseEndingCell", owner: nil, options: nil).last as? UITableViewCell
        }
        if let c = cell {
            let v = UIView(frame: c.frame)
            c.selectedBackgroundView = v
            v.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if isDisplayingTopView { return }
        dismissTopBottomNavView()
        contentOffsetY = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if isDisplayingTopView { return }
        newContentOffsetY = scrollView.contentOffset.y
        if newContentOffsetY > oldContentOffsetY && oldContentOffsetY > contentOffsetY {
            isDown = true
        } else if newContentOffsetY < oldContentOffsetY && oldContentOffsetY < contentOffsetY {
            isDown = false
        } else if scrollView.dragging {
            if scrollView.contentOffset.y - contentOffsetY > 100 {
                isDown = true
            } else if contentOffsetY - scrollView.contentOffset.y > 100 {
                isDown = false
            }
        }
    }
    
    //*******Only for debug usage********
    private func debugSteup() {
        writerProfileImageSrc = "Penguin"
        writerNickname = "师傅爱吃炒栗子"
        contentDate = NSDate()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = 15.0;
        paragraphStyle.firstLineHeadIndent = 15.0;
        paragraphStyle.tailIndent = -15.0;
        
        var str = "“莫奈花园”是野兽派花店的镇店之作。\r\n这缘于数月之前，顾客Y先生定花，希望能表现出莫奈名作《睡莲》的意境，可是当时并没有合适的花材进行创作，Y先生回信说，“美值得等待”，此后，竟不再催促。\n\n"

        let font = UIFont(name: "PingFang-SC-Regular", size: 15.0)!
        let result: NSMutableAttributedString = NSMutableAttributedString()
        
        result.appendAttributedString(AppUtils.getImageText("temp_1"))
        result.appendAttributedString(AppUtils.getLineBreakerText())
        result.appendAttributedString(AppUtils.attributedString(str, attributes: [NSForegroundColorAttributeName,NSFontAttributeName,NSParagraphStyleAttributeName], values: [UIColor.grayColor(),font,paragraphStyle], inRange: [NSMakeRange(0, str.characters.count), NSMakeRange(0, str.characters.count),NSMakeRange(0, str.characters.count)])!)

        result.appendAttributedString(AppUtils.getLineBreakerText())
        
        str = "上个月，店主兼花艺师Amber想起日本直岛的地中美术馆（Chichu　Museum）藏有《睡莲》，美术馆按照《睡莲》选择了150种植物，建成莫奈花园，一路开放在小径。Amber自此获得灵感，终觅得花材，做成“莫奈花园”。\n\n“它是向Y先生的致敬之作，是所有对美心存执念的普通人，心中的秘密花园，”Amber说，“Y先生特地寄来名贵红酒表示感谢，我亦感激他激发了灵感。”\n\n上海的野兽派花店创建于2011年12月初。当时，店主Amber一时兴起买花来弄，“去了花市才知道有这么多花材，买了很多，插起来送给朋友。朋友收到都吓一跳，说你这是什么流派？我说我是野兽派插花，乱插的。”野兽派的名字由来于此，事实上，野兽派也是曾在巴黎流行的现代绘画潮流，追求情感表达的表现主义。那之后，Amber在微博上注册了这家店，把平时送给朋友的花放了上去，“没想到真的有人订花，因此说，并无初衷，无心插柳”。\n\nAmber毕业于复旦新闻系，干了十年的媒体行当，之后辞职做起投资。她形容自己是，“狮子座，性格急躁，追求完美，不管不顾，嫌弃土人，吃得了苦但受不了委屈。”六岁起学画，目前仍从事当代艺术收藏，因此她说，“我的感觉并不来自花艺基本知识，而是来自对生活与情感的理解，对美的基本判断。”\n\n另一个受到追捧的作品是潮流之香（Trendy　Fragrance）花束。这款粉色的玫瑰花材由一位普通的年轻人育成，全球只有两家玫瑰园种植，野兽派愿意将“珍贵”作为自己的标签，“好像是穿越而来的平民少女，以坦白娇憨得宠”，Amber解释，难得的是，潮流之香的香味达到5度（玫瑰香味分为5等，5是最高等级），“以至于任何玫瑰香水在她面前都显得做作。”\n\n野兽派花店偏爱西洋花材，设计上则偏向巴黎比较流行的自然风格。“我喜欢优质、优雅的花朵，讨厌俗气与有廉价感的花。有时候，廉价感和价格并无关系。另外，我喜欢绿叶和果实，一些莫名的花材。”Amber说。花盒盛花是野兽派的独创，尽管目前只有日式插花使用花盒，但Amber觉得自己的风格与传统日式插花还是有很大不同，“我们的顾客大多是28至45岁之间的女性，或者是为这个年龄段女性买礼物的男性，他们一般都受过良好教育，多是典型的中产阶级。”Amber补充，“我们更讲究场景，也更注重送花人背后的故事。”"
        
        result.appendAttributedString(AppUtils.attributedString(str, attributes: [NSFontAttributeName,NSParagraphStyleAttributeName], values: [font,paragraphStyle], inRange: [NSMakeRange(0, str.characters.count),NSMakeRange(0, str.characters.count)])!)
        
        content = result
    }
    
    private func setup() {
        UIApplication.sharedApplication().statusBarStyle = .Default

        self.view.addSubview(self.topNavView)
        self.view.addSubview(self.bottomNavView)
        backButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugSteup()
        setup()
    }
}

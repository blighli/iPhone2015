//
//  PersonalInfoViewController.swift
//  The Ending
//
//  Created by Xin on 23/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class PersonalInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private struct Constants {
        static let CellIdentifier = "PersonalEndingCell"
        static let WordCountNumberFontColor: UIColor = UIColor(red: 0.8745, green: 0.25, blue: 0.25, alpha: 1)
        static let WordCountWordFontColor: UIColor = UIColor(red: 0.4922, green: 0.5, blue: 0.5859, alpha: 1)
    }
    
    @IBOutlet weak var startingButton: UIButton!
    @IBOutlet weak var endingButton: UIButton!
    @IBOutlet weak var personalImageView: UIImageView!
    @IBOutlet weak var personalName: UILabel!
    @IBOutlet weak var personalWritingCountLabel: UILabel!
    @IBOutlet weak var fansLabel: UILabel!
    @IBOutlet weak var attentionLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var personalInfo: PersonalInfo {
        get {
            let info = PersonalInfo()
            info.nickname = "小天"
            info.imageSrc = "Penguin"
            info.wordCount = 1201
            info.fanCount = 110
            info.attentionCount = 229
            return info
        }
    }
    
    var endingInfos: [WritingInfo] {
        get {
            var infos = [WritingInfo]()
            let info1 = WritingInfo()
            info1.date = NSDate()
            info1.content = "小猪说，那天啊，那天我只是路过来着，小熊硬塞的钱让我去买，小老虎又说如果我能买完再把糖放回去，冰淇淋机..."
            info1.likeCount = 16
            info1.collectionCount = 11
            let info2 = WritingInfo()
            info2.date = NSDate()
            info2.content = "我们静静地回忆着，SUNNY，她的笑，她的泪，她的一切，我们的一切。"
            info2.likeCount = 22
            info2.collectionCount = 13
            infos.append(info1)
            infos.append(info2)
            return infos
        }
    }
    
    var startingInfos: [WritingInfo] {
        get {
            var infos = [WritingInfo]()
            let info1 = WritingInfo()
            info1.date = NSDate()
            info1.content = "Amber毕业于复旦新闻系，干了十年的媒体行当，之后辞职做起投资。她形容自己是，“狮子座，性格急躁，追求完美，不管不顾，嫌弃土人，吃得了苦但受不了委屈。”六岁起学画画，后从事当代艺术收藏。因此她说，“我的感觉并不来自花艺基本知识，而是来自对生活与感情的理解，对美的基本判断”"
            info1.likeCount = 22
            info1.collectionCount = 33
            let info2 = WritingInfo()
            info2.date = NSDate()
            info2.content = "很久以前，渔夫和他的妻子住在海边的一所破房子里。有一次，渔夫去海边钓鱼。调到了一条大比目鱼。另他惊奇的是这条大鱼竟然会说话。原来他是中了魔法的王子。王子求渔夫放了他。渔夫答应了他。"
            info2.likeCount = 44
            info2.collectionCount = 55
            infos.append(info1)
            infos.append(info2)
            return infos
        }
    }
    
    private var isEnding: Bool = true {
        didSet {
            if isEnding != oldValue {
                flipPage()
            }
            self.startingButton.setTitleColor(!isEnding ? UIColor.orangeColor() : UIColor.whiteColor(), forState: .Normal)
            self.endingButton.setTitleColor(isEnding ? UIColor.orangeColor() : UIColor.whiteColor(), forState: .Normal)
        }
    }
    
    private func flipPage() {
        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: !isEnding ? .Left : .Right)
    }
    
    private func updateUI() {
        personalImageView.image = UIImage(named: personalInfo.imageSrc)
        personalName.text = personalInfo.nickname
        let attributedWrtingCountLabelText = NSMutableAttributedString(string: "写了\(personalInfo.wordCount)字")
        attributedWrtingCountLabelText.addAttribute(NSForegroundColorAttributeName, value:Constants.WordCountNumberFontColor, range: NSMakeRange(2,attributedWrtingCountLabelText.length - 3))
        attributedWrtingCountLabelText.addAttribute(NSForegroundColorAttributeName, value:Constants.WordCountWordFontColor, range: NSMakeRange(0,2))
        attributedWrtingCountLabelText.addAttribute(NSForegroundColorAttributeName, value:Constants.WordCountWordFontColor, range: NSMakeRange(attributedWrtingCountLabelText.length - 1,1))
        personalWritingCountLabel.attributedText = attributedWrtingCountLabelText
        fansLabel.text = "\(personalInfo.fanCount)粉丝"
        attentionLabel.text = "\(personalInfo.attentionCount)关注"
    }
    
    private func steup() {
        updateUI()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        let startingButtonSignal = startingButton.rac_signalForControlEvents(.TouchUpInside)
        let endingButtonSignal = endingButton.rac_signalForControlEvents(.TouchUpInside)
        startingButtonSignal.subscribeNext {x in
            self.isEnding = false
        }
        endingButtonSignal.subscribeNext {x in
            self.isEnding = true
        }
        backButton.rac_signalForControlEvents(.TouchUpInside).subscribeNext {x in
            self.navigationController?.popViewControllerAnimated(true)
        }

        isEnding = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        steup()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isEnding ? endingInfos : startingInfos).count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.CellIdentifier, forIndexPath: indexPath) as! PersonalEndingCell
        let info = isEnding ? endingInfos[indexPath.row] : startingInfos[indexPath.row]
        cell.personalImageView.image = UIImage(named: personalInfo.imageSrc)
        cell.personalImageName.text = personalInfo.nickname
        cell.dateLabel.text = AppUtils.getDateString(info.date)
        let attributedContentText = NSMutableAttributedString(string: info.content)
        let font = UIFont(name: "PingFang SC", size: 14.0)
        attributedContentText.addAttribute(NSFontAttributeName, value: font!, range: NSMakeRange(0, attributedContentText.length))
        cell.content.attributedText = attributedContentText
        cell.like.text = "\(info.likeCount)"
        cell.collection.text = "\(info.collectionCount)"
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

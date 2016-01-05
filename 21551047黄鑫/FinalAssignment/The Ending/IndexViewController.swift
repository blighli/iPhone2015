//
//  IndexViewController.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class IndexViewController: MasterDetailViewController,StoryOverlapViewDataSource,StoryOverlapViewDelegate {
    
    private struct Constants {
        static let PersonalSegue = "personalSegue"
        static let ContentSegue = "contentSegue"
    }
    
    // MARK: - Outlets
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var overlapView: StoryOverlapView! {
        didSet {
            overlapView.dataSource = self
            overlapView.delegate = self
            overlapView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "handlePanGesture:"))
            overlapView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "handleOverlayTapGesture:"))
        }
    }
    @IBOutlet weak var pageLabel: UILabel!

    // MARK: - Varibles
    private var testStoryLines: [CardInfo]! {
        get {
            var stories = [CardInfo]()
            for var i = 0; i < 5; i++ {
                let info = CardInfo()
                info.story = "过年回家，母亲就为他张罗着相亲。\n\n毕业三年了，这是他第三次相亲。双方见面后，家长都很满意，母亲一个劲地夸女方，说他们有多般配...毕业三年了，这是他第三次相亲，家长都很满意，母亲一个劲地夸女方，说他们有多般配..."
                info.imageSrc = "temp_\(i % 2 + 1)"
                info.seeCount = i + 100
                info.writerNickname = "师傅爱吃炒栗子"
                info.writerImageSrc = "Penguin"
                stories.append(info)
            }
            return stories
        }
    }
    private var gestureTranslation: CGPoint = CGPointZero
    
    // MARK: - Controller Lifecycle & Setups
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.profileButton.rac_signalForControlEvents(.TouchUpInside)
            .subscribeNext {_ in
                self.slide(true)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    // MARK: - Gesture handler
    func handlePanGesture(gesture: UIPanGestureRecognizer) {
        if gesture.state == .Began {
            gestureTranslation = gesture.translationInView(overlapView)
        } else if gesture.state == .Changed {
            let translation = gesture.translationInView(overlapView)
            gestureTranslation = translation
            gesture.setTranslation(CGPointZero, inView: overlapView)
        } else if gesture.state == .Ended {
            overlapView.restorePosition()
        }
        overlapView.setNeedsDisplay()
    }
    
    func handleOverlayTapGesture(gesture: UITapGestureRecognizer) {
        performSegueWithIdentifier(Constants.ContentSegue, sender: self)
    }
    
    // MARK: - Master Detail Controller handler
    override func detailControllerIdentifierName() -> String {
        return "PersonalScene"
    }
    
    // MARK: - StoryOverlapView Protocols Implementation
    func getCurrentPageForOverlapView(currentPage: Int) {
        self.pageLabel.text = "\(currentPage+1)/\(testStoryLines.count)"
    }
    
    func translationXForOverlapView(sender: StoryOverlapView) -> CGFloat {
        return gestureTranslation.x
    }
    
    func cardInfoForOverlapView(sender: StoryOverlapView) -> [CardInfo] {
        return testStoryLines
    }
}

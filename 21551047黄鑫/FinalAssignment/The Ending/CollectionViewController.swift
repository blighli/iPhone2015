//
//  CollectionViewController.swift
//  The Ending
//
//  Created by Xin on 21/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private struct Constants {
        static let CellIdentifier = "StoryCollectionCell"
        static let TransitionTime: NSTimeInterval = 0.5
    }
    var collections: [CardInfo]! {
        get {
            var stories = [CardInfo]()
            for var i = 0; i < 4; i++ {
                let info = CardInfo()
                info.story = "过年回家，母亲就为他张罗着相亲。\n\n毕业三年了，这是他第三次相亲。双方见面后，家长都很满意，母亲一个劲地夸女方，说他们有多般配...毕业三年了，这是他第三次相亲，家长都很满意，母亲一个劲地夸女方，说他们有多般配..."
                info.imageSrc = "temp_\(i % 2 + 1)"
                info.seeCount = i + 100
                stories.append(info)
            }
            return stories
        }
    }
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var collectionButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        closeButton.rac_signalForControlEvents(.TouchUpInside)
            .subscribeNext { _ in
                let transition = CATransition()
                transition.type = "fade"
//                transition.subtype = "fromBottom"
                transition.duration = 0.4
                transition.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
                self.navigationController?.view.layer.addAnimation(transition, forKey: "someAnimation")
                self.navigationController?.popViewControllerAnimated(false)
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.CellIdentifier, forIndexPath: indexPath) as! StoryCollectionCVC
        let collection = collections[indexPath.row]
        cell.collectionImage.image = UIImage(named: collection.imageSrc)
        cell.collectionStoryBrief.text = collection.story
        return cell;
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collections.count
    }
    
    private func animateCollectionView() {
        collectionView.alpha = 1
        let originCenter = collectionView.center
        collectionView.center = CGPointMake(self.collectionView.center.x, self.view.bounds.size.height * 3 / 2)
        UIView.animateWithDuration(Constants.TransitionTime, animations: {
            self.collectionView.center = originCenter
            }, completion: {finished in
                
        })
    }
    
    private func animateFellingLabel() {
        feelingLabel.alpha = 1
        let originCenter = feelingLabel.center
        feelingLabel.center = CGPointMake(self.feelingLabel.center.x, self.view.bounds.size.height)
        UIView.animateWithDuration(Constants.TransitionTime, animations: {
            self.feelingLabel.center = originCenter
            }, completion: {finished in
               self.animateCollectionView()
        })
    }
    
    private func animateCollectionLabel() {
        collectionLabel.alpha = 1
        let originCenter = collectionLabel.center
        collectionLabel.center = CGPointMake(self.collectionLabel.center.x, self.view.bounds.size.height)
        UIView.animateWithDuration(Constants.TransitionTime, animations: {
                self.collectionLabel.center = originCenter
            }, completion: {finished in
                self.animateFellingLabel()
        })
    }
    
    private func animateCloseButton() {
        UIView.animateWithDuration(Constants.TransitionTime, animations: {
            self.closeButton.alpha = 1
            }, completion: {finished in
                self.animateFellingLabel()
        })
    }
    
    func steupViews() {
        animateCollectionLabel()
        animateCloseButton()
    }
}

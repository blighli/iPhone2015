//
//  StoryOverlapView.swift
//  The Ending
//
//  Created by Xin on 20/12/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

import UIKit

protocol StoryOverlapViewDataSource: class { //The only function of this protocol is get data.
    func cardInfoForOverlapView(sender: StoryOverlapView) -> [CardInfo]
    func translationXForOverlapView(sender: StoryOverlapView) -> CGFloat
}

protocol StoryOverlapViewDelegate: class { //The only function of this protocol is get data.
    func getCurrentPageForOverlapView(currentPage: Int)
}

public class StoryOverlapView: UIView {
    
    private struct Constants {
        static let CardViewMarginHorizon: CGFloat = 30.0
        static let CardViewMarginVertical: CGFloat = 20.0
        static let CardViewTranslationOpacityOffset: CGFloat = 60.0
        static let CardViewRightTranslationOffset: CGFloat = 50.0
    }

    weak var dataSource: StoryOverlapViewDataSource?
    weak var delegate: StoryOverlapViewDelegate?
    
    private var currentPage: Int = 0
    private var isTransforming: Bool = false
    private var cardViews: [StoryCardView]! = []

    private func getPresentView() -> UIView? {
        if cardViews.count > currentPage {
            return cardViews[currentPage]
        }
        return nil
    }
    
    private func getCurrentDegree(view: UIView!) -> CGFloat {
        return 1 - (self.bounds.size.width-view.frame.origin.x)/self.bounds.size.width
    }
    
    private func isLastPage() -> Bool {
        return currentPage == cardViews.count - 1
    }
    
    private func updatePresentView() {
        let presentViewOp = getPresentView()
        if presentViewOp == nil || isTransforming { return }
        let presentView = presentViewOp!
        presentView.center = CGPointMake(presentView.center.x + (self.dataSource?.translationXForOverlapView(self))!, presentView.center.y)
    }
    
    private func updateOverlayViews() {
        if cardViews.count < 3 {
            return
        }
        for var i = currentPage + 2; i < 5 && i < cardViews.count; i++ {
            let overlayView = cardViews[i]
            let cur = i - 2
            overlayView.view.frame =
                CGRectMake(overlayView.view.frame.origin.x - 14, overlayView.view.frame.origin.y + 7,
                overlayView.view.frame.size.width + 28,
                overlayView.view.frame.size.height)
            overlayView.layer.opacity = i == currentPage + 2 ? 1 : 0.6 - 0.15 * Float(cur - currentPage - 1)
            overlayView.story.layer.opacity = i == self.currentPage + 2 ? 1 : 0
            overlayView.storyImage.layer.opacity = i == self.currentPage + 2 ? 1 : 0
        }
    }
    
    private func updateSecondOverlayViewFrame() {
        if cardViews.count < currentPage + 3 { return }
        let overlayView = self.cardViews[self.currentPage + 2]
        overlayView.frame =
            CGRectMake(Constants.CardViewMarginHorizon, Constants.CardViewMarginVertical,
            self.frame.size.width - Constants.CardViewMarginHorizon * 2,
            self.frame.size.height - Constants.CardViewMarginVertical)
    }
    
    public override func setNeedsDisplay() {
        super.setNeedsDisplay()
        updatePresentView()
    }
    
    private func buildFrontViewWithIndex(index: Int) {
        cardViews[index].frame = CGRectMake(Constants.CardViewMarginHorizon, Constants.CardViewMarginVertical,
            self.frame.size.width - Constants.CardViewMarginHorizon * 2, self.frame.size.height - Constants.CardViewMarginVertical)

        addSubview(cardViews[index])
    }
    
    private func  buildPresentView() {
        for var i = 1; i >= 0; i-- {
            buildFrontViewWithIndex(i)
        }
    }
    
    private func buildOverlayViews() {
        for var i = min(5, cardViews.count) - 1; i >= 2; i-- {
            let cur = i - 1
            cardViews[i].frame = CGRectMake(Constants.CardViewMarginHorizon + CGFloat(14 * cur),
                Constants.CardViewMarginVertical - CGFloat(7 * cur),
                self.frame.size.width - Constants.CardViewMarginHorizon * 2 - CGFloat(28 * cur),
                self.frame.size.height - Constants.CardViewMarginVertical)
            cardViews[i].layer.opacity = 0.6 - 0.15 * Float(cur)
            cardViews[i].story.layer.opacity = 0
            cardViews[i].storyImage.layer.opacity = 0
    
            addSubview(cardViews[i])
        }

    }
    
    private func buildCardViews() {
        buildOverlayViews()
        buildPresentView()
    }
    
    public override func awakeFromNib() {
        if let storyInfos = self.dataSource?.cardInfoForOverlapView(self) {
            for var i = 0; i < 5 && i < storyInfos.count; i++ {
                cardViews.append(NSBundle.mainBundle().loadNibNamed("StoryCardView", owner: self, options: nil).last as! StoryCardView)
            }
            for var i = 0; i < storyInfos.count; i++ {
                cardViews[i].setup(storyInfos[i])
            }

        }
        buildCardViews()
    }
    
    public func restorePosition() {
        let presentViewOptinal = getPresentView()
        if presentViewOptinal == nil {
            return;
        }
        let presentView = presentViewOptinal!
        if (getCurrentDegree(presentView) <= 0.6 || isLastPage()) {
            UIView.animateWithDuration(0.3, delay: 0, options:UIViewAnimationOptions.AllowAnimatedContent, animations: {
                    presentView.frame = CGRectMake(Constants.CardViewMarginHorizon, Constants.CardViewMarginVertical, self.frame.size.width - Constants.CardViewMarginHorizon * 2,
                    self.frame.size.height - Constants.CardViewMarginVertical)
                    presentView.layer.opacity = 1
                    self.isTransforming = true
                }, completion: { finished in
                    self.isTransforming = false
                })
        } else {
            UIView.animateWithDuration(0.3, animations: {
                    presentView.center = CGPointMake(presentView.center.x+presentView.frame.size.width/2 - Constants.CardViewRightTranslationOffset, presentView.center.y);
                    presentView.layer.opacity = 0;
                    self.updateOverlayViews()
                    self.isTransforming = true
                }, completion: { finished in
                    self.updateSecondOverlayViewFrame()
                    self.isTransforming = false
                    self.currentPage++
                    [self.delegate?.getCurrentPageForOverlapView(self.currentPage)]
            })
        }
    }
}

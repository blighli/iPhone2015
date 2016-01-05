//
//  YXQWaterFall.h
//  PoseCamera
//
//  Created by YXQ on 15/12/28.
//  Copyright © 2015年 YXQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"
#import "YXQConstant.h"

@interface YXQWaterFall : UIViewController <UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (nonatomic, assign) enum tabTitles tabTitle;
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
- (void)setCellSizes:(NSArray *)sizes;
- (void)setCellContents:(NSArray *)contents;

@end

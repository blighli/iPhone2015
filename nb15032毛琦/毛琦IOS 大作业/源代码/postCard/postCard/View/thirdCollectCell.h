//
//  thirdCollectCell.h
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PostModel;

@interface thirdCollectCell : UICollectionViewCell
@property (nonatomic, strong)UIImageView *borderimage;
@property (nonatomic, strong)UIImageView *picimage;
@property (nonatomic, strong)UIImageView *photo;

@property (nonatomic, strong)PostModel *model;

@end

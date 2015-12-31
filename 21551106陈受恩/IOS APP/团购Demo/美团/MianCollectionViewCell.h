//
//  MianCollectionViewCell.h
//  美团
//
//  Created by 陈受恩 on 15/12/14.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class deal_Model;

@interface MianCollectionViewCell : UICollectionViewCell

-(void)showUIWithModel:(deal_Model*)model;

@end

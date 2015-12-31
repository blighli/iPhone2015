//
//  detailViewController.h
//  美团
//
//  Created by 陈受恩 on 15/12/17.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class deal_Model;

@interface detailViewController : UIViewController
@property(strong,nonatomic)deal_Model *md;//这是商品详情模型
-(void)showLabelWithModel:(deal_Model*)model;

@end

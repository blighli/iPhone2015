//
//  NoteViewController.h
//  postCard
//
//  Created by 毛毛 on 15/12/15.
//  Copyright (c) 2015年 毛毛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BaseViewController.h"
@class PostModel;

@interface NoteViewController : BaseViewController

@property (strong, nonatomic)NSString *pic;
@property (nonatomic, strong)UIImageView *borderimage;
@property (nonatomic, strong)UIImageView *picimage;

@property (nonatomic ,strong) UIScrollView *scroll;
@property (nonatomic, strong) UIImageView *bigimage;
@property (nonatomic, strong) UITextField *text;
@property (nonatomic, strong) UILabel *loclabel;

@property (nonatomic, strong) NSString *HasValue;
@property (nonatomic, strong) PostModel *model;

@property (nonatomic,strong) CLLocationManager *locateManager;
@property (nonatomic,strong) NSString *JW;
@property (nonatomic,strong) UIAlertView *savealert;

- (void)getPic :(NSString *)str;
- (void)getModel:(PostModel *)model;

@end

//
//  AnswerViewController.h
//  DriveTestHelper
//
//  Created by wp on 15/12/17.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController
@property(nonatomic,assign) int chapterNumber;
@property(nonatomic,copy) NSString *subStrNumber;
//type=1 章节；type=2 顺序；type=3 随机； type=4 专项; type=5 模拟;type=6 我的错题
//type=7 我的收藏
@property(nonatomic,assign) int type;
@property(nonatomic,copy) NSString *viewTitle;
@end

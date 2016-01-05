//
//  AnswerTableViewCell.h
//  DriveTestHelper
//
//  Created by wp on 15/12/17.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *resultImage;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

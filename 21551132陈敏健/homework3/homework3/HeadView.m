//
//  HeadView.m
//  homework3
//
//  Created by 敏少eclipse on 15/11/1.
//  Copyright © 2015年 敏少eclipse. All rights reserved.
//

#import "HeadView.h"

@interface HeadView()
@property (weak, nonatomic) IBOutlet UITextField *tf_title;

- (IBAction)bt_add:(UIButton *)sender;
@end

@implementation HeadView

+(instancetype)headView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"HeadView" owner:nil options:nil] lastObject];
}

- (IBAction)bt_add:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(headViewDidClickedAddBtn:)]) {
        [self.delegate headViewDidClickedAddBtn:self.tf_title.text];
    }
}
@end

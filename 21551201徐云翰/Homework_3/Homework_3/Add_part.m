//
//  Add_part.m
//  Homework_3
//
//  Created by YunhanXu on 15/11/1.
//  Copyright © 2015年 YunhanXu. All rights reserved.
//

#import "Add_part.h"

@interface Add_part()
@property (weak, nonatomic) IBOutlet UITextField *tf_title;
- (IBAction)btn_add:(UIButton*)sender;
@end

@implementation Add_part

+(instancetype)add_part
{
    return [[[NSBundle mainBundle] loadNibNamed:@"Add_part" owner:nil options:nil] lastObject];
}

- (IBAction)btn_add:(UIButton*)sender
{
    if ([self.delegate respondsToSelector:@selector(addPartDidClickedAddBtn:)])
    {
        [self.delegate addPartDidClickedAddBtn:self.tf_title.text];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

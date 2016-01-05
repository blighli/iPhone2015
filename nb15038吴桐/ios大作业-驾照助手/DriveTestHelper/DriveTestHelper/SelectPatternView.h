//
//  SelectPatternView.h
//  DriveTestHelper
//
//  Created by wp on 15/12/22.
//  Copyright © 2015年 wt. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    testPattern,
    lookingPattern
}SelectPattern;
typedef void (^SelectTouch)(SelectPattern pattern);
@interface SelectPatternView : UIView
@property(nonatomic,assign) SelectPattern pattern;
-(SelectPatternView *)initWithFrame:(CGRect)frame addTouch:(SelectTouch)touch;
@end

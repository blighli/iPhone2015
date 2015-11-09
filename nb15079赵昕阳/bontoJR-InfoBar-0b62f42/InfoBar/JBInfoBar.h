//
//  JBInfoBar.h
//  InfoBar
//
//  Created by Junior B. on 20.02.11.
//  Copyright 2011 ThinkDiff.ch. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface JBInfoBar : UIView {
    CGPoint hiddenCP;
    CGPoint showCP;
    
    BOOL isHidden;
    
    UILabel *infoLabel;
}

@property (readonly,assign) BOOL isHidden;

- (void)showBarWithMessage:(NSString *)message;
- (void)hideBarWithMessage:(NSString *)message;
- (void)setMessage:(NSString *)message;

@end

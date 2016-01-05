//
//  AutoScrollLabel.h
//  AutoScrollLabel
//
//  Created by Brian Stormont on 10/21/09.
//  Copyright 2009 Stormy Productions. All rights reserved.
//
//  Permission is granted to use this code free of charge for any project.
//

#import <UIKit/UIKit.h>

@interface AutoScrollLabel : UIScrollView
{
    NSString *_text;
}


-(NSString *)text;

-(void)setText:(NSString *)text;

@end

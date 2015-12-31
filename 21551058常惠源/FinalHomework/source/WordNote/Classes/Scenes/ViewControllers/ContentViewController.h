//
//  ContentViewController.h
//  WordNote
//
//  Created by 常惠源 on 12/29/15.
//  Copyright © 2015 ZJU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Content.h"
#import "CustomFile.h"
@interface ContentViewController : UIViewController
@property (nonatomic, strong)Content *content;

@property (nonatomic, strong)CustomFile *customFile;
@end

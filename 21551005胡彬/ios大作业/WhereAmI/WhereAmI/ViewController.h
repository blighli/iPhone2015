//
//  ViewController.h
//  WhereAmI
//
//  Created by cstlab on 15/12/29.
//  Copyright © 2015年 hubin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;
@class FlipsideViewController;
@interface ViewController : UIViewController{
    
    IBOutlet UIButton *infoButton;
    MainViewController *mainViewController;
    FlipsideViewController *flipsideViewController;
    UINavigationBar *flipsideNavigationBar;
}

@property (nonatomic, retain) UIButton *infoButton;
@property (nonatomic, retain) MainViewController *mainViewController;
@property (nonatomic, retain) UINavigationBar *flipsideNavigationBar;
@property (nonatomic, retain) FlipsideViewController *flipsideViewController;

- (IBAction)toggleView;


@end


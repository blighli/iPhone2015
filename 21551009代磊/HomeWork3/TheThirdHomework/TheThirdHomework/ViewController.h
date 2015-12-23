//
//  ViewController.h
//  TheThirdHomework
//
//  Created by TooWalker on 10/23/15.
//  Copyright © 2015 TooWalker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UIButton *taskButton;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end


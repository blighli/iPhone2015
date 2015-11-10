//
//  ViewController.h
//  myiTahDoodle
//
//  Created by 陈受恩 on 15/10/31.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *taskField;
@property (weak, nonatomic) IBOutlet UIButton *taskButton;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end


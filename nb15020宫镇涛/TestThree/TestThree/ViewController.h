//
//  ViewController.h
//  TestThree
//
//  Created by gongzhentao on 15/11/1.
//  Copyright © 2015年 gongzhentao. All rights reserved.
//

#import <UIKit/UIKit.h>\

NSString *docPath(void);

@interface ViewController : UIViewController {
    UITableView *taskTable;
    UITextField *taskField;
    UIButton *insertButton;
    NSMutableArray *tasks;
}
-(void)addTask: (id)sender;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end


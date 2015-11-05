//
//  Data.m
//  Third_Homework
//
//  Created by zhuzhu on 15/11/3.
//  Copyright © 2015年 zhuzhu. All rights reserved.
//

#import "Data.h"

@interface Data ()
- (void)setTasksWithPlist:(NSArray *)plist;
@end

@implementation Data
@synthesize tasks;

NSString *docPath() {
        NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        return [[pathList objectAtIndex:0]stringByAppendingPathComponent:@"tasks.plist"];
}

-(instancetype)init {
        self = [super init];
        if (self) {
                NSArray *plist = [NSArray arrayWithContentsOfFile:docPath()];
                [self setTasksWithPlist:plist];
            }
        return self;
}

- (void)setTasksWithPlist:(NSArray *)plist {
       if (plist) {
                tasks = [plist mutableCopy];
            } else {
                    tasks = [[NSMutableArray alloc] init];
                }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [tasks count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                    reuseIdentifier:@"cell"];
            }
     cell.textLabel.text = tasks[[indexPath row]];
        return cell;
    
}

-(void)saveData:(NSNotification *)notification {
        [[tasks copy] writeToFile:docPath() atomically:YES];
}


@end

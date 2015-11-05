//
//  DataModel.m
//  TaskList
//
//  Created by wp on 15/10/29.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "DataModel.h"

@interface DataModel ()
- (void)setTasksWithPlist:(NSArray *)plist;
@end

@implementation DataModel
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

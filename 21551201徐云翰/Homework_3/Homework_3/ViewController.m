//
//  ViewController.m
//  Homework_3
//
//  Created by YunhanXu on 15/11/1.
//  Copyright © 2015年 YunhanXu. All rights reserved.
//

#import "ViewController.h"
#import "Add_part.h"
#import "Term.h"
@interface ViewController ()<HeadViewDelegate>
@property (nonatomic,strong) NSMutableArray* terms;

@end

@implementation ViewController


-(NSMutableArray*) terms
{
    if (_terms == nil)
    {
        NSString* homeDir = NSHomeDirectory();
        NSString* docDir = [homeDir stringByAppendingPathComponent:@"Documents"];
        NSString* fileDir = [docDir stringByAppendingPathComponent:@"term.plist"];
        NSArray* array = [NSArray arrayWithContentsOfFile:fileDir];
        NSMutableArray* tmp = [NSMutableArray array];
        for (NSDictionary* v in array)
        {
            Term* term = [Term addWithDict:v];
            [tmp addObject:term];
        }
        _terms = tmp;
    }
    return _terms;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Add_part* add = [Add_part add_part];
    add.delegate = self;
    self.tableView.tableHeaderView = add;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"Setting";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    Term* term = self.terms[indexPath.row];
    [cell.textLabel setText:term.inputString];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.terms.count;
}

-(void)addPartDidClickedAddBtn:(NSString *)str
{
    Term* b = [[Term alloc] init];
    b.inputString = str;
    [self.terms addObject:b];
    [self.tableView reloadData];
    
    NSMutableArray *tmp = [NSMutableArray array];
    for (Term * t in self.terms) {
        [tmp addObject:[t getDictionary]];
    }
    [self saveArray:tmp];
    
}

- (void)saveArray:(NSMutableArray *)array
{
    NSString *homeDir = NSHomeDirectory();
    NSString *docDir = [homeDir stringByAppendingPathComponent:@"Documents"];
    NSString *fileDir = [docDir stringByAppendingPathComponent:@"term.plist"];
   // NSLog(fileDir);
    [array writeToFile:fileDir atomically:YES];
}
@end

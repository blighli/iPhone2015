//
//  STHelpViewController.m
//  ItcastLottery01
//
//  Created by 123 on 15/11/29.
//  Copyright © 2015年 HST. All rights reserved.
//

#import "STHelpViewController.h"
#import "STSettingArrowItem.h"
#import "STSettingGroup.h"
#import "STHtmlViewController.h"
#import "STNavigationController.h"
#import "STHtml.h"

@interface STHelpViewController ()

@property(nonatomic,strong)NSArray *htmls;

@end

@implementation STHelpViewController

-(NSArray *)htmls
{
    if (_htmls==nil) {
        //JSON文件的路径
        NSString *path=[[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
        
        //加载JSON文件
        NSData *data=[NSData dataWithContentsOfFile:path];
        
        //将JSON数据转换为NSArray或者NSDictionary
        NSArray *dictArray=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        //将字典转成模型
        NSMutableArray *htmlArray=[NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            STHtml *html=[STHtml htmlWithDict:dict];
            [htmlArray addObject:html];
        }
        
        _htmls=htmlArray;
    }
    return _htmls;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //1.创建所有的item
    NSMutableArray *items=[NSMutableArray array];
    
    for (STHtml *html in self.htmls) {
        
        STSettingItem *item=[STSettingArrowItem itemWithTitle:html.title destVcClass:nil];
        [items addObject:item];
    }
    
    //2.创建组
    STSettingGroup *group=[[STSettingGroup alloc]init];
    group.items=items;
    [self.data addObject:group];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    STHtmlViewController *htmlVc=[[STHtmlViewController alloc]init];
    htmlVc.html=self.htmls[indexPath.row];
    STNavigationController *nav=[[STNavigationController alloc]initWithRootViewController:htmlVc];
    
    [self presentViewController:nav animated:YES completion:nil];
}
@end

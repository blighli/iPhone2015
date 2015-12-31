//
//  secondPopViewController.m
//  美团
//
//  Created by 陈受恩 on 15/12/10.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "secondPopViewController.h"
#import "changeCityViewController.h"
#import "MyNavController.h"
#import "popview.h"
#import "CategoryModel.h"
#import "UIView+Extension.h"
#import "UIBarButtonItem+ZYExtension.h"
#import "UIView+Extension.h"
#import "Region.h"
#import "MJExtension/MJExtension.h"



//@interface secondPopViewController ()<HomeDropdownDataSource, HomeDropdownDelegate>
@interface secondPopViewController()<MyPopviewDataSource,MyPopviewDelegate>
- (IBAction)changeCItyClick:(id)sender;

@end

@implementation secondPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    popview *pop = [popview makePopView];
    pop.dataSource=self;
    pop.delegate=self;
    UIView *title = [self.view.subviews firstObject];
        pop.y = title.height;
    [self.view addSubview:pop];
    pop.categoryArr=self.regions;
    pop.autoresizingMask=UIViewAutoresizingNone;
    self.preferredContentSize=CGSizeMake(pop.frame.size.width, pop.frame.size.height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeCItyClick:(id)sender {
    /**
     *  注意，应当先让它自己注销掉，再从主窗口presentViewController，一个窗口，只能present一个ViewController
     */
    [self dismissViewControllerAnimated:YES completion:nil];
    changeCityViewController *cvc=[[changeCityViewController alloc]initWithNibName:@"changeCityViewController" bundle:nil];
    MyNavController *nav=[[MyNavController alloc]initWithRootViewController:cvc];
    nav.modalPresentationStyle=UIModalPresentationFormSheet;
    //[self presentViewController:nav animated:YES completion:nil];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
}


#pragma mark ----MyPopviewDataSource
//制定协议方法
//left tableview 行数
-(NSInteger)numberOfRowsInLeftTable:(popview *)popview{
     return self.regions.count;
}
//left 标题
-(NSString *)popview:(popview *)popview titleForRow:(NSInteger)row{
    //NSLog(@"%@+name",[self.regions[row] name]);
    return [self.regions[row] name];
    //return self.regions[row];
}
//left 子数据
-(NSArray *)popview:(popview *)popview subDataForRow:(NSInteger)row{
//    NSLog(@"4");
//    NSLog(@"%@",self.regions[row]);
//    NSLog(@"5");
//    NSLog(@"%@",[self.regions[row] name]);
//    NSLog(@"6");
//    NSLog(@"%@",[self.regions[row] subregions]);
//    NSLog(@"7");
   return [self.regions[row] subregions];
   // return self.regions[row];
}
#pragma mark ----MyPopviewDelegate
//选择左侧表时调用
-(void)popview:(popview *)popview didSelectRowAtLeftTable:(NSUInteger)row{
   
        //NSLog(@"zuobian");
        Region *region = self.regions[row];
        if (region.subregions == 0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"regionDidChanged" object:nil userInfo:@{@"regionName" : region}];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    
}
//选择右侧表时调用
-(void)popview:(popview *)popview didSelectRowAtRightTable:(NSUInteger)subRow mainRow:(int)mainRow{
    //NSLog(@"youbian2");
    Region *region = self.regions[mainRow];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"regionDidChanged" object:nil userInfo:@{@"regionName" : region, @"subRegionName": region.subregions[subRow]}];
    // NSLog(@"%@+++%@",region,region.subregions[subRow]);
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

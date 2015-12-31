//
//  Cities.m
//  美团
//
//  Created by 陈受恩 on 15/12/13.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "Cities.h"
#import "Region.h"
#import "MJExtension.h"
#import "Sort.h"
static NSArray *_cities;
static NSArray *_sorts;
@implementation Cities
/**
 *  返回城市
 */
+ (NSArray *)cities
{
    if (_cities == nil) {
        _cities = [Cities objectArrayWithFilename:@"cities.plist"];
    }
    return _cities;
}
/**
 *  返回所有的排序数据
 */
+ (NSArray *)sorts
{
    if (_sorts == nil) {
        _sorts = [Sort objectArrayWithFilename:@"sorts.plist"];
    }
    return _sorts;
}


+ (NSDictionary *)objectClassInArray
{
    return @{
             @"regions" : [Region class]
             };
}

+(NSArray *)getCities{
    //NSLog(@"2");
    //1.加载plist文件nil
    NSString *path=[[NSBundle mainBundle]pathForResource:@"cities.plist" ofType:nil];
    //NSLog(@"3");
    //2.加载plist 文件为数组
    NSArray *plistArray= [NSArray arrayWithContentsOfFile:path];
    //NSLog(@"%@",plistArray);
    //NSLog(@"4");
    //3.遍历数组，字典转model
    NSMutableArray *modelArray=[[NSMutableArray alloc]init];
    //NSLog(@"5");
    for(NSDictionary *dict in plistArray){
      //  NSLog(@"6");
        Cities *cityModel=[[Cities alloc]init];
        cityModel.name=[dict objectForKey:@"name"];
        cityModel.pinYin=[dict objectForKey:@"pinYin"];
        cityModel.pinYinHead=[dict objectForKey:@"pinYinHead"];
        cityModel.regions=[dict objectForKey:@"regions"];
        [modelArray addObject:cityModel];
        //NSLog(@"7");
        //NSLog(@"%@~~~~~",cityModel);
    }
   // NSLog(@"8");
    return modelArray ;
}

@end

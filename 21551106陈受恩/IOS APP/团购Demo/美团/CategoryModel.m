//
//  CategoryModel.m
//  美团
//
//  Created by 陈受恩 on 15/12/10.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel
//加载plist文件
-(NSArray *)loadPlistData{
    NSString *file=[[NSBundle mainBundle]pathForResource:@"categories.plist" ofType:nil];
    NSArray *plistArray=[NSArray arrayWithContentsOfFile:file];
    NSArray *dataArray=[self getDataWithArray:plistArray];
    return dataArray;
}
//字典转模型
-(CategoryModel*)makeModelWithDictionary:(NSDictionary *)dict{
    self.highlighted_icon=[dict objectForKey:@"highlighted_icon"];
    self.small_highlighted_icon=[dict objectForKey:@"small_highlighted_icon"];
    self.icon=[dict objectForKey:@"icon"];
    self.small_icon=[dict objectForKey:@"small_icon"];
    self.name=[dict objectForKey:@"name"];
    self.subcategories=[dict objectForKey:@"subcategories"];
    return self;
}
//解析Data
-(NSArray*)getDataWithArray:(NSArray*)array{
    NSMutableArray *Array=[[NSMutableArray alloc]init];
    for (NSDictionary *dict in array) {
        CategoryModel *md=[[CategoryModel alloc]init];
        [md makeModelWithDictionary:dict];
        [Array addObject:md];
    }
    return Array;
}

@end

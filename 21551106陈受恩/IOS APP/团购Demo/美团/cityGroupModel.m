//
//  cityGroupModel.m
//  美团
//
//  Created by 陈受恩 on 15/12/10.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "cityGroupModel.h"

@implementation cityGroupModel{
    NSArray *_plistArray;
}
-(instancetype)init{
    if (self=[super init]) {
        [self loadPlist];
        
    }
    return self;
}
-(void)loadPlist{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"cityGroups.plist" ofType:nil];
   _plistArray=[NSArray arrayWithContentsOfFile:path];
}

-(NSArray*)getModelArray{
    NSMutableArray *dataArray=[[NSMutableArray alloc]init];
    for(NSDictionary*dict in _plistArray){
        cityGroupModel *md=[[cityGroupModel alloc]init];
        md.title=[dict objectForKey:@"title"];
        md.cities=[dict objectForKey:@"cities"];
        [dataArray addObject:md];
    }
    return dataArray;
}
@end

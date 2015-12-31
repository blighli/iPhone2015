//
//  deal Model.m
//  美团
//
//  Created by 陈受恩 on 15/12/14.
//  Copyright © 2015年 chenshouen. All rights reserved.
//

#import "deal Model.h"

@implementation deal_Model
-(NSArray *)asignModelWithDict:(NSDictionary*)dict{
    NSMutableArray *arr=[[NSMutableArray alloc]init];
    NSArray *dictArray=[dict objectForKey:@"deals"];
    for (NSDictionary *dict in dictArray) {
        deal_Model *md=[[deal_Model alloc]init];
        md.categories=dict[@"categories"];
        md.city=dict[@"city"];
        md.current_price=[dict[@"current_price"]stringValue];
        md.deal_url=dict[@"deal_url"];
        md.Description=dict[@"description"];
        md.image_url=dict[@"image_url"];
        md.s_image_url=dict[@"s_image_url"];
        md.list_price=[dict[@"list_price"]stringValue];
        md.purchase_count=[dict[@"purchase_count" ]stringValue];
        md.deal_h5_url = dict[@"deal_h5_url"];
        md.title=dict[@"title"];
        [arr addObject:md];
    }
    return  arr;
}

@end

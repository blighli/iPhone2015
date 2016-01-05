//
//  AppData.m
//  iOS_coreData
//
//  Created by 黄梦妃 on 15/12/29.
//  Copyright (c) 2015年 黄梦妃. All rights reserved.
//

#import "AppData.h"

@implementation AppData

+(void)setAuthentication:(BOOL)isValid
{
    [[NSUserDefaults standardUserDefaults] setBool:isValid forKey:@"authentication"];
}

+(BOOL)getAuthentication
{
    
    BOOL isValid=[[NSUserDefaults standardUserDefaults] boolForKey:@"authentication"];
    
    return isValid;
}

@end

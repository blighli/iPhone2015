//
//  FxJsonUtility.m
//  FxCore
//
//  Created by Jinbo He on 12-7-12.
//  Copyright (c) 2012年 KuaiPan. All rights reserved.
//

#import "FxJsonUtility.h"
#import "FxJsonWriter.h"
#import "FxJsonParser.h"

@implementation FxJsonUtility

+ (id)jsonValueFromString:(NSString *)jsonString
{
    FxJsonParser *jsonParser = [FxJsonParser new];
    id repr = [jsonParser objectWithString:jsonString];
    
    if (!repr) {
        BASE_INFO_FUN(@"不是合法的JSON格式");
        BASE_INFO_FUN(jsonString);
    }
    
    [jsonParser release];
    return repr;
}

+ (NSString *)jsonValueFromObject:(id)object
{
    FxJsonWriter *jsonWriter = [FxJsonWriter new]; 
    NSString *json = [jsonWriter stringWithObject:object];
    
    if (!json) {
        BASE_INFO_FUN(@"对象不能转换为Json格式字符串");
        BASE_INFO_FUN([jsonWriter errorTrace]);
    }
    
    [jsonWriter release];
    return json;
}

@end

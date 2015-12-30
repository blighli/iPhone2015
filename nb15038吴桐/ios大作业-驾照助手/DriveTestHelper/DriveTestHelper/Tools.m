//
//  Tools.m
//  DriveTestHelper
//
//  Created by wp on 15/12/18.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(NSArray *)getAnswerWithString:(NSString *)str{
    //针对选择题
    NSMutableArray *bufferArr=[[NSMutableArray alloc]init];
    NSArray *arr=[str componentsSeparatedByString:@"<BR>"];//分割字符串
    [bufferArr addObject:arr[0]];//题干
    for (int i=0; i<4; i++) {
        //选项,去掉数据自带的ABCD
        [bufferArr addObject:[arr[i+1] substringFromIndex:2]];
    }
    return [bufferArr copy];
}
+(CGSize)getSizeWithString:(NSString *)str with:(UIFont *)font withSize:(CGSize)size{
    //自适应参数：字体，适应范围
    NSStringDrawingOptions opts=NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading;
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init];
    [style setLineBreakMode:NSLineBreakByWordWrapping];
    NSDictionary *attributes=@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style};
    CGSize newSize= [str boundingRectWithSize:size
                                      options:opts
                                   attributes:attributes
                                      context:nil].size;
    return newSize;
}
@end

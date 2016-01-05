//
//  QuestionCollectionManager.m
//  DriveTestHelper
//
//  Created by wp on 15/12/26.
//  Copyright © 2015年 wt. All rights reserved.
//

#import "QuestionCollectionManager.h"

@implementation QuestionCollectionManager
+(NSArray *)getWrongQuestionId{
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"WrongQuestion"];
    if (arr!=nil) {
        return arr;
    } else {
        return @[];
    }
}
+(void)addWrongQuestionId:(NSString *)mid{
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"WrongQuestion"];
    NSMutableArray *bufferArr=[NSMutableArray arrayWithArray:arr];
    [bufferArr addObject:mid];
    [[NSUserDefaults standardUserDefaults] setObject:bufferArr forKey:@"WrongQuestion"];
    [[NSUserDefaults standardUserDefaults] synchronize];//同(保)步(存)
}
+(void)removeWrongQuestionId:(NSString *)mid{
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"WrongQuestion"];
    NSMutableArray *bufferArr=[NSMutableArray arrayWithArray:arr];
    [bufferArr removeObject:mid];
    [[NSUserDefaults standardUserDefaults] setObject:bufferArr forKey:@"WrongQuestion"];
    [[NSUserDefaults standardUserDefaults] synchronize];//同(保)步(存)
}

+(NSArray *)getCollectionQuestionId{
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"CollectionQuestion"];
    if (arr!=nil) {
        return arr;
    } else {
        return @[];
    }
}
+(void)addCollectionQuestionId:(NSString *)mid{
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"CollectionQuestion"];
    NSMutableArray *bufferArr=[NSMutableArray arrayWithArray:arr];
    [bufferArr addObject:mid];
    [[NSUserDefaults standardUserDefaults] setObject:bufferArr forKey:@"CollectionQuestion"];
    [[NSUserDefaults standardUserDefaults] synchronize];//同(保)步(存)

}
+(void)removeCollectionQuestionId:(NSString *)mid{
    NSArray *arr=[[NSUserDefaults standardUserDefaults] objectForKey:@"CollectionQuestion"];
    NSMutableArray *bufferArr=[NSMutableArray arrayWithArray:arr];
    [bufferArr removeObject:mid];
    [[NSUserDefaults standardUserDefaults] setObject:bufferArr forKey:@"CollectionQuestion"];
    [[NSUserDefaults standardUserDefaults] synchronize];//同(保)步(存)
}

+(int)getMyScore{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"TestScore"]!=nil) {
        return (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"TestScore"];
    } else {
        return -1;
    }
}
+(void)setMyScore:(int)score{
    NSLog(@"qcmscore:%d",score);
    [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"TestScore"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)clear{
    NSString * appDomainStr = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomainStr];
}
@end

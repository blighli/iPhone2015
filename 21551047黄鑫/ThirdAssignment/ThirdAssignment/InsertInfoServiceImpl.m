//
//  InsertInfoServiceImpl.m
//  ThirdAssignment
//
//  Created by Xin on 28/10/2015.
//  Copyright © 2015 Huang Xin. All rights reserved.
//

#import "InsertInfoServiceImpl.h"
#import "InfoModel_UniqueIDGenerator.h"

@implementation InsertInfoServiceImpl

- (int)insertInfo:(InfoModel *)infoModel {
    if (infoModel.mid != nil) {
        return -1;//probably update info model.
    }
    [infoModel generateUniqueID];//generate unique id to support infoModel delete.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *value = [defaults objectForKey:INSERT_INFO_USER_DEFAULTS_KEY];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:infoModel];
    if (value == nil) {//create new array of objects
        [defaults setValue:[NSDictionary dictionaryWithObject:data forKey:infoModel.mid] forKey:INSERT_INFO_USER_DEFAULTS_KEY];
        return 0;
    }
    NSMutableDictionary *dict = [value mutableCopy];
    //This is not really efficient because we have to find and unwrap the data from NSDictionary to find the order of the insert model. But because of the limit of the NSUserDefaults, we can't have features that support solving insert order in O(1) time like database would do. So I'm doing this just for fun, time complexity is O(N)
    int index = 0;
    for (NSString *eachKey in value) {
        InfoModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:value[eachKey]];
        if ([model.info compare:infoModel.info] == NSOrderedAscending) {
            index++;
        }
    }
    [dict setObject:data forKey:infoModel.mid];
    [defaults setValue:dict forKey:INSERT_INFO_USER_DEFAULTS_KEY];
    return index;
}

- (void)removeInfo:(InfoModel *)infoModel {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *value = [defaults objectForKey:INSERT_INFO_USER_DEFAULTS_KEY];
    if (value != nil) {
        NSMutableDictionary *dict = [value mutableCopy];
        [dict removeObjectForKey:infoModel.mid];
        [defaults setValue:dict forKey:INSERT_INFO_USER_DEFAULTS_KEY];
    }
}

- (NSArray *)getInfos {
    NSMutableArray *result = [NSMutableArray new];
    NSDictionary *infoDict = [[NSUserDefaults standardUserDefaults]objectForKey:INSERT_INFO_USER_DEFAULTS_KEY];
    for (NSString *eachKey in infoDict) {
        [result addObject:[NSKeyedUnarchiver unarchiveObjectWithData:infoDict[eachKey]]];
    }
    //sort result.
    [result sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        InfoModel *model1 = (InfoModel *)obj1;
        InfoModel *model2 = (InfoModel *)obj2;
        return [model1.info compare:model2.info];
    }];
    return result;
}

@end

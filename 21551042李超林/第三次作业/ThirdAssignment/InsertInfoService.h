//
//  InsertInfoService.h
//  ThirdAssignment
//
//  Created by linchaolin on 28/10/2015.
//  Copyright © 2015 linchaolin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InfoModel.h"

@protocol InsertInfoService <NSObject>

//Insert info to NSUserDefaults, return the index which needs to be inserted(Ordered)
- (int)insertInfo:(InfoModel *)infoModel;

//Remove info from the NSUserDefaults.
- (void)removeInfo:(InfoModel *)infoModel;//since info id can be any type, we use id type to represent the type of id.

//Return the info models according to the info alphabetically.
- (NSArray *)getInfos;

@end

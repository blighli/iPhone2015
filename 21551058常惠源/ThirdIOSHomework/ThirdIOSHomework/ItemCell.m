//
//  ItemCell.m
//  ThirdIOSHomework
//
//  Created by 常惠源 on 11/1/15.
//  Copyright © 2015 常惠源. All rights reserved.
//

#import "ItemCell.h"

@implementation ItemCell

-(instancetype)initWithName:(NSString *)name{
    
    self = [super init];
    if (self) {
        self.titleName = name;
    }
    return self;
}

@end

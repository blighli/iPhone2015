//
//  ItemCell.h
//  ThirdIOSHomework
//
//  Created by 常惠源 on 11/1/15.
//  Copyright © 2015 常惠源. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemCell : NSObject

@property (nonatomic) NSString *titleName;

-(instancetype)initWithName:(NSString *)name;
@end

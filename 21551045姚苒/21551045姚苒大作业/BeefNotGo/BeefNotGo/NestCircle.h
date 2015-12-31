//
//  NestCircle.h
//  BeefNotGo
//
//  Created by 幽儿 on 15/12/29.
//  Copyright © 2015年 幽儿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NestCircle : NSObject

@property int row;
@property int col;
@property int cost;
@property int path;

-(NSMutableArray*) getAllConnectNest;
//-(BOOL)isBoundary;
-(int)calculateCost;
-(int)calculatePath;
-(int)isInCircle;
-(int)compare:(NestCircle*)p1;
@end

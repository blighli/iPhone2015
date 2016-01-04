//
//  block.h
//  eluosi
//
//  Created by admin on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface block : NSObject{
    int block_num;
    int block_color;
    NSMutableArray *block_rotation;
}

@property(nonatomic,assign) int block_num;
@property(nonatomic,assign) int block_color;
@property(nonatomic,copy) NSMutableArray *block_rotation;

@end

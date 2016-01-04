//
//  blocks.h
//  eluosi
//
//  Created by admin on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "block.h"

@interface blocks : NSObject

@property(nonatomic,copy)block *block_blue;
@property(nonatomic,copy)block *block_orange;
@property(nonatomic,copy)block *block_skyblue;
@property(nonatomic,copy)block *block_green;
@property(nonatomic,copy)block *block_purple;
@property(nonatomic,copy)block *block_yellow;
@property(nonatomic,copy)block *block_red;

-(void)build_blocks;

-(block *)get_block_blue;
-(block *)get_block_orange;
-(block *)get_block_skyblue;
-(block *)get_block_green;
-(block *)get_block_purple;
-(block *)get_block_yellow;
-(block *)get_block_red;

@end

//
//  blocks.m
//  eluosi
//
//  Created by admin on 12-8-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "blocks.h"

@implementation blocks

@synthesize block_blue;
@synthesize block_orange;
@synthesize block_skyblue;
@synthesize block_green;
@synthesize block_purple;
@synthesize block_yellow;
@synthesize block_red;

- (id)init
{
    if (self = [super init])
    {
        block_blue = [[block alloc]init];
        block_orange = [[block alloc]init];
        block_skyblue = [[block alloc]init];
        block_green = [[block alloc]init];
        block_purple = [[block alloc]init];
        block_yellow = [[block alloc]init];
        block_red = [[block alloc]init];
    }
    return self; // return this object
}

-(void)build_blocks{
    block_blue.block_num = 4;
    block_blue.block_color = 1;
    block_blue.block_rotation = [[NSMutableArray alloc] initWithObjects:@"0_0,0_1,0_2,0_3",@"0_0,1_0,2_0,3_0", nil];
    
    block_orange.block_num = 4;
    block_orange.block_color = 2;
    block_orange.block_rotation = [[NSMutableArray alloc] initWithObjects:@"0_0,0_1,1_0,1_1", nil];
    
    block_skyblue.block_num = 4;
    block_skyblue.block_color = 3;
    block_skyblue.block_rotation = [[NSMutableArray alloc] initWithObjects:@"1_0,2_0,0_1,1_1",@"0_0,0_1,1_1,1_2", nil];
    
    block_green.block_num = 4;
    block_green.block_color = 4;
    block_green.block_rotation = [[NSMutableArray alloc] initWithObjects:@"0_0,1_0,1_1,2_1",@"1_0,0_1,1_1,0_2", nil];
    
    block_purple.block_num = 4;
    block_purple.block_color = 5;
    block_purple.block_rotation = [[NSMutableArray alloc] initWithObjects:@"1_0,0_1,1_1,2_1",@"0_0,0_1,1_1,0_2",@"0_0,1_0,2_0,1_1"@"1_0,0_1,1_1,1_2", nil];
    
    block_yellow.block_num = 4;
    block_yellow.block_color = 6;
    block_yellow.block_rotation = [[NSMutableArray alloc] initWithObjects:@"0_0,0_1,1_1,2_1",@"0_0,1_0,0_1,0_2",@"0_0,1_0,2_0,2_1",@"1_0,1_1,0_2,1_2", nil];
    
    block_red.block_num = 4;
    block_red.block_color = 7;
    block_red.block_rotation = [[NSMutableArray alloc] initWithObjects:@"2_0,0_1,1_1,2_1",@"0_0,0_1,0_2,1_2",@"0_0,1_0,2_0,0_1",@"0_0,1_0,1_1,1_2", nil];
}

-(block *)get_block_blue{
    return block_blue;
}
-(block *)get_block_orange{
    return block_orange;
}
-(block *)get_block_skyblue{
    return block_skyblue;
}
-(block *)get_block_green{
    return block_green;
}
-(block *)get_block_purple{
    return block_purple;
}
-(block *)get_block_yellow{
    return block_yellow;
}
-(block *)get_block_red{
    return block_red;
}

@end

//
//  NewsLandscapeCell.m
//  NewsReader
//
//  Created by hejinbo on 15/7/15.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import "NewsLandscapeCell.h"

@implementation NewsLandscapeCell

- (void)setCellData:(ColumnInfo *)info
{
    [super setCellData:info];
    
    if (_widget == nil) {
        _widget = [[NewsWidget alloc] init];
        _widget.columnInfo = info;
        _widget.owner = self.owner;
        _widget.view.frame = self.bounds;
        
        [self addSubview:_widget.view];
    }
    else {
        _widget.columnInfo = info;
        [_widget reloadData];
    }
}

@end

//
//  FxBaseCell.m
//  NewsReader
//
//  Created by hejinbo on 15/7/7.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import "FxBaseCell.h"

@implementation FxBaseCell

- (void)initCell
{
}

- (void)setCellData:(BaseInfo *)info
{
    self.cellInfo = info;
    _titleLabel.text = info.name;
}

@end

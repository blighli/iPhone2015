//
//  FxBaseCell.h
//  NewsReader
//
//  Created by hejinbo on 15/7/7.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseInfo.h"

@interface FxBaseCell : UITableViewCell {
    IBOutlet UILabel        *_titleLabel;
}

@property(nonatomic, strong) BaseInfo   *cellInfo;

- (void)initCell;
- (void)setCellData:(BaseInfo *)info;

@end

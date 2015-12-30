//
//  NewsCell.m
//  NewsReader
//
//  Created by hejinbo on 15/7/7.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//

#import "NewsCell.h"
#import "NewsInfo.h"
#import "FxDownload.h"

@implementation NewsCell

- (void)initCell
{
    [super initCell];
    RegisterNotify(NofifyNewsIcon, @selector(downloadIcon:));
}

- (void)dealloc
{
    RemoveNofify;
}

- (void)setCellData:(NewsInfo *)info
{
    [super setCellData:info];
    
    _descLabel.numberOfLines = 2;
    _descLabel.text = info.desc;
    
    [[FxDownload download] setNewsIcon:info imageView:_imageView];
}

- (void)downloadIcon:(NSNotification *)notification
{
    NSDictionary *dict = [notification object];
    NewsInfo *info = [dict objectForKey:@"info"];
    
    if ([info.ID isEqualToString:self.cellInfo.ID]) {
        UIImage *image = [dict objectForKey:@"data"];
        _imageView.image = image;
    }
}

@end

//
//  LMMusic.h
//  音乐播放器
//
//  Created by 张焕 on 12/31/15.
//  Copyright © 2015 张焕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMMusic : NSObject
/**
 * 专辑名称
 */
@property(nonatomic, copy)NSString *album;
/**
 * 歌曲名字
 */
@property(nonatomic,copy)NSString *name;
/**
 * 本地音乐文件名
 */
@property(nonatomic,copy)NSString *filename;

/**
 * 歌手名字
 */
@property(nonatomic,copy)NSString *singer;

/**
 * 歌手相片
 */
@property(nonatomic,copy)NSString *singerIcon;

/**
 * 专辑图片
 */
@property(nonatomic,copy)NSString *icon;
@end

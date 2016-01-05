//
//  MusicModel.h
//  CloudMusic
//
//  Created by LiDan on 15/12/13.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicModel : NSObject


/** 歌曲名称*/
@property (nonatomic,copy) NSString *songName;

/**
 *  本地音乐文件
 */
@property (nonatomic,copy) NSString *fileName;

/**
 *  歌手名称
 */
@property (nonatomic,copy) NSString *singer;

/**
 *  专辑图片
 */
@property (nonatomic,copy) NSString *albumImage;

@end

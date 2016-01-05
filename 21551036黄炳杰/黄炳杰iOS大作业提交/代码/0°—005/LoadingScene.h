//
//  LoadingScene.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LoadingScene : CCLayer {
    CGSize screenSize;
    CGPoint winCenter;
    
    CCProgressTimer *progress;
    float   progressInterval;
    int     assetCount;
}


+(CCScene *) scene;
//加载声音
-(void) loadMusic:(NSArray *) musicFiles;

-(void) loadSounds:(NSArray *) soundClips;

//加载精灵

-(void) loadSpriteSheets:(NSArray *) spriteSheets;

//图片

-(void) loadImages:(NSArray *) images;

-(void) loadAsset:(NSArray *) assets;

-(void) progressUpdate;

-(void) loadingComplete;

@end

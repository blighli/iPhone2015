//
//  ChapterSelect.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface ChapterSelect : CCLayer {
    
    //返回按钮的位置
    CGPoint backButtonLocation;
    
    //地图场景文字描述的位置
    CGPoint textLocation;
    
    //地图的位置
    CGPoint chapterLocation;
    
    //背景图片的位置
    CGPoint bgLocation;
    
    //屏幕大小
    CGSize winSize;
    
    
    //滑动图层的偏移
    int scrollLayerOffset;
    
}

+(CCScene *)scene;

@end

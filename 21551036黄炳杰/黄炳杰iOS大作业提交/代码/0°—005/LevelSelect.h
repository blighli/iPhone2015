//
//  LevelSelect.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface LevelSelect : CCLayer {
    
    int currentChapter;
    
    CGPoint backButtonLocation;
    
    CGPoint bgLocation;
    
    CGSize winSize;
    
    CGPoint levelMenuLocation;
    
    //CGPoint textLocation;//地形的文字描述位置   可有可无
    
    CGPoint ChapterTitleLocation;//地形标题的位置
    
    CCLabelTTF *ChapterTitle;
    

    
    
    //滑动图层的偏移
    int scrollLayerOffset;
    
}

+(CCScene *)scene;

@end

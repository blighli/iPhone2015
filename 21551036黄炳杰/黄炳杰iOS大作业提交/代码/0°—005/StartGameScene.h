//
//  StartGameScene.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface StartGameScene : CCLayer {
    
    CCSprite *bgGameStart;
    CCSprite *gameTitle;
    CGSize screenSize;
    CCMenuItem *playItem;   //开始
    CCMenuItem *aboutItem;  //关于
    CCMenuItem *setItem;    //设置
    
    

    
        
}

+(id)scene;

@end

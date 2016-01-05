//
//  SetGame.h
//  0°—Test002
//
//  Created by huangbingjie on 13-7-25.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface SetGame : CCLayer {
    CGSize screenSize;
    CGSize soundButtonLocation;
    CGSize musicButtonLocation;
    
    CCMenu *soundEffectMenu;
    CCMenu* backgroundMusicMenu;
}
+(CCScene *)scene;

@end

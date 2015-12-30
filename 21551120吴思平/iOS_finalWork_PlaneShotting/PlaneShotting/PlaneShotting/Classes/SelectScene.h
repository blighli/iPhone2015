//
//  SelectScene.h
//  PlaneShotting
//
//  Created by Anglet on 15/12/3.
//  Copyright © 2015年 Anglet. All rights reserved.
//

#import "CCScene.h"
#import "GameManager.h"

@interface SelectScene : CCScene
{
    GameManager *manager;
}

- (instancetype)init;

@end

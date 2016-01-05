//
//  Projectile.h
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "cocos2d.h"
//普通炮弹
@interface Projectile : CCSprite {
   	int _damage;
}

+ (id)projectile;
@property (nonatomic,assign) int damage;
@end
//寒冰炮弹
@interface IceProjectile : CCSprite {
    
}

+ (id)projectile;

@end

@interface PowerProjectile : CCSprite {
    
}

+ (id)projectile;

@end

@interface FastProjectile : CCSprite {
    
}

+ (id)projectile;

@end

@interface SuperProjectile : CCSprite {
    
}

+ (id)projectile;

@end
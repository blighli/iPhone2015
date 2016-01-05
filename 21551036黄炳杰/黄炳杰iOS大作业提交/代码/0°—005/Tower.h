//
//  Creep.h
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "cocos2d.h"
#import "Creep.h"
#import "SimpleAudioEngine.h"
#import "Projectile.h"
#import "DataModel.h"

@interface Tower : CCSprite {
	int _range;//射程
	//int _damage;
	Creep * _target;//瞄准目标
    
	//CCSprite * selSpriteRange;
	
	NSMutableArray *_projectiles; //炮弹
	CCSprite *_nextProjectile;  //下一个炮弹
    CCSprite *_towerBase;
    Projectile *_pao;
    int level;
}

@property (nonatomic, assign) int range;//塔的范围
//@property (nonatomic,assign) int damage;
@property (nonatomic, retain) CCSprite * nextProjectile;//下一个子弹
@property (nonatomic, retain) Creep * target;//敌人
@property (nonatomic , retain)CCSprite * towerBase;
@property (nonatomic,retain) Projectile *pao;
@property (nonatomic,assign) int level;
- (Creep *)getClosestTarget;//获得最近的目标

@end
/////////各种炮塔的继承／／／／／／／／
@interface MachineGunTower : Tower {

}

+ (id)tower;

- (void)setClosestTarget:(Creep *)closestTarget;
- (void)towerLogic:(ccTime)dt;
- (void)creepMoveFinished:(id)sender;
- (void)finishFiring;

@end

@interface FreezeTower : Tower {
    
}

+ (id)tower;

- (void)setClosestTarget:(Creep *)closestTarget;
- (void)towerLogic:(ccTime)dt;
- (void)creepMoveFinished:(id)sender;
- (void)finishFiring;

@end
@interface LongDistanceTower : Tower {
    
}
+ (id)tower;

- (void)setClosestTarget:(Creep *)closestTarget;
- (void)towerLogic:(ccTime)dt;
- (void)creepMoveFinished:(id)sender;
- (void)finishFiring;

@end

@interface GreatPowerTower : Tower {
    
}
+ (id)tower;

- (void)setClosestTarget:(Creep *)closestTarget;
- (void)towerLogic:(ccTime)dt;
- (void)creepMoveFinished:(id)sender;
- (void)finishFiring;

@end

@interface SuperTower : Tower {
    
}

+ (id)tower;

- (void)setClosestTarget:(Creep *)closestTarget;
- (void)towerLogic:(ccTime)dt;
- (void)creepMoveFinished:(id)sender;
- (void)finishFiring;

@end
//
//  Creep.m
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "Tower.h"

@implementation Tower
float angle;
@synthesize range = _range; //射程
@synthesize target = _target; //射击目标
@synthesize nextProjectile = _nextProjectile; //下一个炮弹
@synthesize level=level;
//@synthesize damage = _damage;
/////获得下一个目标
- (Creep *)getClosestTarget {
	Creep *closestCreep = nil;
	double maxDistant = 99999;
	
	DataModel *m = [DataModel getModel];
	
	for (CCSprite *target in m._targets) {	
		Creep *creep = (Creep *)target;
		double curDistance = ccpDistance(self.position, creep.position);
		
		if (curDistance < maxDistant) {
			closestCreep = creep;
			maxDistant = curDistance;
		}
		
	}
	
	if (maxDistant < self.range)
		return closestCreep;
	
	return nil;
}

@end

@implementation MachineGunTower 

+ (id)tower {
	
    MachineGunTower *tower = nil;
   // CCSprite  *towerBase = nil;
    if ((tower = [[[super alloc] initWithFile:@"danpao1.png"] autorelease])) {
      
		tower.range = 70;
//tower.pao = nil;
//tower.pao.damage = 1;
		//pao.tag = tower.tag;
        tower.level=1;
		tower.target = nil;
       // tower.damage = 9;
		//tower.towerBase = [CCSprite spriteWithFile:@"Icon.png"];
       // tower.towerBase.position = tower.position;
		[tower schedule:@selector(towerLogic:) interval:0.4];
		
    }
	
    return tower;
    
}

-(id) init
{
	if ((self=[super init]) ) {
		//[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	}
	return self;
}


-(void)setClosestTarget:(Creep *)closestTarget {
	self.target = closestTarget;
}
//塔的旋转控制
-(void)towerLogic:(ccTime)dt {
	
	self.target = [self getClosestTarget];
	
	if (self.target != nil) {
		
		//rotate the tower to face the nearest creep
		CGPoint shootVector = ccpSub(self.target.position, self.position);
		CGFloat shootAngle = ccpToAngle(shootVector);
        angle = shootAngle;
		CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * shootAngle);
		
		float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
		float rotateDuration = fabs(shootAngle * rotateSpeed);    
		
		[self runAction:[CCSequence actions:
						 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
						 [CCCallFunc actionWithTarget:self selector:@selector(finishFiring)],
						 nil]];		
	}
}

-(void)creepMoveFinished:(id)sender {
    
	DataModel * m = [DataModel getModel];
	
	CCSprite *sprite = (CCSprite *)sender;
	[self.parent removeChild:sprite cleanup:YES];
	
	[m._projectiles removeObject:sprite];
	
}

- (void)finishFiring {
	if(self.target != nil){
	DataModel *m = [DataModel getModel];
	self.nextProjectile = [Projectile projectile];
    self.nextProjectile.position = ccp(self.position.x+30*cosf(angle), self.position.y+30*sinf(angle));
	
    [self.parent addChild:self.nextProjectile z:1];
    [m._projectiles addObject:self.nextProjectile];
    
	ccTime delta = 1.0;
	CGPoint shootVector = ccpSub(self.target.position, self.position);
	CGPoint normalizedShootVector = ccpNormalize(shootVector);
	CGPoint overshotVector = ccpMult(normalizedShootVector, 320);
	CGPoint offscreenPoint = ccpAdd(self.nextProjectile.position, overshotVector);
	
	[self.nextProjectile runAction:[CCSequence actions:
								[CCMoveTo actionWithDuration:delta position:offscreenPoint],
								[CCCallFuncN actionWithTarget:self selector:@selector(creepMoveFinished:)],
								nil]];
	
    self.nextProjectile.tag = 1;		

    self.nextProjectile = nil;
    }
    
}

@end


@implementation FreezeTower

+ (id)tower {
	
    FreezeTower *tower = nil;
    if ((tower = [[[super alloc] initWithFile:@"jiansu1.png"] autorelease])) {
		tower.range = 70;
		tower.level=1;
		tower.target = nil;
        //tower.damage =
		[tower schedule:@selector(towerLogic:) interval:2];
		
    }
	
    return tower;
    
}

-(id) init
{
	if ((self=[super init]) ) {
		//[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	}
	return self;
}


-(void)setClosestTarget:(Creep *)closestTarget {
	self.target = closestTarget;
}

-(void)towerLogic:(ccTime)dt {
	
	self.target = [self getClosestTarget];
	
	if (self.target != nil) {
		
		//rotate the tower to face the nearest creep
		CGPoint shootVector = ccpSub(self.target.position, self.position);
		CGFloat shootAngle = ccpToAngle(shootVector);
        angle = shootAngle;
		CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * shootAngle);
		
		float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
		float rotateDuration = fabs(shootAngle * rotateSpeed);    
		
		[self runAction:[CCSequence actions:
						 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
						 [CCCallFunc actionWithTarget:self selector:@selector(finishFiring)],
						 nil]];		
	}
}

-(void)creepMoveFinished:(id)sender {
    
	DataModel * m = [DataModel getModel];
	
	CCSprite *sprite = (CCSprite *)sender;
	[self.parent removeChild:sprite cleanup:YES];
	
	[m._projectiles removeObject:sprite];
	
}

- (void)finishFiring {
	if(self.target != nil){
        
    DataModel *m = [DataModel getModel];
    
	self.nextProjectile = [IceProjectile projectile];
	self.nextProjectile.position = ccp(self.position.x+30*cosf(angle), self.position.y+30*sinf(angle));
    
    [self.parent addChild:self.nextProjectile z:1];
    [m._projectiles addObject:self.nextProjectile];
    
	ccTime delta = 0.5;
	CGPoint shootVector = ccpSub(self.target.position, self.position);
	CGPoint normalizedShootVector = ccpNormalize(shootVector);
	CGPoint overshotVector = ccpMult(normalizedShootVector, 320);
	CGPoint offscreenPoint = ccpAdd(self.nextProjectile.position, overshotVector);
	
	[self.nextProjectile runAction:[CCSequence actions:
                                    [CCMoveTo actionWithDuration:delta position:offscreenPoint],
                                    [CCCallFuncN actionWithTarget:self selector:@selector(creepMoveFinished:)],
                                    nil]];
	
    self.nextProjectile.tag = 2;		

    self.nextProjectile = nil;
    }
    
}

@end
@implementation LongDistanceTower

+ (id)tower {
	
    LongDistanceTower *tower = nil;
    if ((tower = [[[super alloc] initWithFile:@"shuangpao1.png"] autorelease])) {
		tower.range = 70;
		tower.level=1;
		tower.target = nil;
		//tower.damage = 2;
		[tower schedule:@selector(towerLogic:) interval:0.4];
		
    }
	
    return tower;
    
}

-(id) init
{
	if ((self=[super init]) ) {
		//[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	}
	return self;
}


-(void)setClosestTarget:(Creep *)closestTarget {
	self.target = closestTarget;
}

-(void)towerLogic:(ccTime)dt {
	
	self.target = [self getClosestTarget];
	
	if (self.target != nil) {
		
		//rotate the tower to face the nearest creep
		CGPoint shootVector = ccpSub(self.target.position, self.position);
		CGFloat shootAngle = ccpToAngle(shootVector);
        angle=shootAngle;
		CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * shootAngle);
		
		float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
		float rotateDuration = fabs(shootAngle * rotateSpeed);
		
		[self runAction:[CCSequence actions:
						 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
						 [CCCallFunc actionWithTarget:self selector:@selector(finishFiring)],
						 nil]];
	}
}

-(void)creepMoveFinished:(id)sender {
    
	DataModel * m = [DataModel getModel];
	
	CCSprite *sprite = (CCSprite *)sender;
	[self.parent removeChild:sprite cleanup:YES];
	
	[m._projectiles removeObject:sprite];
	
}

- (void)finishFiring {
	if(self.target != nil){
    DataModel *m = [DataModel getModel];
	self.nextProjectile = [PowerProjectile projectile];
	self.nextProjectile.position = ccp(self.position.x+30*cosf(angle), self.position.y+30*sinf(angle));
	
    [self.parent addChild:self.nextProjectile z:1];
    [m._projectiles addObject:self.nextProjectile];
    
	ccTime delta = 1.0;
	CGPoint shootVector = ccpSub(self.target.position, self.position);
	CGPoint normalizedShootVector = ccpNormalize(shootVector);
	CGPoint overshotVector = ccpMult(normalizedShootVector, 320);
	CGPoint offscreenPoint = ccpAdd(self.nextProjectile.position, overshotVector);
	
	[self.nextProjectile runAction:[CCSequence actions:
                                    [CCMoveTo actionWithDuration:delta position:offscreenPoint],
                                    [CCCallFuncN actionWithTarget:self selector:@selector(creepMoveFinished:)],
                                    nil]];
	
    self.nextProjectile.tag = 3;
    
    self.nextProjectile = nil;
    }
    
}

@end

@implementation GreatPowerTower

+ (id)tower {
	
    GreatPowerTower *tower = nil;
    if ((tower = [[[super alloc] initWithFile:@"sanpao1.png"] autorelease])) {
		tower.range = 70;
		tower.level=1;
		tower.target = nil;
       // tower.damage = 8;
		
		[tower schedule:@selector(towerLogic:) interval:0.4];
		
    }
	
    return tower;
    
}

-(id) init
{
	if ((self=[super init]) ) {
		//[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	}
	return self;
}


-(void)setClosestTarget:(Creep *)closestTarget {
	self.target = closestTarget;
}

-(void)towerLogic:(ccTime)dt {
	
	self.target = [self getClosestTarget];
	
	if (self.target != nil) {
		
		//rotate the tower to face the nearest creep
		CGPoint shootVector = ccpSub(self.target.position, self.position);
		CGFloat shootAngle = ccpToAngle(shootVector);
        angle = shootAngle;
		CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * shootAngle);
		float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
		float rotateDuration = fabs(shootAngle * rotateSpeed);
		
		[self runAction:[CCSequence actions:
						 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
						 [CCCallFunc actionWithTarget:self selector:@selector(finishFiring)],
						 nil]];
	}
}

-(void)creepMoveFinished:(id)sender {
    
	DataModel * m = [DataModel getModel];
	
	CCSprite *sprite = (CCSprite *)sender;
	[self.parent removeChild:sprite cleanup:YES];
	
	[m._projectiles removeObject:sprite];
	
}

- (void)finishFiring {
	if(self.target != nil){
    DataModel *m = [DataModel getModel];
	self.nextProjectile = [FastProjectile projectile];
	self.nextProjectile.position = ccp(self.position.x+30*cosf(angle), self.position.y+30*sinf(angle));
	
    [self.parent addChild:self.nextProjectile z:1];
    [m._projectiles addObject:self.nextProjectile];
    
	ccTime delta = 1.0;
	CGPoint shootVector = ccpSub(self.target.position, self.position);
	CGPoint normalizedShootVector = ccpNormalize(shootVector);
	CGPoint overshotVector = ccpMult(normalizedShootVector, 320);
	CGPoint offscreenPoint = ccpAdd(self.nextProjectile.position, overshotVector);
	
	[self.nextProjectile runAction:[CCSequence actions:
                                    [CCMoveTo actionWithDuration:delta position:offscreenPoint],
                                    [CCCallFuncN actionWithTarget:self selector:@selector(creepMoveFinished:)],
                                    nil]];
	
    self.nextProjectile.tag = 4;
    
    self.nextProjectile = nil;
    }
    
}
@end

@implementation SuperTower

+ (id)tower {
	
    SuperTower *tower = nil;
    // CCSprite  *towerBase = nil;
    if ((tower = [[[super alloc] initWithFile:@"wudi1.png"] autorelease])) {
        
		tower.range = 70;
    
        tower.level=1;
		tower.target = nil;
        // tower.damage = 9;
		//tower.towerBase = [CCSprite spriteWithFile:@"Icon.png"];
        // tower.towerBase.position = tower.position;
		[tower schedule:@selector(towerLogic:) interval:0.4];
		
    }
	
    return tower;
    
}

-(id) init
{
	if ((self=[super init]) ) {

	}
	return self;
}


-(void)setClosestTarget:(Creep *)closestTarget {
	self.target = closestTarget;
}
//塔的旋转控制
-(void)towerLogic:(ccTime)dt {
	
	self.target = [self getClosestTarget];
	
	if (self.target != nil) {
		
		//rotate the tower to face the nearest creep
		CGPoint shootVector = ccpSub(self.target.position, self.position);
		CGFloat shootAngle = ccpToAngle(shootVector);
        angle = shootAngle;
		CGFloat cocosAngle = CC_RADIANS_TO_DEGREES(-1 * shootAngle);
		
		float rotateSpeed = 0.5 / M_PI; // 1/2 second to roate 180 degrees
		float rotateDuration = fabs(shootAngle * rotateSpeed);
		
		[self runAction:[CCSequence actions:
						 [CCRotateTo actionWithDuration:rotateDuration angle:cocosAngle],
						 [CCCallFunc actionWithTarget:self selector:@selector(finishFiring)],
						 nil]];
	}
}

-(void)creepMoveFinished:(id)sender {
    
	DataModel * m = [DataModel getModel];
	
	CCSprite *sprite = (CCSprite *)sender;
	[self.parent removeChild:sprite cleanup:YES];
	
	[m._projectiles removeObject:sprite];
	
}

- (void)finishFiring {
	if(self.target != nil){
    DataModel *m = [DataModel getModel];
	self.nextProjectile = [SuperProjectile projectile];
    self.nextProjectile.position = ccp(self.position.x+20*cosf(angle), self.position.y+20*sinf(angle));
	
    [self.parent addChild:self.nextProjectile z:1];
    [m._projectiles addObject:self.nextProjectile];
    
	ccTime delta = 1.0;
	CGPoint shootVector = ccpSub(self.target.position, self.position);
	CGPoint normalizedShootVector = ccpNormalize(shootVector);
	CGPoint overshotVector = ccpMult(normalizedShootVector, 320);
	CGPoint offscreenPoint = ccpAdd(self.nextProjectile.position, overshotVector);
	
	[self.nextProjectile runAction:[CCSequence actions:
                                    [CCMoveTo actionWithDuration:delta position:offscreenPoint],
                                    [CCCallFuncN actionWithTarget:self selector:@selector(creepMoveFinished:)],
                                    nil]];
	
    self.nextProjectile.tag = 5;
    
    self.nextProjectile = nil;
    }
    
}

@end
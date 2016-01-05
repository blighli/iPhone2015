//
//  Wave.m
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

//

#import "Wave.h"

@implementation Wave

@synthesize spawnRate = _spawnRate;
@synthesize redCreeps = _redCreeps;
@synthesize planes=_planes;
@synthesize plane2s=_plane2s;
@synthesize motos=_motos;
@synthesize tanke1=_tanke1;
@synthesize tanke2=_tanke2;
@synthesize kache=_kache;
@synthesize creepType = _creepType;

-(id) init
{
	if( (self=[super init]) ) {
		
	}
	
	return self;
}

- (id) initWithCreep:(Creep *)creep SpawnRate:(float)spawnrate RedCreeps:(int)redcreeps  Planes:(int)planes Plane2s:(int)plane2s Motos:(int)motos TanKe1s:(int)tanke1 TanKe2s:(int)tanke2 KaChes:(int)kache
{
	NSAssert(creep!=nil, @"Invalid creep for wave 无效的敌人.");
    
	if( (self = [self init]) )
	{
		_creepType = creep;
		_spawnRate = spawnrate;
        
		_redCreeps = redcreeps;
        _planes = planes;
        _plane2s = plane2s;
        _motos=motos;
        _tanke1=tanke1;
        _tanke2=tanke2;
        _kache=kache;
	}
	return self;
}


@end

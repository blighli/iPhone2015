//
//  Wave.h
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "cocos2d.h"

#import "Creep.h"

@interface Wave : CCNode {
	float _spawnRate;
    
	int _redCreeps;
    int _planes;
    int _plane2s;
    int _motos;
    int _tanke1;
    int _tanke2;
    int _kache;
    
	Creep * _creepType;
}

@property (nonatomic) float spawnRate;//开始速度
@property (nonatomic) int redCreeps;
@property (nonatomic) int planes;
@property (nonatomic) int plane2s;
@property (nonatomic) int motos;
@property (nonatomic) int tanke1;
@property (nonatomic) int tanke2;
@property (nonatomic) int kache;
@property (nonatomic, retain) Creep *creepType;

- (id)initWithCreep:(Creep *)creep SpawnRate:(float)spawnrate RedCreeps:(int)redcreeps Planes:(int)planes Plane2s:(int)plane2s Motos:(int) motos TanKe1s:(int)tanke1 TanKe2s:(int)tanke2 KaChes:(int)kache;

@end

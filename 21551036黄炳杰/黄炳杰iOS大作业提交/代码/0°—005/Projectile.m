//
//  Projectile.m
//  Cocos2D Build a Tower Defense Game
//
//  Created by jack on 13-7-9.
//  Copyright (c) 2013年 jack. All rights reserved.
//

#import "Projectile.h"

@implementation Projectile
@synthesize damage = _damage;
+ (id)projectile {
	
    Projectile *projectile = nil;
    
        if ((projectile = [[[super alloc] initWithFile:@"Projectile1.png"] autorelease])) {
            projectile.damage = 1;
        }    
    
    return projectile;
 
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation IceProjectile

+ (id)projectile {
	
    IceProjectile *projectile = nil;
    
    if ((projectile = [[[super alloc] initWithFile:@"IceProjectile.png"] autorelease])) {
    }    
    
    return projectile;
    
}

- (void) dealloc
{  
    [super dealloc];
}

@end

@implementation PowerProjectile

+ (id)projectile {
	
    IceProjectile *projectile = nil;
    
    if ((projectile = [[[super alloc] initWithFile:@"Projectile1.png"] autorelease])) {
    }
    
    return projectile;
    
}

- (void) dealloc
{
    [super dealloc];
}

@end

@implementation FastProjectile

+ (id)projectile {
	
    IceProjectile *projectile = nil;
    
    if ((projectile = [[[super alloc] initWithFile:@"Projectile1.png"] autorelease])) {
    }
    
    return projectile;
    
}

- (void) dealloc
{
    [super dealloc];
}

@end

@implementation SuperProjectile

+ (id)projectile {
	
    IceProjectile *projectile = nil;
    
    if ((projectile = [[[super alloc] initWithFile:@"Projectile1.png"] autorelease])) {
    }
    
    return projectile;
    
}

- (void) dealloc
{
    [super dealloc];
}

@end

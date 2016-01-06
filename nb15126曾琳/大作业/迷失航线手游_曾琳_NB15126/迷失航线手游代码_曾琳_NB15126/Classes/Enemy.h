#ifndef __ENEMY_H__
#define __ENEMY_H__

#include "cocos2d.h"


#define Enemy_Stone "gameplay.stone1.png"
#define Enemy_1 "gameplay.enemy-1.png"
#define Enemy_2 "gameplay.enemy-2.png"
#define Enemy_Planet "gameplay.enemy.planet.png"

typedef enum
{
	EnemyTypeStone = 0,
	EnemyTypeEnemy1,
	EnemyTypeEnemy2,
	EnemyTypePlanet
} EnemyTypes;


class Enemy : public cocos2d::Sprite
{

	CC_SYNTHESIZE(EnemyTypes, enemyType, EnemyType);
	CC_SYNTHESIZE(int, initialHitPoints, InitialHitPoints);
	CC_SYNTHESIZE(int, hitPoints, HitPoints);
	CC_SYNTHESIZE(cocos2d::Vec2, velocity, Velocity);

public:
	Enemy(EnemyTypes enemyType);

	void spawn();
	virtual void update(float dt);
	static Enemy* createWithEnemyTypes(EnemyTypes enemyType);
};



















#endif // __ENEMY_H__

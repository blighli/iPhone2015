#ifndef _TURRET_H_
#define _TURRET_H_
#include "cocos2d.h"
#include "Bullet.h"
#include "SpriteBase.h"
USING_NS_CC;
class Turret :public SpriteBase
{
protected:
	std::string _TurretName;
	int _TurretValue;
	int attackDistance;
	Vec2 _position;
	Sprite* _Turret;
	Bullet* _bullet;
public:
	static Turret* create(std::string TurretName);
	bool init(std::string TurretName);
	Bullet* getBullet();
	void setBullet(Bullet* bullet);
};
#endif
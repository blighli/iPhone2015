#ifndef _BULLET_H_
#define _BULLET_H_
#include"cocos2d.h"
USING_NS_CC;
class Bullet :public Sprite
{
protected:
	Sprite* _bullet;
	bool _isShoot;
public:
	static Bullet* create();
	bool init();
	void setShoot(bool isShoot);
	bool getShoot();
};
#endif
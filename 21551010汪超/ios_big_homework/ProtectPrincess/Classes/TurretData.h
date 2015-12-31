#ifndef _TURRETDATA_H_
#define _TURRETDATA_H_
#include"cocos2d.h"
USING_NS_CC;
class TurretData :public Ref
{
private:
	std::string _name; //The name of the turret
	int _gold; //The money for building the turret
	std::string _bulletName; //The name of the bullet
public:
	static TurretData*create()
	{
		auto sprite = new TurretData();
		if (sprite)
		{
			sprite->autorelease();
			return sprite;
		}
		CC_SAFE_DELETE(sprite);
		return nullptr;
	}
	void setName(std::string name)
	{
		_name = name;
	}
	std::string getName()
	{
		return _name;
	}
	void setGold(int gold)
	{
		_gold = gold;
	}
	int getGold()
	{
		return _gold;
	}
	void setBulletName(std::string bulletName)
	{
		_bulletName = bulletName;
	}
	std::string getBulletName()
	{
		return _bulletName;
	}
};
#endif
#ifndef _MONSTERDATA_H_
#define _MONSTERDATA_H_
#include "cocos2d.h"
USING_NS_CC;
class MonsterData :public Ref
{
private:
	std::string _name;
	int _lifeValue;
	int _gold;
public:
	static MonsterData* create()
	{
		MonsterData* sprite = new MonsterData();
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
	std::string getname()
	{
		return _name;
	}
	void setLifeValue(int lifeValue)
	{
		_lifeValue = lifeValue;
	}
	int getLifeValue()
	{
		return _lifeValue;
	}
	void setGold(int gold)
	{
		_gold = gold;
	}
	int getGold()
	{
		return _gold;
	}
};

#endif
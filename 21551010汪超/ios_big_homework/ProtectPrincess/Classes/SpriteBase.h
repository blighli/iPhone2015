#ifndef _SPRITEBASE_H_
#define _SPRITEBASE_H_
#include"cocos2d.h"
USING_NS_CC;
class SpriteBase :public Sprite
{
protected:
	int _lifeValue;
	int _gold;
public:
	SpriteBase* createwithSpriteFramName(const std::string filename);
	void setLifeValue(int lifeValue);
	int getLifeValue();
	void setGold(int gold);
	int getGold();
};
#endif
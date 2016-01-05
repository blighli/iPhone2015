#include"SpriteBase.h"
SpriteBase* SpriteBase::createwithSpriteFramName(const std::string filename)
{
	SpriteBase* sprite = new SpriteBase();
	if (sprite&&sprite->initWithSpriteFrameName(filename))
	{
		sprite->autorelease();
		return sprite;
	}
	CC_SAFE_DELETE(sprite);
	return nullptr;
}

void SpriteBase::setLifeValue(int lifeValue)
{
	_lifeValue = lifeValue;
}

int SpriteBase::getLifeValue()
{
	return _lifeValue;
}

void SpriteBase::setGold(int gold)
{
	_gold = gold;
}

int SpriteBase::getGold()
{
	return _gold;
}


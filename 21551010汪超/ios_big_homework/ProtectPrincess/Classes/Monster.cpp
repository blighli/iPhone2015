#include"Monster.h"
Monster* Monster::create(std::string filename)
{
	Monster* sprite = new (std::nothrow)Monster();
	if (sprite&&sprite->init(filename))
	{
		sprite->autorelease();
		return sprite;
	}
	CC_SAFE_DELETE(sprite);
	return nullptr;
}

bool Monster::init(std::string filename)
{
	if (!Sprite::init())
	{
		return false;
	}
	this->setAnchorPoint(Vec2::ZERO);
	auto spriteFrameCache = SpriteFrameCache::getInstance();
	spriteFrameCache->addSpriteFramesWithFile("resources.plist");
	_monster = createWithSpriteFrameName(filename);
	_monster->setPosition(Vec2::ZERO);
	this->addChild(_monster,1);
	_HP = LoadingBar::create("planeHP.png");
	_HP->setDirection(LoadingBar::Direction::LEFT);
	_HP->setScale(0.06f, 0.1f);
	_HP->setPercent(100);
	_HP->setPosition(Vec2(0, _monster->getContentSize().height / 2));
	this->addChild(_HP, 1);
	_filename = filename;
	this->schedule(schedule_selector(Monster::ChangeHp));
	return true;
}

std::string Monster::getMonsterName()
{
	return _monsterName;
}

void Monster::setMonsterName(std::string monsterName)
{
	_monsterName = monsterName;
}

void Monster::setMonsterGold(int monsterGold)
{
	_monsterGold = monsterGold;
}

int Monster::getMonsterGold()
{
	return _monsterGold;
}

void Monster::setMonsterLifeValue(int monsterLifeValue)
{
	_monsterLifeValue = monsterLifeValue;
}

int Monster::getMonsterLifeValue()
{
	return _monsterLifeValue;
}

/*void Monster::setHp(LoadingBar* HP)
{
	_HP = HP;
}

LoadingBar* Monster::getHP()
{
	return _HP;
}*/

void Monster::setHPInterval(float HPInterval)
{
	_HPInterval = HPInterval;
}

float Monster::getHPInterval()
{
	return _HPInterval;
}

void Monster::runAnimation( float delay, int animNum,std::string monsterName)
{
	Animation* animation = Animation::create();
	for (unsigned int i = 1; i < animNum;i++)
	{
		std::string frameName = monsterName;
		frameName.append(StringUtils::format("%d.png", i));
		animation->addSpriteFrameWithFile(frameName.c_str());
	}
	animation->setDelayPerUnit(delay);
	animation->setLoops(-1);
	animation->setRestoreOriginalFrame(true);
	animate = Animate::create(animation);
	_monster->runAction(animate);
}

void Monster::stopAnimation()
{
	_monster->stopAction(animate);
}

void Monster::ChangeHp(float dt)
{
	_HP->setPercent(_HPInterval/_monsterLifeValue*100);
}


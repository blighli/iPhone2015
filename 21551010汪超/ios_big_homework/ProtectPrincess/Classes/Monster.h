#ifndef _MONSTER_H_
#define _MONSTER_H_
#include"cocos2d.h"
#include "SpriteBase.h"
#include"ui/CocosGUI.h"
using namespace ui;
USING_NS_CC;
class Monster :public SpriteBase
{
protected:
	std::string _monsterName;
	int _monsterGold;
	int _monsterLifeValue;
	Sprite* _monster;
	LoadingBar* _HP;
	float _HPInterval;//怪物血条的更新量
	Animate* animate;
public:
	static Monster* create(std::string filename);
	virtual bool init(std::string filename);
	std::string getMonsterName();
	Monster(){ _HPInterval = 100; };
	void setMonsterName(std::string monsterName);
	void setMonsterGold(int monsterGold);
	int getMonsterGold();
	void setMonsterLifeValue(int monsterLifeValue);
	int getMonsterLifeValue();
	void setHp(LoadingBar* HP);
	LoadingBar* getHP();
	void setHPInterval(float HPInterval);
	float getHPInterval();
	std::string _filename;
	void runAnimation(float delay, int animNum, std::string monsterName);
	void stopAnimation();
	void ChangeHp(float dt);
};
#endif
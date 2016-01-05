#ifndef __MONSTER_MANAGER__
#define __MONSTER_MANAGER__

#include "cocos2d.h"
#include "ui/CocosGUI.h"

class Monster;
class Player;
class GameTiledMap;

class RoleManager : public cocos2d::Node
{
public:
	RoleManager();
	virtual ~RoleManager();

	virtual bool init();
	//called in per frame if updateSchedule
	virtual void update(float delta);
	CREATE_FUNC(RoleManager);

	void initMonster();//init monster which is need called behind bindPlayer and bindMap
	void initMonsterPos(Monster* monster);
	void bindMap(GameTiledMap* newBindMap);
	void bindPlayer(Player* newBindPlayer);
	void bindPlayerHP(cocos2d::ui::LoadingBar* newPlayerHP);

	void updateMonster(Monster* mon);
	void updatePlayer(Monster* mon);
	void updateBoss(Monster* boss);

	void monsterKilled(cocos2d::Ref* r);
protected:
	cocos2d::Vector<Monster*> m_monsters;
	Monster* m_boss;
	int m_monstersAliveNum;
	int m_monsterKilledNum;
	Player* m_bindPlayer;//bind the player object
	GameTiledMap* m_bindMap;//bind the map

	cocos2d::ui::LoadingBar* m_bindPlayerHP;
};

#endif //__MONSTER_MANAGER__
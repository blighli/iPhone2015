#ifndef __MONSTER__
#define __MONSTER__

#include "cocos2d.h"
#include "ui/CocosGUI.h"
#include "Entity.h"


class Monster : public Entity
{
public:
	Monster();
	virtual ~Monster();

	virtual bool init();
	CREATE_FUNC(Monster);

	virtual void reduceLife(int reducedLife);
	virtual Rect getWeaponRect();
	virtual Rect getEntityRect();

	virtual void stand();
	virtual void run();
	virtual void attack();
	virtual void endure();
	virtual void die();

	void runToLeft(int length);
	void runToRight(int length);

	void resetData();//reset the data when come back alive
	void hide();
	void show();
	const bool& isAlive() const;
	const bool& isBoss() const;
	const bool& isAttackBehind() const;
	void bossResetData();
protected:
	bool m_isAlive;
	bool m_isBoss;
	bool m_isAttackBehind;
	cocos2d::ui::LoadingBar* m_monsterHP;
};

#endif
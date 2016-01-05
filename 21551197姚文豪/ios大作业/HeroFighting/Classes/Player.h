#ifndef __GAME_PLAYER__
#define __GAME_PLAYER__

#include "cocos2d.h"
#include "Entity.h"

class Player : public Entity
{
public:
	Player();
	virtual ~Player();

	static Player* createPlayer();
	virtual bool init();
	CREATE_FUNC(Player);

	virtual void stand();
	virtual void run();
	virtual void attack();
	virtual void endure();
	virtual void die();
	void skill();

	void completeLastAttack();

	virtual void reduceLife(int reducedLife);
	virtual Rect getWeaponRect();
	virtual Rect getEntityRect();
	Rect getSkillRect();//skill's rect, which will damage monster when hit
	const bool& isSkillCD() const;
	void setSkillCD(bool newIsSkillCD);
private:
	bool m_isSkillCD;
	bool m_isPlayEffect;
	unsigned int m_attackEffectId;
};


#endif //__GAME_PLAYER__
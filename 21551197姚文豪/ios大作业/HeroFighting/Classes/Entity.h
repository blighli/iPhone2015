#ifndef __GAME_ENTITY__
#define __GAME_ENTITY__

#include "cocos2d.h"
#include "cocostudio/Cocostudio.h"

USING_NS_CC;

enum class ActionState;

class Entity: public Node
{
public:
	Entity();
	virtual ~Entity();

	virtual void stand();
	virtual void run();
	virtual void attack();
	virtual void endure();
	virtual void die();

	virtual Node* getEntityNode();
	virtual Rect getWeaponRect() = 0;
	virtual Rect getEntityRect() = 0;

	const int& getLife() const;
	void setLife(int newLife);
	virtual void reduceLife(int reducedLife) = 0;

	const int& getAtk() const;
	void setAtk(int newAtk);

	const int& getDir() const;
	void setDir(int newDir);

	const ActionState& getState() const;
	void setState(ActionState newState);

	const bool& isInvincible() const;
	void setInvincible(bool newIsInvincible);
protected:
	int m_life;//total life 
	int m_atk;//attack power
	int m_dir;//the direction
	ActionState m_state;//the state of action
	bool m_isInvincible;//is no die state, in this state, entity can run, attack and so on but not endure 
	Node* m_entityNode;
	cocostudio::timeline::ActionTimeline* m_entityAction;
	cocostudio::timeline::SkeletonNode* m_entitySkeletonNode;
};


#endif//__GAME_ENTITY__
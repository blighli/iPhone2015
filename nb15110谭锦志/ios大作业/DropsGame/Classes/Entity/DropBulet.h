#pragma once
#include "cocos2d.h"
#include "Drop.h"
USING_NS_CC;
using namespace cocos2d;

enum Dir
{
	Up,
	Down,
	Left,
	Right
};

class DropBullet : public Sprite
{
public:

	Dir getDir() { return m_Direction; } // return direction of current bullet
	bool  isAlive() { return m_Alive; }  // return life state of current bullet
	float getR() { return m_R; }
	Rect getRect() { return m_Rect; }    // return rect of bullet

	static DropBullet* createSprite(Vec2 postion, Dir direction, int speed);
	virtual bool init(Vec2 postion, Dir direction, int speed);

	// bullet dispear
	void explode_dispear(Sprite *pSender);

	// dispear 
	void combine_dispear();

	// bullet join to drop
	void combine();

	void update(float delta);

	void blast();  // bullet explode

private:
	Dir    m_Direction;
	int    m_Speed;
	bool   m_Alive;     // show bullet

	Sprite * m_Sprite;
	Rect m_Rect;

	float m_R;  // contack distance

	Animate * m_AnimateBoom;
};

#pragma once
#include "cocos2d.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"

#include "DropBulet.h"

USING_NS_CC;
using namespace cocos2d;
using namespace cocos2d::ui;
using namespace cocostudio;
enum DropsType
{
	Drops_zero,
	Drops_one,       // one drop
	Drops_two,		 // two drops
	Drops_three,	 // three drops
	Drops_four,		 // four drops
	Drops_five		 // explode
};

class Drop : public Sprite
{
public:
	virtual bool init(Vec2 position, DropsType type);
	static Drop* createSprite(Vec2 position, DropsType type);

	void blast();

	// drop shap dispear func
	void drop_dispear();

	// drop upgrade
	void drop_upgrade();

	// create bullet
	void create_bullet(Vec2 position);

	void setState(DropsType state);
	DropsType getState() { return m_Type; }
	float getR() { return m_R; }

	bool isAlive() { return m_Alive; }
	Rect getRect() { return m_Rect; }
private:
	DropsType m_Type;  // type
	bool m_Alive;      // life
	Rect m_Rect;
	Sprite *m_Sprite;

	float m_R;  // contack distance

	Texture2D * m_Texture_1;
	Texture2D * m_Texture_2;
	Texture2D * m_Texture_3;
	Texture2D * m_Texture_4;
public:
	bool m_IsAtacking;
};


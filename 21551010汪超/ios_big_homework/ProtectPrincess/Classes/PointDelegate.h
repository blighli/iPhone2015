#ifndef _POINTDELEGATE_H_
#define _POINTDELEGATE_H_
#include"cocos2d.h"
USING_NS_CC;
class PointDelegate :public Ref
{
	float _x;
	float _y;
public:
	static PointDelegate* create(float x, float y)
	{
		auto sprite = new PointDelegate();
		if (sprite&&sprite->initPoint(x,y))
		{
			sprite->autorelease();
			return sprite;
		}
		CC_SAFE_DELETE(sprite);
		return nullptr;
	}
	bool initPoint(float x,float y)
	{
		_x = x;
		_y = y;
		return true;
	}
	void setX(float x)
	{
		_x = x;
	}
	float getX()
	{
		return _x;
	}
	void setY(float y)
	{
		_y = y;
	}
	float getY()
	{
		return _y;
	}
};
#endif
#ifndef _LEVELDATA_H_
#define _LEVELDATA_H_
#include<iostream>
#include"cocos2d.h"
USING_NS_CC;
class LevelData :public Ref
{
protected:
	int _number;
	std::string _bg;
	std::string _data;
public:
	static LevelData* create(int number, std::string bg, std::string data)
	{
		LevelData* sprite = new LevelData();
		if (sprite)
		{
			sprite->autorelease();
			sprite->setNumber(number);
			sprite->setBg(bg);
			sprite->setData(data);
			return sprite;
		}
		CC_SAFE_DELETE(sprite);
		return nullptr;
	}
	void setNumber(int number){ _number = number; }
	int getNumber(){ return _number; }
	void setBg(std::string bg){ _bg = bg; }
	std::string getBg(){ return _bg; }
	void setData(std::string data){ _data = data; }
	std::string getData(){ return _data; }
};
#endif
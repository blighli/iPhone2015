#ifndef _CLOCK_H_
#define _CLOCK_H_
#include"cocos2d.h"
USING_NS_CC;
class Tclock :public Sprite
{
protected:
	Label* _label1;
	Label* _label2;
	Label* _label3;
public:
	static Tclock* create();
	bool init();
	void runclock();
};
#endif
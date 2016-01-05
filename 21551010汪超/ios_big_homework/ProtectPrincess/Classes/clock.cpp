#include "clock.h"

Tclock* Tclock::create()
{
	Tclock* bRet = new(std::nothrow)Tclock();
	if (bRet&&bRet->init())
	{
		bRet->autorelease();
		return bRet;
	}
	else
	{
		delete bRet;
		bRet = NULL;
		return NULL;
	}
}

bool Tclock::init()
{
	
	return true;
}

void Tclock::runclock()
{

}

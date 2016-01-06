
#ifndef  _MY_UTILITY_H_
#define  _MY_UTILITY_H_

#include "cocos2d.h"

USING_NS_CC;

using namespace std;

class MyUtility 
{
public:
	static string getCurrentTime();

	static string gbk_2_utf8(const string text);

	static string getUTF8Char(const string key);

};

#endif // _MY_UTILITY_H_

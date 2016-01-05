#pragma once

#include "cocos2d.h"
#include <iostream>
USING_NS_CC;
using namespace cocos2d;

// data type for read or save
enum DataType
{
	UserName,
	TopLevel,
	TopLevelTime,
	GameLevel,
	GameScore,
	GameDrops
};

// input file data
struct InputData
{
	int zero;
	int one;
	int two;
	int three;
	int four;
};

// game info
struct GameInfo
{
	int game_version;
	std::string default_usernaem;
	int max_classical_level;
	int max_extreme_level;
	int init_tank_drops;
};

class DataUtils
{
public:
	static void save(DataType type, std::string data);
	static std::string read(DataType type);
	static InputData read(const char* filename);      // read data form file
	static GameInfo game_info(const char* filename);
};


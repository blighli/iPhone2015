#include "DataUtils.h"
#include <iostream>

#define UDefault (UserDefault::getInstance())

// user prefrence data save
void DataUtils::save(DataType type, std::string data)
{
	switch (type)
	{
	case UserName:
		{
			UDefault->setStringForKey("UserName", data);
		}
		break;
	case TopLevel:
		{
			UDefault->setStringForKey("TopLevel", data);
		}
		break;
	case TopLevelTime:
		{
			UDefault->setStringForKey("TopLevelTime", data);
		}
		break;
	case GameLevel:
		{
			UDefault->setStringForKey("CurrentGameLevel", data);
		}
		break;
	case GameScore:
		{
			UDefault->setStringForKey("GameScore", data);
		}
		break;
	case GameDrops:
		{
			UDefault->setStringForKey("GameDrops", data);
		}
		break;
	}
}

// user prefrence data read
std::string DataUtils::read(DataType type)
{
	switch (type)
	{
	case UserName:
		return UDefault->getStringForKey("UserName");
		break;
	case TopLevel:
		return UDefault->getStringForKey("TopLevel");
		break;
	case TopLevelTime:
		return UDefault->getStringForKey("TopLevelTime");
		break;
	case GameLevel:
		return UDefault->getStringForKey("CurrentGameLevel");
		break;
	case GameScore:
		return UDefault->getStringForKey("GameScore");
		break;
	case GameDrops:
		return UDefault->getStringForKey("GameDrops");
		break;
	}
}

InputData DataUtils::read(const char* filename)
{
	//FILE * file = fopen(FileUtils::getInstance()->fullPathForFilename(filename).c_str(), "r+");
	int zero, one, two, three, four;

	// zero to four
	//if (fscanf(file, "zero:%d one:%d two:%d three:%d four:%d", &zero, &one, &two, &three, &four))
	//{
	//	log("read");
	//} else {
	//	fprintf(file, "Error reading an integer from file.\n");
	//	exit(1);
	//}
    auto tmp = FileUtils::getInstance()->getStringFromFile(filename);
    sscanf(tmp.c_str(), "zero:%d one:%d two:%d three:%d four:%d", &zero, &one, &two, &three, &four);

	InputData result;
	result.zero = zero;
	result.one = one;
	result.two = two;
	result.three = three;
	result.four = four;

	return result;
}

GameInfo DataUtils::game_info(const char* filename)
{
	//FILE * file = fopen(FileUtils::getInstance()->fullPathForFilename(filename).c_str(), "r+");
    //if (file == NULL) {
    //    fprintf(stderr, "open file:%s\n", strerror(errno));
    //    exit(EXIT_FAILURE);
    //}
	int maxClassicalLevel, maxExtremeLevel, gameVersion, initTankDrops;
	char userName[10];
	//if (fscanf(file, "gameVersion:%d userName:%s maxClassicalLevel:%d maxExtremeLevel:%d initTankDrops:%d", &gameVersion, userName, &maxClassicalLevel, &maxExtremeLevel, &initTankDrops))
	//{
	//	log("read");
	//}
	//else {
	//	fprintf(file, "Error reading an integer from file.\n");
	//	exit(1);
	//}
    auto tmp = FileUtils::getInstance()->getStringFromFile(filename);
    sscanf(tmp.c_str(), "gameVersion:%d userName:%s maxClassicalLevel:%d maxExtremeLevel:%d initTankDrops:%d",&gameVersion,userName, &maxClassicalLevel, &maxExtremeLevel, &initTankDrops);
	GameInfo result;
	result.default_usernaem = gameVersion;
	result.max_classical_level = maxClassicalLevel;
	result.default_usernaem = userName;
	result.max_extreme_level = maxExtremeLevel;
	result.init_tank_drops = initTankDrops;
	return result;
}


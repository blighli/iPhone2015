#ifndef _SOUNDMANAGER_H_
#define _SOUNDMANAGER_H_
#include"cocos2d.h"
#include"SimpleAudioEngine.h"
USING_NS_CC;
using namespace CocosDenshion;
enum MUSIC_TYPE
{
	MUSIC_TYPE_BACKGROUND,
	MUSIC_TYPE_BACKGROUND1,
};
enum EFFECT_TYPE
{
	EFFECT_TYPE_FAT,
	EFFECT_TYPE_LAND,
	EFFECT_TYPE_ERROR,
	EFFECT_TYPE_BULLET,
	EFFECT_TYPE_DIE,
};
class Sound
{
public:
	static Sound* getInstance();
	static void freeInstance();
private:
	static Sound* m_sound;
	char* getMusic(MUSIC_TYPE);
	char* getEffect(EFFECT_TYPE);
	Sound();
public:
	void playEffect(EFFECT_TYPE type);
	void playBgMusic(MUSIC_TYPE type);
	void stopMusic();
};
#endif
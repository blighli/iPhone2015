#pragma once

#include "cocos2d.h"
#include "SimpleAudioEngine.h"
USING_NS_CC;
using namespace cocos2d;
using namespace CocosDenshion;

class Audio
{
public:

	// …Ë÷√“Ù¡ø
	static void set_volume(float volume);

	// ªÒ»°“Ù¡ø
	static float get_volume();

	// ≤•∑≈±≥æ∞“Ù¿÷
	static void play_bgmusic(const char* filename);

	// ≤•∑≈“Ù–ß
	static void play_effect(const char* filename);

	// æ≤“Ù
	static void pause();

	// …˘“Ùª÷∏¥
	static void resume();

private:
	static void set_bg_volume(float  volume);
	static void set_ef_volume(float volume);
};

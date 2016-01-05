#include "Audio.h"
#include "../DataUtils/DataUtils.h"

void Audio::set_volume(float volume)
{
	UserDefault::getInstance()->setFloatForKey("Volume", volume);
	set_bg_volume(volume);
	set_ef_volume(volume);
}

float Audio::get_volume()
{
	return UserDefault::getInstance()->getFloatForKey("Volume");
}

/////////////////////////////////bg music/////////////////////////////////////////
void Audio::play_bgmusic(const char* filename)
{
	if (!UserDefault::getInstance()->getIntegerForKey("Volume-init"))
	{
		UserDefault::getInstance()->setIntegerForKey("Volume-init", 1);
		set_volume(0.2);
	}
	SimpleAudioEngine::getInstance()->playBackgroundMusic(filename);
}

void Audio::set_bg_volume(float volume)
{
	SimpleAudioEngine::getInstance()->setBackgroundMusicVolume(volume);
}

///////////////////////////////////effect///////////////////////////////////////
void Audio::play_effect(const char* filename)
{
	if (!UserDefault::getInstance()->getIntegerForKey("Volume-init"))
	{
		UserDefault::getInstance()->setIntegerForKey("Volume-init", 1);
		set_volume(0.2);
	}
	SimpleAudioEngine::getInstance()->playEffect(filename);
}

void Audio::pause()
{
    UserDefault::getInstance()->setFloatForKey("volume_stack", get_volume());
    set_volume(0.0f);
}

void Audio::resume()
{
    set_volume(UserDefault::getInstance()->getFloatForKey("volume_stack"));
	// SimpleAudioEngine::getInstance()->resumeBackgroundMusic();
	// SimpleAudioEngine::getInstance()->resumeAllEffects();
}

void Audio::set_ef_volume(float volume)
{
	SimpleAudioEngine::getInstance()->setEffectsVolume(volume);
}

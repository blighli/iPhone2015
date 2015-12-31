#include"SoundManager.h"
Sound* Sound::m_sound = NULL;
Sound* Sound::getInstance()
{
	if (m_sound==NULL)
	{
		m_sound = new Sound();
	}
	return m_sound;
}
void Sound::freeInstance()
{
	if (m_sound!=NULL)
	{
		m_sound = NULL;
	}
}
Sound::Sound()
{
	auto audio = SimpleAudioEngine::getInstance();
	audio->preloadBackgroundMusic(getMusic(MUSIC_TYPE_BACKGROUND));
	audio->preloadEffect(getEffect(EFFECT_TYPE_FAT));
	audio->preloadEffect(getEffect(EFFECT_TYPE_ERROR));
	audio->preloadEffect(getEffect(EFFECT_TYPE_BULLET));
	audio->preloadEffect(getEffect(EFFECT_TYPE_DIE));
	audio->preloadBackgroundMusic(getEffect(EFFECT_TYPE_LAND));
	audio->setBackgroundMusicVolume(0.0f);
}
char* Sound::getMusic(MUSIC_TYPE type)
{
	switch (type)
	{
	case MUSIC_TYPE_BACKGROUND:
#if(CC_TARGET_PLATFORM==CC_PLATFORM_WIN32)
		return "sound/background.wav";
#elif(CC_TARGET_PLATFORM==CC_PLATFORM_ANDROID)
		return "sound/background.wav";
#endif
		break;
	default:
		break;
	}
	return NULL;
}
char* Sound::getEffect(EFFECT_TYPE type)
{
	switch (type)
	{
	case EFFECT_TYPE_FAT:
		return "sound/Fat141.wav";
		break;
	case EFFECT_TYPE_LAND:
		return "sound/Land232.wav";
		break;
	case EFFECT_TYPE_ERROR:
		return "sound/error.wav";
		break;
	case EFFECT_TYPE_BULLET:
		return "sound/bullet.wav";
		break;
	case EFFECT_TYPE_DIE:
		return "sound/peng.wav";
		break;
	default:
		break;
	}
	return NULL;
}
void Sound::playBgMusic(MUSIC_TYPE type)
{
	auto audio = SimpleAudioEngine::getInstance();
	if (!audio->isBackgroundMusicPlaying())
	{
		audio->playBackgroundMusic(this->getMusic(type), true);
	}
	else
	{
		audio->resumeBackgroundMusic();
	}
}
void Sound::playEffect(EFFECT_TYPE type)
{
	auto audio = SimpleAudioEngine::getInstance();
	audio->playEffect(this->getEffect(type));
}
void Sound::stopMusic()
{
	auto audio = SimpleAudioEngine::getInstance();
	audio->stopBackgroundMusic(true);
}
#include "SimpleAudioEngine.h"

#define SOUND_KEY "sound_key"
#define MUSIC_KEY "music_key"

#define HIGHSCORE_KEY "highscore_key"

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)

#define bg_music_1   "sound/home_bg.aifc"
#define bg_music_2  "sound/game_bg.aifc"
#define sound_1   "sound/Blip.caf"
#define sound_2   "sound/Explosion.caf"

#elif (CC_TARGET_PLATFORM == CC_PLATFORM_WP8)

#define bg_music_1   "sound/home_bg.wav"
#define bg_music_2  "sound/game_bg.wav"
#define sound_1   "sound/Blip.wav"
#define sound_2   "sound/Explosion.wav"

#else

#define bg_music_1   "sound/home_bg.mp3"
#define bg_music_2  "sound/game_bg.mp3"
#define sound_1   "sound/Blip.wav"
#define sound_2   "sound/Explosion.wav"

#endif


using namespace CocosDenshion;

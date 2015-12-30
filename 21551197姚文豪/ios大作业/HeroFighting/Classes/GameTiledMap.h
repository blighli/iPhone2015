#ifndef __GAME_TILEDMAP__
#define __GAME_TILEDMAP__

#include "cocos2d.h"

USING_NS_CC;

class GameTiledMap : public Node
{
public:
	virtual bool init();
	CREATE_FUNC(GameTiledMap);
	//create game map by the level
	static GameTiledMap* createGameMap(int level);
	bool initMap(int level);

	TMXTiledMap* getTiledMap();
	float getMapWidth();
	float getMapHeight();
	Vec2 calTilePosByPos(Vec2 pos);//calculate the pos in tiledmap by pos in game
	bool isCollidable(Vec2 pos);
private:
	TMXTiledMap* m_map;
};

#endif //__GAME_TILEDMAP__

#include "GameTiledMap.h"

bool GameTiledMap::init()
{
	if (!Node::init()){
		return false;
	}
	return true;
}

bool GameTiledMap::initMap(int level)
{
	switch (level)
	{
	case 1:
		m_map = TMXTiledMap::create("map/map1.tmx");
		break;
	case 2:
		m_map = TMXTiledMap::create("map/map1.tmx");
		break;
	case 3:
		m_map = TMXTiledMap::create("map/map1.tmx");
		break;
	default:
		break;
	}
	addChild(m_map);

	return true;
}

GameTiledMap* GameTiledMap::createGameMap(int level)
{
	auto gameMap = GameTiledMap::create();
	if (!gameMap->initMap(level)){
		return nullptr;
	}
	return gameMap;
}

TMXTiledMap* GameTiledMap::getTiledMap()
{
	return m_map;
}

float GameTiledMap::getMapWidth()
{
	return m_map->getMapSize().width * m_map->getTileSize().width;
}

float GameTiledMap::getMapHeight()
{
	return m_map->getMapSize().height * m_map->getTileSize().height;
}

//calculate the pos in tiledmap by pos in game
Vec2 GameTiledMap::calTilePosByPos(Vec2 pos)
{
	auto tiledSize = m_map->getTileSize();
	auto mapSize = m_map->getMapSize();
	int x = pos.x / tiledSize.width;
	int y = mapSize.height - pos.y / tiledSize.height - 1;
	return Vec2(x,y);
}

//detect the pos if is collidable
bool GameTiledMap::isCollidable(Vec2 pos)
{
	auto layer = m_map->getLayer("barrier");
	auto tilePos = calTilePosByPos(pos);
	auto tiledGid = layer->getTileGIDAt(tilePos);

	//not zero means the grid exist
	if (tiledGid != 0){
		auto properties = m_map->getPropertiesForGID(tiledGid);
		auto prop = properties.asValueMap().at("Collidable");//get collidable property value
		if (prop.asString().compare("true") == 0){
			return true;
		}
	}
	return false;
}
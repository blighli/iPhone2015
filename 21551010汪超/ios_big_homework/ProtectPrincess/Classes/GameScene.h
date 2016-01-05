#ifndef _GAMESCENE_H_
#define _GAMESCENE_H_
#include"MonsterData.h"
#include"TurretData.h"
#include"Monster.h"
#include"PointDelegate.h"
#include"cocos2d.h"
#include"GameOver.h"
#include"SimpleAudioEngine.h"
//#include"SoundManager.h"
#include"Turret.h"
#include"Bullet.h"
#include"Monster.h"
#include<cocos-ext.h>
USING_NS_CC;
using namespace CocosDenshion;
class GameScene :public Layer
{
protected:
	TMXTiledMap* _tileMap;//地图
	TMXLayer* _collidable;//障碍层
	std::string _tileName;//关卡名称
	int _number;//怪物的波数
	int _currentCount;//当前出现的怪物的数量
	int _currNum;//当前怪物的波数
	int _goldValue;//玩家当前的金币值
	Sprite* _princess;//公主
	int _visibleWidth;//屏幕宽
	int _visibleHeight;//屏幕高
	int _count;//帧数
	int _delivery;//出现怪物取模基数
	float m_fScore;//金钱数
	Vector<MonsterData* >_monsterDatas;
	Vector<TurretData* >_turretDatas;
	Vector<PointDelegate* >_pathPoints;
	Label* _label1;
	Label* _label2;
	Label* _label3;
	Label* _numberLabel;//怪物的波数
	Label* _currNumLabel;//当前的波数
	Label* _goldLabel;//当前的金钱数
	bool _touchButton;
protected:
	Vector<Monster*>_monsterVector;
	bool _isFinish = false;//判断是否可以出现怪物
	Monster* _monster;
	Monster* monster;
	Sprite* _transparentTurret;
	Sprite* option_box;
	int princessX;//公主的x坐标位置
	int princessY;//公主的y坐标位置
	Vec2 princessLocation;
	bool _isSelect = false;
	Vector<Bullet* >_bulletVector;
	std::string animationName;
	int initMoney;
	//Sound* _sound;
	bool _isShoot;//判断塔有没有发射子弹
	float _degree;
	Vector<Turret* >_turretVector;//存放已经放置在屏幕上的塔
public:
	static Scene* createSceneWithLevel(int selectLevel);
	virtual bool init(); 
	Vec2 locationForTilePos(Vec2 pos);
	Vec2 tileCoordForPosition(Vec2 position); 
	CREATE_FUNC(GameScene);
	GameScene();
	~GameScene();
	void onEnterTransitionDidFinish();
	void update(float dt);
	void LoadData();
public:
	Animate* getAnimateByName(std::string animName,float delay,int animNum);
	void monsterMoveWithWayPoints(Vector<PointDelegate*>pathVector,Monster* monster);
	void updateHUD(float dt);
	bool getCollidable(Vec2 position);
	void updateMonster(float delta);
	void updateDistance(float dt);
	bool calDistance(Vec2, Vec2, float & _degree);
	void isCollision(float dt);
};
#endif
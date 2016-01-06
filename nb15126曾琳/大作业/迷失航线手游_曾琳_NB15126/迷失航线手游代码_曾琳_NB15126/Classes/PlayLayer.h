#ifndef __PLAYLAYER_H__
#define __PLAYLAYER_H__

#include "cocos2d.h"
#include "HomeLayer.h"
#include "SystemHeader.h"

#define GameSceneNodeTagStatusBarFighterNode		301
#define GameSceneNodeTagStatusBarLifeNode			302
#define GameSceneNodeTagStatusBarScore				303

#define GameSceneNodeBatchTagBackground				800
#define GameSceneNodeTagFighter						900
#define GameSceneNodeTagExplosionParticleSystem		901
#define GameSceneNodeBatchTagBullet					902
#define GameSceneNodeBatchTagEnemy					903

//�����ڵ����ٶ�
#define GameSceneBulletVelocity						300

#include "cocos2d.h"
#include "Enemy.h"
#include "Fighter.h"
#include "Bullet.h"
#include "GameOverLayer.h"

#include "SystemHeader.h"

//���� ���ٵ��˻�õķ���.
typedef enum
{
	EnemyStone_Score = 5,
	Enemy1_Score = 10,
	Enemy2_Score = 15,
	EnemyPlanet_Score = 20
} EnemyScores;


class GamePlayLayer : public cocos2d::Layer
{
private:

	Fighter* fighter;
	cocos2d::Menu* menu;
	//����
	int score;
	//��¼0~999����
	int scorePlaceholder;
	cocos2d::EventListenerTouchOneByOne *touchFighterlistener;
	cocos2d::EventListenerPhysicsContact *contactListener;

public:
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();

	virtual void onExit();
	virtual void onEnter();
	virtual void onEnterTransitionDidFinish();

	//�����ڵ�.
	void shootBullet(float dt);
	//��ʼ������.
	void initBG();

	//��״̬�������ú͸�����ҵ�����ֵ.
	void updateStatusBarFighter();
	//��״̬���и��µ÷�.
	void updateStatusBarScore();

	void menuPauseCallback(cocos2d::Ref* pSender);
	void menuBackCallback(cocos2d::Ref* pSender);
	void menuResumeCallback(cocos2d::Ref* pSender);

	//�����������˵���ײ���
	void handleFighterCollidingWithEnemy(Enemy* enemy);

	//�����ӵ�����˵���ײ���
	void handleBulletCollidingWithEnemy(Enemy* enemy);

	// implement the "static create()" method manually
	CREATE_FUNC(GamePlayLayer);
};
















#endif // __PLAYLAYER_H__

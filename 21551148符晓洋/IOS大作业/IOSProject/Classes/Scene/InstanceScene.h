#ifndef __INSTANCE_SCENE_H__
#define __INSTANCE_SCENE_H__
#include "Rat.h"
#include "Piglet.h"
#include "Mage.h"
#include "Dragon.h"
#include "cocos2d.h"
#include "Particle3D/CCParticleSystem3D.h"
#include "Particle3D/PU/CCPUParticleSystem3D.h"

using namespace cocos2d;

class InstanceScene : public Scene
{
public:

	static InstanceScene* createScene();
	InstanceScene();
	~InstanceScene();

    bool init();

	void initPlayerUI();
	void initFightButton();
	void update(float dt);

	bool onTouchesBegan(Touch* touch, Event* event);
	void onTouchesMoved(Touch* touch, Event* event);
	void onTouchesEnded(Touch* touch, Event* event);

	void showForwardHint(Vec3 target);
	void showDamageLabel();

	void onMageCollide(const Physics3DCollisionInfo &ci);
	void onMonsterCollide(const Physics3DCollisionInfo &ci);
	void onAttack(Ref* sender);
	void onSkill(Ref* sender);
	void goRestart(Ref* sender);

	void gameWon();
	void gameLose();

	float calculateDiatance(Vec3 v1, Vec3 v2);
	Size _vSize;

private:
	bool _isAttacking;
	bool _isSkilling;
	bool _isFinish;
	float _sceneScale;
	Camera* _camera;
	Camera* _camera2;
	Sprite3D* _ground;
	Sprite3D* _manaBall;
	Sprite* _building;
	PUParticleSystem3D* _lineStreak;

	Vec3 _offSet;
	Mage* _player;
	//Rat* _rat;
	//Piglet* _piglet;
	//Dragon* _dragon;

};

#endif

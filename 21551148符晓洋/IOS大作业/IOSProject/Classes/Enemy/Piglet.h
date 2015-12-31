#ifndef _PIGLET_H
#define _PIGLET_H
#include "cocos2d.h"
#include "Mage.h"
#include "physics3d/CCPhysics3D.h"
using namespace cocos2d;

#define GROUND_ABSX 320
#define GROUND_ABSZ 180

#define PATROL_RANGE 80//巡逻的距离范围
#define LEAST_DISTANCE 20//巡逻的最短距离
#define AI_SIGHT_RANGE 40//敌人的视野范围
#define AI_MELEE_RANGE 18//近战敌人的攻击范围
#define AI_STATE_IDLE 1
#define AI_STATE_PATROL 2
#define AI_STATE_FIGHT 3

//野猪动画帧的起止
/*
idle = createAnimation(file,0,40,0.7),
walk = createAnimation(file,135,147,1.5),
attack1 = createAnimation(file,45,60,0.7),
attack2 = createAnimation(file,60,75,0.7),
defend = createAnimation(file,92,96,0.7),
knocked = createAnimation(file,81,87,0.7),
dead = createAnimation(file,95,127,1)
*/
#define PIGLET_IDLE_START 0
#define PIGLET_IDLE_END 40
#define PIGLET_FORWARD_START 135
#define PIGLET_FORWARD_END 147
#define PIGLET_ATTACK_START 45
#define PIGLET_ATTACK_END 75
#define PIGLET_KNOCKED_START 81
#define PIGLET_KNOCKED_END 87
#define PIGLET_DEAD_START 95
#define PIGLET_DEAD_END 127
#define FRAME_RATE 30//动画播放的帧率
#define PIGLET_FORWARD_SPEED 20.0f//角色每一帧移动的单位长度
//角色的各种状态
#define PIGLET_IDLE 1
#define PIGLET_FORWARD 2
#define PIGLET_ATTACK 3
#define PIGLET_KNOCKED 4
#define PIGLET_DEAD 5

class Piglet :public cocos2d::PhysicsSprite3D //原来public cocos2d::Sprite3D 
{
public:
	static Piglet* create(std::string modelPath);
	void changeStateOnceOrRepeat(int state, int startFrame, int endFrame, int flag);
	void animateByState(int state);

	void updateState();
	void update(float dt);

	void aiPatrol();
	void aiFight();
	void aiTrack(Mage* player);
	void aiIdle();
	void aiCheckPos(Mage* player);

	int getHitCount();
	void setHitCount(int count);

	bool _isPlayerInSight;
	bool _isPlayerInRange;
	Vec3 _targetPos;
	float _headingAngle;
	Vec3 _headingAxis;
	bool _isAlive;


private:
	int _state;
	int _aiState;
	int _frameNum;
	int _hitCount;

	std::string _modelPath;
};
#endif
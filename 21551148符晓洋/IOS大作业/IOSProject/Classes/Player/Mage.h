#ifndef _MAGE_H
#define _MAGE_H

#include "cocos2d.h"
#include "physics3d/CCPhysics3D.h"
using namespace cocos2d;
//法师动画帧的起止
/*
idle = createAnimation(file, 206, 229, 0.7),
walk = createAnimation(file, 99, 119, 0.7),
attack1 = createAnimation(file, 12, 30, 0.7),
attack2 = createAnimation(file, 31, 49, 0.7),
specialattack1 = createAnimation(file, 56, 74, 0.2),
specialattack2 = createAnimation(file, 75, 92, 0.2),
defend = createAnimation(file, 1, 5, 0.7),
knocked = createAnimation(file, 126, 132, 0.7),
dead = createAnimation(file, 139, 199, 0.7)
*/

#define MAGE_IDLE_START 206
#define MAGE_IDLE_END 229
#define MAGE_FORWARD_START 99
#define MAGE_FORWARD_END 119
#define MAGE_ATTACK_START 31
#define MAGE_ATTACK_END 49
#define MAGE_SPATTACK_START 56
#define MAGE_SPATTACK_END 92
#define MAGE_DEFEND_START 1
#define MAGE_DEFEND_END 5
#define MAGE_KNOCKED_START 126
#define MAGE_KNOCKED_END 132
#define MAGE_DEAD_START 139
#define MAGE_DEAD_END 199
#define FRAME_RATE 30//动画播放的帧率
#define CAMERA_DISTANCE 110//斜45°角摄像机到角色的偏移距离
#define MAGE_FORWARD_SPEED 40.0f//角色每一帧移动的单位长度
	//角色的各种状态
#define MAGE_IDLE 1
#define MAGE_FORWARD 2
#define MAGE_ATTACK 3
#define MAGE_SPATTACK 4
#define MAGE_DEFEND 5
#define MAGE_KNOCKED 6
#define MAGE_DEAD 7

class Mage :public cocos2d::PhysicsSprite3D //原来public cocos2d::Sprite3D 
{
public:
	static Mage* create(std::string modelPath, Camera* cam);
	void changeStateOnceOrRepeat(int state, int startFrame, int endFrame,int flag);
	void animateByState(int state);
	void updateState();
	void update(float dt);
	Vec3 _targetPos;
	float _headingAngle;
	Vec3 _headingAxis;
	Vec3 _cameraOffset;
	Camera* _camera;
private:
	int _state;
	int _frameNum;
	std::string _modelPath;
};
#endif
#include "Piglet.h"
#include "cocos2d.h"
#define PLAYER_HEIGHT 0

void Piglet::changeStateOnceOrRepeat(int state, int startFrame, int endFrame, int flag)
{
	if (_state != state)
	{
		_state = state;
		auto animation = Animation3D::create(_modelPath);
		if (animation)
		{
			auto animate = Animate3D::createWithFrames(animation, startFrame, endFrame, FRAME_RATE);
			this->stopAllActions();
			if (flag != 1)
			{
				this->runAction(RepeatForever::create(animate));
			}
			else
			{
				this->runAction(animate);
				this->_frameNum = startFrame;
			}
		}
	}
}

void Piglet::animateByState(int state)
{
	switch (state)
	{
	case PIGLET_IDLE:
		this->changeStateOnceOrRepeat(PIGLET_IDLE, PIGLET_IDLE_START, PIGLET_IDLE_END, 2);
		break;
	case PIGLET_ATTACK:
		this->changeStateOnceOrRepeat(PIGLET_ATTACK, PIGLET_ATTACK_START, PIGLET_ATTACK_END, 1);
		break;
	case PIGLET_DEAD:

		this->changeStateOnceOrRepeat(PIGLET_DEAD, PIGLET_DEAD_START, PIGLET_DEAD_END, 1);
		break;
	case PIGLET_FORWARD:
		this->changeStateOnceOrRepeat(PIGLET_FORWARD, PIGLET_FORWARD_START, PIGLET_FORWARD_END, 2);
		break;
	case PIGLET_KNOCKED:
		this->changeStateOnceOrRepeat(PIGLET_KNOCKED, PIGLET_KNOCKED_START, PIGLET_KNOCKED_END, 1);
		break;
	default:
		break;
	}
}

void Piglet::update(float dt)
{
	switch (_state)
	{
	case PIGLET_IDLE:
		break;
	case PIGLET_FORWARD:
	{
						Vec3 curPos = this->getPosition3D();
						Vec3 newFaceDir = _targetPos - curPos;//新的脸朝向为目的坐标-当前坐标，从场景的OnTouchEnded获得
						newFaceDir.y = 0.0f;//只考虑xz平面上脸朝向的变化
						newFaceDir.normalize();
						Vec3 offset = newFaceDir*PIGLET_FORWARD_SPEED*dt;//向脸的朝向每秒位移n个单位
						curPos = curPos + offset;
						this->setPosition3D(curPos);
	}
		break;
	case PIGLET_KNOCKED:
		break;
	case PIGLET_ATTACK:
		break;
	case PIGLET_DEAD:
		break;
	default:
		break;
	}
	// transform player position to world coord
	auto playerPos = this->getPosition3D();//获得人物在父节点(层)中的空间三维坐标
	auto playerModelMat = this->getParent()->getNodeToWorldTransform();//得到人物所在父节点(层)的坐标向世界坐标转换的矩阵
	playerModelMat.transformPoint(&playerPos);//对人物所在点进行转换
	Vec3 Normal;
	float player_h = 0;//根据角色的x、z坐标获得高度
	if (Normal.isZero())//check the player whether is out of the terrain
	{
		player_h = playerPos.y;
	}
	else
	{
		player_h += PLAYER_HEIGHT;
	}
	this->setPositionY(player_h);

	Quaternion q2;
	q2.createFromAxisAngle(Vec3(0, 1, 0), (float)-M_PI, &q2);//此四元数表示绕y轴转过180度，即令角色转身

	Quaternion headingQ;
	headingQ.createFromAxisAngle(_headingAxis, _headingAngle, &headingQ);
	this->setRotationQuat(headingQ*q2);
	this->updateState();
}

void Piglet::updateState()
{
	switch (_state)
	{
	case PIGLET_FORWARD:
	{
						//若角色位置已到目标位置，则切换待命状态
						Vec2 player_pos = Vec2(this->getPositionX(), this->getPositionZ());
						Vec2 targetPos = Vec2(_targetPos.x, _targetPos.z);
						auto dist = player_pos.distance(targetPos);
						if (dist < 1)
						{
							//this->animateByState(RAT_IDLE);
							this->aiPatrol();
						}
	}
		break;
	case PIGLET_KNOCKED:
	{
						this->_frameNum++;
						if (this->_frameNum >= PIGLET_KNOCKED_START + (60 / FRAME_RATE)*(PIGLET_KNOCKED_END - PIGLET_KNOCKED_START))
						{
							this->animateByState(PIGLET_IDLE);
						}
	}
		break;
	case PIGLET_ATTACK:
	{
					   this->_frameNum++;
					   if (this->_frameNum >= PIGLET_ATTACK_START + (60 / FRAME_RATE)*(PIGLET_ATTACK_END - PIGLET_ATTACK_START))//由于游戏默认60帧，动画默认30帧，所以需将帧间隔乘一比例
					   {
						   _hitCount++;
						   this->animateByState(PIGLET_IDLE);
					   }
	}
		break;
	case PIGLET_DEAD:
	{
					 this->_frameNum++;
					 if (this->_frameNum >= PIGLET_DEAD_START + (60 / FRAME_RATE)*(PIGLET_DEAD_END - PIGLET_DEAD_START))
					 {

						   this->animateByState(PIGLET_IDLE);
					 }
	}
		break;
	default:
		break;
	}
}

Piglet*  Piglet::create(std::string modelPath)
{
	auto sprite = new (std::nothrow) Piglet();
	if (sprite && sprite->initWithFile(modelPath))
	{
		sprite->_headingAngle = 0;
		sprite->_modelPath = modelPath;
		sprite->animateByState(PIGLET_IDLE);
		sprite->aiPatrol();
		sprite->autorelease();
		sprite->scheduleUpdate();
		sprite->_isPlayerInSight = false;
		sprite->_isPlayerInRange = false;
		sprite->_isAlive = true;
		sprite->_hitCount = 0;
		return sprite;
	}
	delete sprite;
	sprite = nullptr;
	return nullptr;
}

void Piglet::aiIdle()
{
	this->animateByState(AI_STATE_IDLE);
}

void Piglet::aiFight()
{
	if (this->_aiState != AI_STATE_FIGHT)
	{
		this->_aiState = AI_STATE_FIGHT;
	}
	this->animateByState(PIGLET_ATTACK);
}

void Piglet::aiPatrol()
{
	int direction = rand() % 4;
	float pos_x, pos_y, pos_z;
	switch (direction)
	{
	case 0:
		pos_x = this->getPositionX() + rand() % PATROL_RANGE + LEAST_DISTANCE;
		pos_z = this->getPositionZ() + rand() % PATROL_RANGE + LEAST_DISTANCE;
		break;
	case 1:
		pos_x = this->getPositionX() + rand() % PATROL_RANGE + LEAST_DISTANCE;
		pos_z = this->getPositionZ() - rand() % PATROL_RANGE + LEAST_DISTANCE;
		break;
	case 2:
		pos_x = this->getPositionX() - rand() % PATROL_RANGE + LEAST_DISTANCE;
		pos_z = this->getPositionZ() + rand() % PATROL_RANGE + LEAST_DISTANCE;
		break;
	case 3:
		pos_x = this->getPositionX() - rand() % PATROL_RANGE + LEAST_DISTANCE;
		pos_z = this->getPositionZ() - rand() % PATROL_RANGE + LEAST_DISTANCE;
		break;
	default:
		break;
	}
	if (abs(pos_x) > GROUND_ABSX || abs(pos_z) > GROUND_ABSZ)
	{
		return;
	}
	pos_y = 0;
	_targetPos = Vec3(pos_x, pos_y, pos_z);
	Vec3 dir = this->_targetPos - this->getPosition3D();
	dir.y = 0;//使角色的头顶始终朝向y轴正方向
	dir.normalize();
	this->_headingAngle = -1 * acos(dir.dot(Vec3(0, 0, -1)));
	dir.cross(dir, Vec3(0, 0, -1), &this->_headingAxis);
	this->animateByState(PIGLET_FORWARD);
}

void Piglet::aiTrack(Mage* player)
{
	_targetPos = player->getPosition3D();
	Vec3 dir = this->_targetPos - this->getPosition3D();
	dir.y = 0;//使角色的头顶始终朝向y轴正方向
	dir.normalize();
	this->_headingAngle = -1 * acos(dir.dot(Vec3(0, 0, -1)));
	dir.cross(dir, Vec3(0, 0, -1), &this->_headingAxis);
	this->animateByState(PIGLET_FORWARD);
}

void Piglet::aiCheckPos(Mage* player)
{
	int xDiffrence1 = (int)this->getPositionX();
	int zDiffrence1 = (int)this->getPositionZ();
	int xDiffrence2 = (int)player->getPositionX();
	int zDiffrence2 = (int)player->getPositionZ();
	int distance = (int)sqrt((xDiffrence1 - xDiffrence2)*(xDiffrence1 - xDiffrence2) + (zDiffrence1 - zDiffrence2)*(zDiffrence1 - zDiffrence2));
	if (distance <= AI_SIGHT_RANGE)
	{
		_isPlayerInSight = true;
		if (distance <= AI_MELEE_RANGE)
			_isPlayerInRange = true;
		else
			_isPlayerInRange = false;
	}
	else
		_isPlayerInSight = false;
}

int Piglet::getHitCount()
{
	return _hitCount;
}

void Piglet::setHitCount(int count)
{
	_hitCount = count;
}
#include "InstanceScene.h"
#include "GameMenuScene.h"
#include "GameWinLayer.h"
#include "3d/CCBundle3D.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "physics3d/CCPhysics3D.h"
#include "Particle3D/CCParticleSystem3D.h"
#include "Particle3D/PU/CCPUParticleSystem3D.h"

using namespace cocos2d;
using namespace cocos2d::ui;
using namespace cocostudio::timeline;


InstanceScene::InstanceScene()
{

}

InstanceScene::~InstanceScene()
{

}

InstanceScene* InstanceScene::createScene()
{
	InstanceScene *pRet = new(std::nothrow)InstanceScene();
	if (pRet&&pRet->init())
	{
		pRet->autorelease();
		return pRet;
	}
	else
	{
		delete pRet;
		pRet = nullptr;
		return nullptr;
	}
}

// on "init" you need to initialize your instance
bool InstanceScene::init()
{
	bool isInitSuccessful = false;
	
	_vSize = Director::getInstance()->getVisibleSize();
	_sceneScale = 1.2f;

	//创建场景
	auto scene = Sprite3D::create("model/scene/changing.c3b");
	scene->setScale(_sceneScale*0.204f);
	scene->setCameraMask((unsigned short)CameraFlag::USER1);
	scene->setPosition3D(_sceneScale*Vec3(-168, 1, -50));
	this->addChild(scene);
	//

	//设置跟随相机
	_camera = Camera::createPerspective(60.0f, GLfloat(_vSize.width) / _vSize.height, 0.1f, 400.0f);
	_camera->setCameraFlag(CameraFlag::USER1);
	_camera->setPosition3D(Vec3(0, 80, 80));
	_camera->lookAt(Vec3(0, 0, 0), Vec3(0, 1, 0));
	this->addChild(_camera);
	//
	
	//初始化物理效果与调试效果
	this->initWithPhysics();
	this->getPhysics3DWorld()->setDebugDrawEnable(false);
	this->setPhysics3DDebugCamera(_camera);

	//设置刚体地面
	_ground = Sprite3D::create("Sprite3DTest/box.c3t");//该盒子的原始单位为1，Y坐标为0
	_ground->setRotation3D(Vec3(0, 180, 0));
	_ground->setTexture("background.jpg");
	_ground->setCameraMask((unsigned short)CameraFlag::USER1);
	_ground->setScaleX(_sceneScale*640.0f);
	_ground->setScaleZ(_sceneScale*360.0f);
	this->addChild(_ground);
	//
	
	//创建玩家法师角色
	_player = Mage::create("model/mage/mage.c3b", _camera);
	_player->setCameraMask((unsigned short)CameraFlag::USER1);
	_player->setPosition3D(Vec3(0, 0, 0));
	_player->setScale(0.3f);
	this->addChild(_player);
	int mageHeight = abs(_player->getAABB()._max.y - _player->getAABB()._min.y);
	int mageLength = abs(_player->getAABB()._max.x - _player->getAABB()._min.x);
	int mageWidth = abs(_player->getAABB()._max.z - _player->getAABB()._min.z);
	int mageRadius;
	if (mageLength >= mageWidth)
		mageRadius = mageLength;
	else
		mageRadius = mageWidth;
	Physics3DColliderDes mageDes;
	mageDes.shape = Physics3DShape::createCapsule(0.3*mageRadius, 0.06*mageHeight);
	mageDes.isTrigger = true;
	auto mageObj = Physics3DCollider::create(&mageDes);
    mageObj->setUserData((char*)"player");
	mageObj->setCollisionCallback(CC_CALLBACK_1(InstanceScene::onMageCollide, this));
	_player->addComponent(Physics3DComponent::create(mageObj, Vec3(0, -4 * 0.07*mageHeight, 0)));
	//

	//添加老鼠及动画
	auto _rat = Rat::create("model/rat/rat.c3b");
	_rat->setScale(2.0f);
	_rat->setCameraMask((unsigned short)CameraFlag::USER1);
	_rat->setPosition3D(Vec3(-60, 0, 0));
	this->addChild(_rat,1,"_rat");
	int ratHeight = abs(_rat->getAABB()._max.y - _rat->getAABB()._min.y);
	int ratLength = abs(_rat->getAABB()._max.x - _rat->getAABB()._min.x);
	int ratWidth = abs(_rat->getAABB()._max.z - _rat->getAABB()._min.z);
	int ratRadius;
	if (ratLength >= ratWidth)
		ratRadius = ratLength;
	else
		ratRadius = ratWidth;
	Physics3DColliderDes ratDes;
	ratDes.shape = Physics3DShape::createCapsule(0.25*ratRadius, 0.06*ratHeight);
	ratDes.isTrigger = true;
	auto ratObj = Physics3DCollider::create(&ratDes);
    ratObj->setUserData((char*)"rat");
	ratObj->setCollisionCallback(CC_CALLBACK_1(InstanceScene::onMonsterCollide, this));
	_rat->addComponent(Physics3DComponent::create(ratObj, Vec3(0, -4 * 0.07*mageHeight, 0)));
	auto ratHpBar = BillBoard::create("UI/hpBar.png");
	ratHpBar->setScaleX(0.03);
	ratHpBar->setScaleY(0.1);
	ratHpBar->setAnchorPoint(Vec2(0, 0));
	ratHpBar->setPosition3D(Vec3(0, 12, 0));
	ratHpBar->setCameraMask((unsigned short)CameraFlag::USER1);
	auto ratHpBack = BillBoard::create("UI/barBackground.png");
	ratHpBack->setScaleX(0.03);
	ratHpBack->setScaleY(0.1);
	ratHpBack->setAnchorPoint(Vec2(0, 0));
	ratHpBack->setPosition3D(Vec3(0, 12, 0));
	ratHpBack->setCameraMask((unsigned short)CameraFlag::USER1);
	_rat->addChild(ratHpBack, 1, "ratHpBack");
	_rat->addChild(ratHpBar, 1, "ratHpBar");
	//

	//创建小龙及动画
	auto _dragon = Dragon::create("model/dragon/dragon.c3b");
	_dragon->setScale(3.0f);
	_dragon->setCameraMask((unsigned short)CameraFlag::USER1);
	_dragon->setPosition3D(Vec3(-60, 0, 0));
	this->addChild(_dragon,1,"_dragon");
	int dragonHeight = abs(_dragon->getAABB()._max.y - _dragon->getAABB()._min.y);
	int dragonLength = abs(_dragon->getAABB()._max.x - _dragon->getAABB()._min.x);
	int dragonWidth = abs(_dragon->getAABB()._max.z - _dragon->getAABB()._min.z);
	int dragonRadius;
	if (dragonLength >= dragonWidth)
		dragonRadius = dragonLength;
	else
		dragonRadius = dragonWidth;
	Physics3DColliderDes dragonDes;
	dragonDes.shape = Physics3DShape::createCapsule(0.25*dragonRadius, 0.06*dragonHeight);
	dragonDes.isTrigger = true;
	auto dragonObj = Physics3DCollider::create(&dragonDes);
    dragonObj->setUserData((char*)"dragon");
	dragonObj->setCollisionCallback(CC_CALLBACK_1(InstanceScene::onMonsterCollide, this));
	_dragon->addComponent(Physics3DComponent::create(dragonObj, Vec3(0, -4 * 0.07*mageHeight, 0)));
	auto dragonHpBar = BillBoard::create("UI/hpBar.png");
	dragonHpBar->setScaleX(0.03);
	dragonHpBar->setScaleY(0.1);
	dragonHpBar->setAnchorPoint(Vec2(0, 0));
	dragonHpBar->setPosition3D(Vec3(0, 12, 0));
	dragonHpBar->setCameraMask((unsigned short)CameraFlag::USER1);
	auto dragonHpBack = BillBoard::create("UI/barBackground.png");
	dragonHpBack->setScaleX(0.03);
	dragonHpBack->setScaleY(0.1);
	dragonHpBack->setAnchorPoint(Vec2(0, 0));
	dragonHpBack->setPosition3D(Vec3(0, 12, 0));
	dragonHpBack->setCameraMask((unsigned short)CameraFlag::USER1);
	_dragon->addChild(dragonHpBack, 1, "dragonHpBack");
	_dragon->addChild(dragonHpBar, 1, "dragonHpBar");
	//

	//添加野猪及动画
	auto _piglet = Piglet::create("model/piglet/piglet.c3b");
	_piglet->setTexture("model/piglet/zhu0928.jpg");
	_piglet->setScale(0.2f);
	_piglet->setCameraMask((unsigned short)CameraFlag::USER1);
	_piglet->setPosition3D(Vec3(-60, 0, 0));
	this->addChild(_piglet, 1, "_piglet");
	int pigletHeight = abs(_piglet->getAABB()._max.y - _piglet->getAABB()._min.y);
	int pigletLength = abs(_piglet->getAABB()._max.x - _piglet->getAABB()._min.x);
	int pigletWidth = abs(_piglet->getAABB()._max.z - _piglet->getAABB()._min.z);
	int pigletRadius;
	if (pigletLength >= pigletWidth)
		pigletRadius = pigletLength;
	else
		pigletRadius = pigletWidth;
	Physics3DColliderDes pigletDes;
	pigletDes.shape = Physics3DShape::createCapsule(0.25*pigletRadius, 0.06*pigletHeight);
	pigletDes.isTrigger = true;
	auto pigletObj = Physics3DCollider::create(&pigletDes);
	pigletObj->setUserData((char*)"piglet");
	pigletObj->setCollisionCallback(CC_CALLBACK_1(InstanceScene::onMonsterCollide, this));
	_piglet->addComponent(Physics3DComponent::create(pigletObj, Vec3(0, -4 * 0.07*mageHeight, 0)));
	auto pigletHpBar = BillBoard::create("UI/hpBar.png");
	pigletHpBar->setScaleX(0.3);
	pigletHpBar->setAnchorPoint(Vec2(0, 0));
	pigletHpBar->setPosition3D(Vec3(0, 80, 0));
	pigletHpBar->setCameraMask((unsigned short)CameraFlag::USER1);
	auto pigletHpBack = BillBoard::create("UI/barBackground.png");
	pigletHpBack->setScaleX(0.3);
	pigletHpBack->setAnchorPoint(Vec2(0, 0));
	pigletHpBack->setPosition3D(Vec3(0, 80, 0));
	pigletHpBack->setCameraMask((unsigned short)CameraFlag::USER1);
	_piglet->addChild(pigletHpBack, 1, "pigletHpBack");
	_piglet->addChild(pigletHpBar, 1, "pigletHpBar");
	//

	//设置触屏监听
	auto listener = EventListenerTouchOneByOne::create();
	listener->onTouchBegan = CC_CALLBACK_2(InstanceScene::onTouchesBegan, this);
	listener->onTouchMoved = CC_CALLBACK_2(InstanceScene::onTouchesMoved, this);
	listener->onTouchEnded = CC_CALLBACK_2(InstanceScene::onTouchesEnded, this);
	_eventDispatcher->addEventListenerWithSceneGraphPriority(listener, this);
	//
	_isAttacking = false;
	_isSkilling = false;
	_isFinish = false;

	initPlayerUI();
	initFightButton();
	this->scheduleUpdate();
	isInitSuccessful = true;
    return true;
}

void InstanceScene::initPlayerUI()
{
	//创建玩家法师头像与血蓝条
	auto heroFace = Sprite::create("UI/hero_face.png");
	heroFace->setPosition(heroFace->getContentSize().width / 2, _vSize.height - heroFace->getContentSize().height / 2);
	this->addChild(heroFace,1,"hero_face");
	auto hpBar = LoadingBar::create("UI/hpBar.png");
	auto mpBar = LoadingBar::create("UI/mpBar.png");
	auto hpBack = Sprite::create("UI/barBackground.png");
	auto mpBack = Sprite::create("UI/barBackground.png");
	hpBar->setScaleY(2);
	hpBar->setPosition(Vec2(heroFace->getContentSize().width + hpBar->getContentSize().width / 2,
		_vSize.height - hpBar->getScaleY()*hpBar->getContentSize().height / 2));
	hpBar->setPercent(100);
	mpBar->setScaleY(2);
	mpBar->setPosition(Vec2(heroFace->getContentSize().width + mpBar->getContentSize().width / 2,
		_vSize.height - 3 * mpBar->getScaleY()*hpBar->getContentSize().height / 2));
	mpBar->setPercent(100);
	hpBack->setScaleY(2);
	hpBack->setPosition(Vec2(heroFace->getContentSize().width + hpBar->getContentSize().width / 2,
		_vSize.height - hpBar->getScaleY()*hpBar->getContentSize().height / 2));
	mpBack->setScaleY(2);
	mpBack->setPosition(Vec2(heroFace->getContentSize().width + mpBar->getContentSize().width / 2,
		_vSize.height - 3 * mpBar->getScaleY()*hpBar->getContentSize().height / 2));
	this->addChild(hpBack, 1, "hpBack");
	this->addChild(hpBar, 1, "hpBar");
	this->addChild(mpBack, 1, "mpBack");
	this->addChild(mpBar, 1, "mpBar");
	//
}

void InstanceScene::initFightButton()
{
	//创建普通攻击和技能按钮
	auto buttonSprite = Sprite::create("UI/attack1_normal.png");
	float length = buttonSprite->getContentSize().width;
	auto attack1 = MenuItemImage::create("UI/attack1_normal.png", "UI/attack1_down.png", CC_CALLBACK_1(InstanceScene::onAttack, this));
	attack1->setPosition(_vSize.width - 3 * length - 30 - 0.5*length, 0.5*length);
	auto attack2 = MenuItemImage::create("UI/attack2_normal.png", "UI/attack2_down.png", CC_CALLBACK_1(InstanceScene::onAttack, this));
	attack2->setPosition(_vSize.width - 2 * length - 20 - 0.5*length, 0.5*length);
	auto skill1 = MenuItemImage::create("UI/skill1_normal.png", "UI/skill1_down.png", CC_CALLBACK_1(InstanceScene::onSkill, this));
	skill1->setPosition(_vSize.width - length - 10 - 0.5*length, 0.5*length);
	auto skill2 = MenuItemImage::create("UI/skill2_normal.png", "UI/skill2_down.png", CC_CALLBACK_1(InstanceScene::onSkill, this));
	skill2->setPosition(_vSize.width - 0.5*length, 0.5*length);
	auto fightMenu = Menu::create(attack1, attack2, skill1, skill2, nullptr);
	fightMenu->setPosition(0, 0);
	this->addChild(fightMenu);
	//
}

void InstanceScene::onMageCollide(const Physics3DCollisionInfo &ci)
{
	if (!ci.collisionPointList.empty())
	{
		log("objB user data %s", ci.objB->getUserData());
		if (ci.objA->getUserData() == "player")
		{
			Vec3 curPos = _player->getPosition3D();
			Vec3 newFaceDir = curPos - _player->_targetPos;//新的脸朝向为目的坐标-当前坐标，从场景的OnTouchEnded获得
			newFaceDir.y = 0.0f;//只考虑xz平面上脸朝向的变化
			newFaceDir.normalize();
			Vec3 offset = newFaceDir*0.10*MAGE_FORWARD_SPEED*0.167;//向脸的朝向每秒位移25个单位
			curPos += offset;
			_player->setPosition3D(curPos);
			_player->animateByState(MAGE_IDLE);
		}
	}
}

void InstanceScene::onMonsterCollide(const Physics3DCollisionInfo &ci)
{
	if (!ci.collisionPointList.empty())
	{
		if (ci.objB->getUserData() != "player")
		{
			if (ci.objA->getUserData() == "rat")
			{
				auto _rat =(Rat *)this->getChildByName("_rat");
				Vec3 curPos = _rat->getPosition3D();
				Vec3 newFaceDir = curPos - _rat->_targetPos;//新的脸朝向为目的坐标-当前坐标，从场景的OnTouchEnded获得
				newFaceDir.y = 0.0f;//只考虑xz平面上脸朝向的变化
				newFaceDir.normalize();
				Vec3 offset = newFaceDir*0.10*RAT_FORWARD_SPEED*0.167;//向脸的朝向每秒位移25个单位
				curPos += offset;
				_rat->setPosition3D(curPos);
			}
			if (ci.objA->getUserData() == "piglet")
			{
				auto _piglet = (Rat*)this->getChildByName("_piglet");
				Vec3 curPos = _piglet->getPosition3D();
				Vec3 newFaceDir = curPos - _piglet->_targetPos;//新的脸朝向为目的坐标-当前坐标，从场景的OnTouchEnded获得
				newFaceDir.y = 0.0f;//只考虑xz平面上脸朝向的变化
				newFaceDir.normalize();
				Vec3 offset = newFaceDir*0.10*PIGLET_FORWARD_SPEED*0.167;//向脸的朝向每秒位移25个单位
				curPos += offset;
				_piglet->setPosition3D(curPos);
			}
			if (ci.objA->getUserData() == "dragon")
			{
				auto _dragon = (Rat *)this->getChildByName("_dragon");
				Vec3 curPos = _dragon->getPosition3D();
				Vec3 newFaceDir = curPos - _dragon->_targetPos;//新的脸朝向为目的坐标-当前坐标，从场景的OnTouchEnded获得
				newFaceDir.y = 0.0f;//只考虑xz平面上脸朝向的变化
				newFaceDir.normalize();
				Vec3 offset = newFaceDir*0.10*DRAGON_FORWARD_SPEED*0.167;//向脸的朝向每秒位移25个单位
				curPos += offset;
				_dragon->setPosition3D(curPos);
			}
		}
	}
}

void InstanceScene::onAttack(Ref* sender)
{
	if (!_isAttacking)
	{
		Vec3 curPos = _player->getPosition3D();
		Vec3 newFaceDir = curPos - _player->_targetPos;//新的脸朝向为目的坐标-当前坐标，从场景的OnTouchEnded获得
		newFaceDir.y = 0.0f;//只考虑xz平面上脸朝向的变化
		newFaceDir.normalize();
		Vec3 offset = newFaceDir*500.0f;
		_manaBall = Sprite3D::create("Sprite3DTest/sphere.c3b");
		_manaBall->setTexture("Sprite3DTest/plane.png");
		_manaBall->setScale(0.8f);//原始球的半径为20
		_manaBall->setPosition3D(_player->getPosition3D() + Vec3(0, 10, 0));
		_manaBall->setCameraMask((unsigned short)CameraFlag::USER1);
		auto fire = PUParticleSystem3D::create("Particle3D/scripts/mp_torch.pu");
		fire->setCameraMask((unsigned short)CameraFlag::USER1);
		fire->setScaleX(50.0f);
		fire->setScaleZ(50.0f);
		fire->setScaleY(10.0f);
		fire->startParticleSystem();
		auto moveBy = MoveBy::create(5, -1.0f*offset);
		auto calfnc = CCCallFunc::create([=]()
		{
			_isAttacking = false;
		});
		auto sequence = Sequence::create(moveBy, calfnc, RemoveSelf::create(), nullptr);
		_manaBall->runAction(sequence);
		_manaBall->addChild(fire);
		this->addChild(_manaBall, 1, "manaBall");
		_player->animateByState(MAGE_ATTACK);
		_isAttacking = true;
	}
}

void InstanceScene::onSkill(Ref* sender)
{
	if (!_isSkilling)
	{
		_isSkilling = true;
		_lineStreak = PUParticleSystem3D::create("Particle3D/scripts/lineStreak.pu");
		_lineStreak->setCameraMask((unsigned short)CameraFlag::USER1);
		_lineStreak->setPosition3D(_player->getPosition3D() + Vec3(0, 1, 0));
		_lineStreak->setScale(5.0f);
		_lineStreak->startParticleSystem();
		this->addChild(_lineStreak, 1, "lineStreak");
		auto delay = DelayTime::create(1.0f);
		auto calfnc = CCCallFunc::create([=]()
		{
			_isSkilling = false;
		});
		auto sequence = Sequence::create(delay, calfnc, RemoveSelf::create(), nullptr);
		_lineStreak->runAction(sequence);
		_player->animateByState(MAGE_SPATTACK);
		LoadingBar* mpBar = (LoadingBar *)this->getChildByName("mpBar");
		mpBar->setPercent(mpBar->getPercent() - 5);
	}
}

void InstanceScene::update(float dt)
{
	//游戏结束判定部分
	auto _rat = (Rat *)this->getChildByName("_rat");
	auto _piglet = (Piglet *)this->getChildByName("_piglet");
	auto _dragon = (Dragon *)this->getChildByName("_dragon");
	if (_rat == nullptr&&_piglet == nullptr&&_dragon == nullptr)
	{
		gameWon();
	}
	//
	//老鼠判定
	if (_rat != nullptr&&_rat->_isAlive == true)
	{
		_rat->aiCheckPos(_player);
		if (_rat->_isPlayerInRange)
			_rat->aiFight();
		else
		{
			if (_rat->_isPlayerInSight)
			{
				_rat->aiTrack(_player);
			}
		}

		if (_rat->getHitCount()>0)
		{
			_rat->setHitCount(_rat->getHitCount() - 1);
			this->showDamageLabel();
			LoadingBar* loadingBar = (LoadingBar *)this->getChildByName("hpBar");
			if (loadingBar->getPercent() - 10 > 0)
			{
				loadingBar->setPercent(loadingBar->getPercent() - 10);
			}
			else
			{
				loadingBar->setPercent(0);
				_player->animateByState(MAGE_DEAD);
				gameLose();
			}
		}

		if (_isAttacking)
		{
			float ratDistance = calculateDiatance(_manaBall->getPosition3D(), _rat->getPosition3D());
			if (ratDistance <= 20)
			{
				auto ratHpBar = _rat->getChildByName("ratHpBar");
				ratHpBar->setScaleX(ratHpBar->getScaleX() - 0.003);
				if (ratHpBar->getScaleX() < 0.001)
					_rat->_isAlive = false;
				_rat->animateByState(RAT_KNOCKED);
				_isAttacking = false;
			}
		}

		if (_isSkilling)
		{
			float ratDistance = calculateDiatance(_lineStreak->getPosition3D(), _rat->getPosition3D());
			if (ratDistance <= 30)
			{
				auto ratHpBar = _rat->getChildByName("ratHpBar");
				ratHpBar->setScaleX(ratHpBar->getScaleX() - 0.003);
				if (ratHpBar->getScaleX() < 0.001)
					_rat->_isAlive = false;
				_rat->animateByState(RAT_KNOCKED);
				_isSkilling = false;
			}
		}
	}
	
	else if (_rat != nullptr&&_rat->_isAlive == false)
	{
		    _rat->animateByState(RAT_DEAD);
			auto blink = Blink::create(0.5f, 3);
			auto fade = FadeOut::create(0.5f);
			auto sequence = Sequence::create(blink, fade, RemoveSelf::create(), nullptr);
			_rat->runAction(sequence);
	}
	
	//
	//野猪判定
	if (_piglet != nullptr&&_piglet->_isAlive == true)
	{
		_piglet->aiCheckPos(_player);
		if (_piglet->_isPlayerInRange)
			_piglet->aiFight();
		else
		{
			if (_piglet->_isPlayerInSight)
			{
				_piglet->aiTrack(_player);
			}
		}

		if (_piglet->getHitCount()>0)
		{
			_piglet->setHitCount(_piglet->getHitCount() - 1);
			this->showDamageLabel();
			LoadingBar* loadingBar = (LoadingBar *)this->getChildByName("hpBar");
			if (loadingBar->getPercent() - 10 > 0)
			{
				loadingBar->setPercent(loadingBar->getPercent() - 10);
			}
			else
			{
				loadingBar->setPercent(0);
				_player->animateByState(MAGE_DEAD);
				gameLose();
			}
		}

		if (_isAttacking)
		{
			float pigletDistance = calculateDiatance(_manaBall->getPosition3D(), _piglet->getPosition3D());
			if (pigletDistance <= 20)
			{
				auto pigletHpBar = _piglet->getChildByName("pigletHpBar");
				pigletHpBar->setScaleX(pigletHpBar->getScaleX() - 0.03);
				if (pigletHpBar->getScaleX() < 0.001)
					_piglet->_isAlive = false;
				_piglet->animateByState(PIGLET_KNOCKED);
				_isAttacking = false;
			}
		}

		if (_isSkilling)
		{
			float pigletDistance = calculateDiatance(_lineStreak->getPosition3D(), _piglet->getPosition3D());
			if (pigletDistance <= 30)
			{
				auto pigletHpBar = _piglet->getChildByName("pigletHpBar");
				pigletHpBar->setScaleX(pigletHpBar->getScaleX() - 0.03);
				if (pigletHpBar->getScaleX() < 0.001)
					_piglet->_isAlive = false;
				_piglet->animateByState(DRAGON_KNOCKED);
				_isSkilling = false;
			}
		}
	}
	else if (_piglet != nullptr&&_piglet->_isAlive == false)
	{
			auto blink = Blink::create(0.5f, 3);
			auto fade = FadeOut::create(0.5f);
			auto sequence = Sequence::create(blink, fade, RemoveSelf::create(), nullptr);
			_piglet->runAction(sequence);
	}
	//
	//小龙判定
	if (_dragon != nullptr&&_dragon->_isAlive == true)
	{
		_dragon->aiCheckPos(_player);
		if (_dragon->_isPlayerInRange)
			_dragon->aiFight();
		else
		{
			if (_dragon->_isPlayerInSight)
			{
				_dragon->aiTrack(_player);
			}
		}

		if (_dragon->getHitCount()>0)
		{
			_dragon->setHitCount(_dragon->getHitCount() - 1);
			this->showDamageLabel();
			LoadingBar* loadingBar = (LoadingBar *)this->getChildByName("hpBar");
			if (loadingBar->getPercent() - 10 > 0)
			{
				loadingBar->setPercent(loadingBar->getPercent() - 10);
			}
			else
			{
				loadingBar->setPercent(0);
				_player->animateByState(MAGE_DEAD);
				gameLose();
			}
		}

		if (_isAttacking)
		{
			float dragonDistance = calculateDiatance(_manaBall->getPosition3D(), _dragon->getPosition3D());
			if (dragonDistance <= 20)
			{
				auto dragonHpBar = _dragon->getChildByName("dragonHpBar");
				dragonHpBar->setScaleX(dragonHpBar->getScaleX() - 0.003);
				if (dragonHpBar->getScaleX() < 0.001)
					_dragon->_isAlive = false;
				_dragon->animateByState(DRAGON_KNOCKED);
				_isAttacking = false;
			}
		}
		if (_isSkilling)
		{
			float dragonDistance = calculateDiatance(_lineStreak->getPosition3D(), _dragon->getPosition3D());
			if (dragonDistance <= 30)
			{
				auto dragonHpBar = _dragon->getChildByName("dragonHpBar");
				dragonHpBar->setScaleX(dragonHpBar->getScaleX() - 0.003);
				if (dragonHpBar->getScaleX() < 0.001)
					_dragon->_isAlive = false;
				_dragon->animateByState(DRAGON_KNOCKED);
				_isSkilling = false;
			}
		}
	}
	else 	if (_dragon != nullptr&&_dragon->_isAlive == false)
	{
		auto blink = Blink::create(0.5f, 3);
		auto fade = FadeOut::create(0.5f);
		auto sequence = Sequence::create(blink, fade, RemoveSelf::create(), nullptr);
		_dragon->runAction(sequence);
	}
	
	//
}

float InstanceScene::calculateDiatance(Vec3 v1, Vec3 v2)
{
	return sqrt((v1.x - v2.x)*(v1.x - v2.x) + (v1.z - v2.z)*(v1.z - v2.z));
}

bool InstanceScene::onTouchesBegan(Touch* touch, Event* event)
{
	if (!_isFinish)
		return true;
	else
	{
		return false;
	}
}

void InstanceScene::onTouchesMoved(Touch* touch, Event* event)
{

}

void InstanceScene::onTouchesEnded(Touch* touch, Event* event)
{
	auto location = touch->getLocationInView();
	if (_camera)
	{
		_camera->setPosition3D(_player->getPosition3D() + Vec3(0, 80, 80));
		_camera->lookAt(_player->getPosition3D(), Vec3(0, 1, 0));
		if (_player)
		{
			Vec3 nearP(location.x, location.y, 0.0f), farP(location.x, location.y, 1.0f);
			auto size = Director::getInstance()->getWinSize();
			_camera->unproject(size, &nearP, &nearP);
			_camera->unproject(size, &farP, &farP);
			Vec3 dir = farP - nearP;
			dir.normalize();
			Vec3 collisionPoint;//collisionPoint只是用来存储射线与地形碰撞点的矢量
			Ray clickRay = Ray(nearP, dir);
			bool isInGround = clickRay.intersects(OBB(_ground->getAABB()));
			if (!isInGround)
			{
				_player->animateByState(MAGE_IDLE);
				return;
			}
			collisionPoint = clickRay.intersects(Plane(Vec3(0, 1, 0), Vec3(0, 0, 0)));
			this->showForwardHint(collisionPoint);
			dir = collisionPoint - _player->getPosition3D();
			dir.y = 0;//使角色的头顶始终朝向y轴正方向
			dir.normalize();
			_player->_headingAngle = -1 * acos(dir.dot(Vec3(0, 0, -1)));
			dir.cross(dir, Vec3(0, 0, -1), &_player->_headingAxis);
			_player->_targetPos = collisionPoint;
			_player->animateByState(MAGE_FORWARD);
		}
	}
	event->stopPropagation();
}

void InstanceScene::showDamageLabel()
{
	auto damageLabel = LabelTTF::create("-10", "Arial", 30);
	damageLabel->setColor(Color3B(255, 0, 0));
	damageLabel->setPosition(_vSize.width / 2, _vSize.height / 2 + 50.0f);
	auto damageUp = MoveBy::create(0.2, Vec2(0.0f, 50.0f));
	auto sequence = Sequence::create(damageUp, RemoveSelf::create(), nullptr);
	damageLabel->runAction(sequence);
	this->addChild(damageLabel, 1, "damageLabel");
	auto knockPart = ParticleSystemQuad::create("Particle3D/explode2.plist");
	knockPart->setTexture(TextureCache::sharedTextureCache()->addImage("Particle3D/particleTexture.png"));
	knockPart->setAutoRemoveOnFinish(true);
	knockPart->setPosition(_vSize.width / 2, _vSize.height / 2);
	this->addChild(knockPart);
}

void InstanceScene::showForwardHint(Vec3 target)
{
	auto arrow = BillBoard::create("arrow.png");
	arrow->setScale(0.01f);
	arrow->setAnchorPoint(Vec2(0, 0));
	arrow->setCameraMask(2);
	addChild(arrow, 1, "hint");
	arrow->setPosition3D(target);
	auto blink = Blink::create(0.5f, 3);
	auto fade = FadeOut::create(0.5f);
	auto sequence = Sequence::create(blink, fade,RemoveSelf::create(), nullptr);
	arrow->runAction(sequence);
}

void InstanceScene::gameWon()
{
	if (_isFinish == false)
	{
		auto winLabel = LabelTTF::create("YOU WON!", "Arial", 40);
		winLabel->setColor(Color3B(0, 255, 0));
		winLabel->setPosition(_vSize.width / 2, 0);
		auto winUp = MoveBy::create(1, Vec2(0.0f, _vSize.height / 2));
		auto calfnc = CCCallFunc::create([=]()
		{
			Director::getInstance()->pause();
		});
		auto sequence = Sequence::create(winUp, calfnc, nullptr);
		winLabel->runAction(sequence);
		this->addChild(winLabel, 2, "finishLabel");
		auto winLayer = GameWinLayer::CreateLayer();
		this->addChild(winLayer, 2, "finishLayer");
		_isFinish = true;
		auto restart = MenuItemImage::create("CloseNormal.png", "CloseSelected.png", CC_CALLBACK_1(InstanceScene::goRestart, this));
		restart->setPosition(_vSize.width / 2, _vSize.height / 2 - 50);
		auto fightMenu = Menu::create(restart, nullptr);
		fightMenu->setPosition(0, 0);
		this->addChild(fightMenu, 2, "finishMenu");
	}
}

void InstanceScene::gameLose()
{
	if (_isFinish == false)
	{
		auto winLabel = LabelTTF::create("YOU DIED!", "Arial", 40);
		winLabel->setColor(Color3B(255, 0, 0));
		winLabel->setPosition(_vSize.width / 2, 0);
		auto winUp = MoveBy::create(1, Vec2(0.0f, _vSize.height / 2));
		auto calfnc = CCCallFunc::create([=]()
		{
			Director::getInstance()->pause();
		});
		auto sequence = Sequence::create(winUp, calfnc, nullptr);
		winLabel->runAction(sequence);
		this->addChild(winLabel, 2, "finishLabel");
		auto winLayer = GameWinLayer::CreateLayer();
		this->addChild(winLayer, 2, "finishLayer");
		_isFinish = true;
		auto restart = MenuItemImage::create("CloseNormal.png", "CloseSelected.png", CC_CALLBACK_1(InstanceScene::goRestart, this));
		restart->setPosition(_vSize.width / 2, _vSize.height / 2 - 50);
		auto fightMenu = Menu::create(restart, nullptr);
		fightMenu->setPosition(0, 0);
		this->addChild(fightMenu, 2, "finishMenu");
	}
}

void InstanceScene::goRestart(Ref* sender)
{
	this->removeChildByName("finishLabel");
	this->removeChildByName("finishLayer");
	this->removeChildByName("finishMenu");
	Director::getInstance()->replaceScene(TransitionPageTurn::create(0.5f, InstanceScene::createScene(), false));
	Director::getInstance()->resume();
}
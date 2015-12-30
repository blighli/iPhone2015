#ifndef __GAME_SCENE__
#define __GAME_SCENE__

#include "cocos2d.h"
#include "cocostudio/CocoStudio.h"
#include "ui/CocosGUI.h"
#include "Player.h"
#include "RoleManager.h"

class GameScene : public cocos2d::Layer
{
public:
	GameScene();
	virtual ~GameScene();
	// there's no 'id' in cpp, so we recommend returning the class instance pointer
	static cocos2d::Scene* createScene();

	// Here's a difference. Method 'init' in cocos2d-x returns bool, instead of returning 'id' in cocos2d-iphone
	virtual bool init();

	// implement the "static create()" method manually
	CREATE_FUNC(GameScene);

	virtual void update(float delta);

	//button touch upside listenner
	void onBtnDirection(Ref*, ui::Widget::TouchEventType, std::string dir);
	void onBtnAttack(Ref*, ui::Widget::TouchEventType);
	void onBtnSkill(Ref*, ui::Widget::TouchEventType);

	void onMoveDone();
	void updateSkillCD(float dt);
	void updateCDTime(float dt);
	void updateBossComeInfor(float dt);

	void onReducePlayerLife(Ref* r);
	void onGameWin(Ref* r);
	void onBossCome(Ref* r);
private:
	RoleManager* m_roleManager;
	GameTiledMap* m_gameMap;
	Player* m_player;//player data object
	Size m_winSize;//visible size of window
	float m_winXLeft;//the left pos x of visible window
	float m_winXRight;//the right pos x of visible window
	ParallaxNode* m_voidNode;//all node add to this node, and this node is the child of the layer
	cocos2d::ui::LoadingBar* m_playerHP;
	int m_skillCD;
	bool m_isPlayBkgMusic;
	bool m_isPlayEffect;
};

#endif // __GAME_SCENE__

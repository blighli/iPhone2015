#ifndef __GAME_CONFIG__
#define __GAME_CONFIG__

//the HP of player, monster and boss
#define PLAYER_MAX_LIFE 1000
#define MONSTER_MAX_LIFE 100
#define BOSS_MAX_LIFE 1000

//the attack power of player,monster and boss
#define PLAYER_ATK 50
#define MONSTER_ATK 30
#define BOSS_ATK 60

#define PLAYER_SKILL_CD 5

//define the zorder of background map, player, monster
#define GAMEMAP_ZORDER 0
#define ROLEMANAGER_ZORDER 1
#define MONSTER_LOACL_ZORDER 2
#define BOSS_LOCAL_ZORDER 3
#define PLAYER_LOCAL_ZORDER 4


//define the speed of player and monster
#define PLAYER_SPEED_BY_TIME 0.006//means per 0.003 second 1 pixel  distance  
#define MONSTER_SPEED_BY_TIME 0.01
////#define BOSS_SPEED_BY_TIME 0.007
#define MAP_MOVE_SPEED_BY_TIME 3//smaller, move faster
#define ATTACK_DURATION 0.7f

#define MAP_MOVE_DISTANCE 10
#define MAP_MOVE_EDGE 30

//define the face direction
#define DIRECTION_LEFT 10
#define DIRECTION_RIGHT 11
#define DIRECTION_UP 12
#define DIRECTION_DOWN 13

//define the max num of monster who show in the game
#define MONSTER_MAX_SHOW_NUM 5
#define BOSS_SHOW_MONSTER_KILL_NUM 10//when kill this num + 1, the boss show out


//define the action state
enum class ActionState{
	NONE,
	RUN,
	ATTACK,
	STAND,
	ENDURE,
	DIE,
	MONSTER_CHASE,  // monster chase player patten
	PLAYER_SKILL
};

//define monster run action tag of left and right 
#define MONSTER_RUN_L_R_TAG 100
#define PLAYER_MOVE_TAG 101
#define PLAYER_BACKWORD_TAG 102

//define the distance that monster chase player and attack automatically
#define MONSTER_AUTO_ATTACK_DISTANCE 200
#define MONSTER_PLAYER_X_DIFF 180
#define MONSTER_PLAYER_Y_DIFF 20

#define MSG_PLAYER_DIE "msg_player_die"
#define MSG_MONSTER_KILLED "msg_monster_killed"
#define MSG_GAME_WIN "msg_game_win"
#define MSG_BOSS_COME "msg_boss_come"

#endif
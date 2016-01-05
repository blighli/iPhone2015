#include "Entity.h"
#include "GameConfig.h"

Entity::Entity() :m_life(0), m_atk(0), m_dir(DIRECTION_LEFT), m_state(ActionState::STAND), m_entityNode(nullptr), m_entityAction(nullptr)
{
}

Entity::~Entity()
{

}

Node* Entity::getEntityNode()
{
	return this->m_entityNode;
}

const int& Entity::getLife() const
{
	return this->m_life;
}

void Entity::setLife(int newLife)
{
	this->m_life = newLife;
}


const int& Entity::getAtk() const
{
	return this->m_atk;
}

void Entity::setAtk(int newAtk)
{
	this->m_atk = newAtk;
}

const int& Entity::getDir() const
{
	return this->m_dir;
}

void Entity::setDir(int newDir)
{
	this->m_dir = newDir;
}

const ActionState& Entity::getState() const
{
	return this->m_state;
}

void Entity::setState(ActionState newState)
{
	this->m_state = newState;
}

const bool& Entity::isInvincible() const
{
	return this->m_isInvincible;
}

void Entity::setInvincible(bool newIsInvincible)
{
	this->m_isInvincible = newIsInvincible;
}

void Entity::stand()
{

}

void Entity::run()
{

}

void Entity::attack()
{

}

void Entity::endure()
{

}

void Entity::die()
{

}

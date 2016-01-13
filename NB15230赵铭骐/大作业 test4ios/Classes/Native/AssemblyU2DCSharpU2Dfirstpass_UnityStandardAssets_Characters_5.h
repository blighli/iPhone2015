#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.Transform
struct Transform_t3;
// UnityEngine.NavMeshAgent
struct NavMeshAgent_t47;
// UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter
struct ThirdPersonCharacter_t48;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"

// UnityStandardAssets.Characters.ThirdPerson.AICharacterControl
struct  AICharacterControl_t46  : public MonoBehaviour_t2
{
	// UnityEngine.Transform UnityStandardAssets.Characters.ThirdPerson.AICharacterControl::target
	Transform_t3 * ___target_2;
	// UnityEngine.NavMeshAgent UnityStandardAssets.Characters.ThirdPerson.AICharacterControl::<agent>k__BackingField
	NavMeshAgent_t47 * ___U3CagentU3Ek__BackingField_3;
	// UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter UnityStandardAssets.Characters.ThirdPerson.AICharacterControl::<character>k__BackingField
	ThirdPersonCharacter_t48 * ___U3CcharacterU3Ek__BackingField_4;
};

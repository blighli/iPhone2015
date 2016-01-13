#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.Rigidbody
struct Rigidbody_t15;
// UnityEngine.Animator
struct Animator_t10;
// UnityEngine.CapsuleCollider
struct CapsuleCollider_t43;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter
struct  ThirdPersonCharacter_t48  : public MonoBehaviour_t2
{
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_MovingTurnSpeed
	float ___m_MovingTurnSpeed_3;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_StationaryTurnSpeed
	float ___m_StationaryTurnSpeed_4;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_JumpPower
	float ___m_JumpPower_5;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_GravityMultiplier
	float ___m_GravityMultiplier_6;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_RunCycleLegOffset
	float ___m_RunCycleLegOffset_7;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_MoveSpeedMultiplier
	float ___m_MoveSpeedMultiplier_8;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_AnimSpeedMultiplier
	float ___m_AnimSpeedMultiplier_9;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_GroundCheckDistance
	float ___m_GroundCheckDistance_10;
	// UnityEngine.Rigidbody UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_Rigidbody
	Rigidbody_t15 * ___m_Rigidbody_11;
	// UnityEngine.Animator UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_Animator
	Animator_t10 * ___m_Animator_12;
	// System.Boolean UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_IsGrounded
	bool ___m_IsGrounded_13;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_OrigGroundCheckDistance
	float ___m_OrigGroundCheckDistance_14;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_TurnAmount
	float ___m_TurnAmount_15;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_ForwardAmount
	float ___m_ForwardAmount_16;
	// UnityEngine.Vector3 UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_GroundNormal
	Vector3_t4  ___m_GroundNormal_17;
	// System.Single UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_CapsuleHeight
	float ___m_CapsuleHeight_18;
	// UnityEngine.Vector3 UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_CapsuleCenter
	Vector3_t4  ___m_CapsuleCenter_19;
	// UnityEngine.CapsuleCollider UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_Capsule
	CapsuleCollider_t43 * ___m_Capsule_20;
	// System.Boolean UnityStandardAssets.Characters.ThirdPerson.ThirdPersonCharacter::m_Crouching
	bool ___m_Crouching_21;
};

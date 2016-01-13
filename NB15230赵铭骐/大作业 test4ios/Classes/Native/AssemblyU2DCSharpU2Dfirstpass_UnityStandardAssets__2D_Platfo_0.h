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
// UnityEngine.Animator
struct Animator_t10;
// UnityEngine.Rigidbody2D
struct Rigidbody2D_t11;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "UnityEngine_UnityEngine_LayerMask.h"

// UnityStandardAssets._2D.PlatformerCharacter2D
struct  PlatformerCharacter2D_t8  : public MonoBehaviour_t2
{
	// System.Single UnityStandardAssets._2D.PlatformerCharacter2D::m_MaxSpeed
	float ___m_MaxSpeed_4;
	// System.Single UnityStandardAssets._2D.PlatformerCharacter2D::m_JumpForce
	float ___m_JumpForce_5;
	// System.Single UnityStandardAssets._2D.PlatformerCharacter2D::m_CrouchSpeed
	float ___m_CrouchSpeed_6;
	// System.Boolean UnityStandardAssets._2D.PlatformerCharacter2D::m_AirControl
	bool ___m_AirControl_7;
	// UnityEngine.LayerMask UnityStandardAssets._2D.PlatformerCharacter2D::m_WhatIsGround
	LayerMask_t9  ___m_WhatIsGround_8;
	// UnityEngine.Transform UnityStandardAssets._2D.PlatformerCharacter2D::m_GroundCheck
	Transform_t3 * ___m_GroundCheck_9;
	// System.Boolean UnityStandardAssets._2D.PlatformerCharacter2D::m_Grounded
	bool ___m_Grounded_10;
	// UnityEngine.Transform UnityStandardAssets._2D.PlatformerCharacter2D::m_CeilingCheck
	Transform_t3 * ___m_CeilingCheck_11;
	// UnityEngine.Animator UnityStandardAssets._2D.PlatformerCharacter2D::m_Anim
	Animator_t10 * ___m_Anim_12;
	// UnityEngine.Rigidbody2D UnityStandardAssets._2D.PlatformerCharacter2D::m_Rigidbody2D
	Rigidbody2D_t11 * ___m_Rigidbody2D_13;
	// System.Boolean UnityStandardAssets._2D.PlatformerCharacter2D::m_FacingRight
	bool ___m_FacingRight_14;
};

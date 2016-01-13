#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.CharacterController
struct CharacterController_t36;
// UnityEngine.Collider
struct Collider_t132;

#include "mscorlib_System_Object.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityEngine.ControllerColliderHit
struct  ControllerColliderHit_t130  : public Object_t
{
	// UnityEngine.CharacterController UnityEngine.ControllerColliderHit::m_Controller
	CharacterController_t36 * ___m_Controller_0;
	// UnityEngine.Collider UnityEngine.ControllerColliderHit::m_Collider
	Collider_t132 * ___m_Collider_1;
	// UnityEngine.Vector3 UnityEngine.ControllerColliderHit::m_Point
	Vector3_t4  ___m_Point_2;
	// UnityEngine.Vector3 UnityEngine.ControllerColliderHit::m_Normal
	Vector3_t4  ___m_Normal_3;
	// UnityEngine.Vector3 UnityEngine.ControllerColliderHit::m_MoveDirection
	Vector3_t4  ___m_MoveDirection_4;
	// System.Single UnityEngine.ControllerColliderHit::m_MoveLength
	float ___m_MoveLength_5;
	// System.Int32 UnityEngine.ControllerColliderHit::m_Push
	int32_t ___m_Push_6;
};

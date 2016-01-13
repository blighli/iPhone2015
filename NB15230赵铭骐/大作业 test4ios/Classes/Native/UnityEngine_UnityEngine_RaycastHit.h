#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.Collider
struct Collider_t132;

#include "mscorlib_System_ValueType.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "UnityEngine_UnityEngine_Vector2.h"

// UnityEngine.RaycastHit
struct  RaycastHit_t26 
{
	// UnityEngine.Vector3 UnityEngine.RaycastHit::m_Point
	Vector3_t4  ___m_Point_0;
	// UnityEngine.Vector3 UnityEngine.RaycastHit::m_Normal
	Vector3_t4  ___m_Normal_1;
	// System.Int32 UnityEngine.RaycastHit::m_FaceID
	int32_t ___m_FaceID_2;
	// System.Single UnityEngine.RaycastHit::m_Distance
	float ___m_Distance_3;
	// UnityEngine.Vector2 UnityEngine.RaycastHit::m_UV
	Vector2_t6  ___m_UV_4;
	// UnityEngine.Collider UnityEngine.RaycastHit::m_Collider
	Collider_t132 * ___m_Collider_5;
};

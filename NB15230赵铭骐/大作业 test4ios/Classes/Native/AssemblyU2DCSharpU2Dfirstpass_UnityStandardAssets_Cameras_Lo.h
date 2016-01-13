#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>


#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Cameras_Ab_0.h"
#include "UnityEngine_UnityEngine_Vector2.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "UnityEngine_UnityEngine_Quaternion.h"

// UnityStandardAssets.Cameras.LookatTarget
struct  LookatTarget_t21  : public AbstractTargetFollower_t14
{
	// UnityEngine.Vector2 UnityStandardAssets.Cameras.LookatTarget::m_RotationRange
	Vector2_t6  ___m_RotationRange_6;
	// System.Single UnityStandardAssets.Cameras.LookatTarget::m_FollowSpeed
	float ___m_FollowSpeed_7;
	// UnityEngine.Vector3 UnityStandardAssets.Cameras.LookatTarget::m_FollowAngles
	Vector3_t4  ___m_FollowAngles_8;
	// UnityEngine.Quaternion UnityStandardAssets.Cameras.LookatTarget::m_OriginalRotation
	Quaternion_t19  ___m_OriginalRotation_9;
	// UnityEngine.Vector3 UnityStandardAssets.Cameras.LookatTarget::m_FollowVelocity
	Vector3_t4  ___m_FollowVelocity_10;
};

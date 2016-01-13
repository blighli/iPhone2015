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
// UnityEngine.Rigidbody
struct Rigidbody_t15;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Cameras_Ab.h"

// UnityStandardAssets.Cameras.AbstractTargetFollower
struct  AbstractTargetFollower_t14  : public MonoBehaviour_t2
{
	// UnityEngine.Transform UnityStandardAssets.Cameras.AbstractTargetFollower::m_Target
	Transform_t3 * ___m_Target_2;
	// System.Boolean UnityStandardAssets.Cameras.AbstractTargetFollower::m_AutoTargetPlayer
	bool ___m_AutoTargetPlayer_3;
	// UnityStandardAssets.Cameras.AbstractTargetFollower/UpdateType UnityStandardAssets.Cameras.AbstractTargetFollower::m_UpdateType
	int32_t ___m_UpdateType_4;
	// UnityEngine.Rigidbody UnityStandardAssets.Cameras.AbstractTargetFollower::targetRigidbody
	Rigidbody_t15 * ___targetRigidbody_5;
};

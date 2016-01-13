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

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityStandardAssets._2D.Camera2DFollow
struct  Camera2DFollow_t1  : public MonoBehaviour_t2
{
	// UnityEngine.Transform UnityStandardAssets._2D.Camera2DFollow::target
	Transform_t3 * ___target_2;
	// System.Single UnityStandardAssets._2D.Camera2DFollow::damping
	float ___damping_3;
	// System.Single UnityStandardAssets._2D.Camera2DFollow::lookAheadFactor
	float ___lookAheadFactor_4;
	// System.Single UnityStandardAssets._2D.Camera2DFollow::lookAheadReturnSpeed
	float ___lookAheadReturnSpeed_5;
	// System.Single UnityStandardAssets._2D.Camera2DFollow::lookAheadMoveThreshold
	float ___lookAheadMoveThreshold_6;
	// System.Single UnityStandardAssets._2D.Camera2DFollow::m_OffsetZ
	float ___m_OffsetZ_7;
	// UnityEngine.Vector3 UnityStandardAssets._2D.Camera2DFollow::m_LastTargetPosition
	Vector3_t4  ___m_LastTargetPosition_8;
	// UnityEngine.Vector3 UnityStandardAssets._2D.Camera2DFollow::m_CurrentVelocity
	Vector3_t4  ___m_CurrentVelocity_9;
	// UnityEngine.Vector3 UnityStandardAssets._2D.Camera2DFollow::m_LookAheadPos
	Vector3_t4  ___m_LookAheadPos_10;
};

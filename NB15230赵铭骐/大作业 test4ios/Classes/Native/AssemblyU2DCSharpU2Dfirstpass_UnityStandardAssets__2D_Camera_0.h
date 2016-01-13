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
#include "UnityEngine_UnityEngine_Vector2.h"

// UnityStandardAssets._2D.CameraFollow
struct  CameraFollow_t5  : public MonoBehaviour_t2
{
	// System.Single UnityStandardAssets._2D.CameraFollow::xMargin
	float ___xMargin_2;
	// System.Single UnityStandardAssets._2D.CameraFollow::yMargin
	float ___yMargin_3;
	// System.Single UnityStandardAssets._2D.CameraFollow::xSmooth
	float ___xSmooth_4;
	// System.Single UnityStandardAssets._2D.CameraFollow::ySmooth
	float ___ySmooth_5;
	// UnityEngine.Vector2 UnityStandardAssets._2D.CameraFollow::maxXAndY
	Vector2_t6  ___maxXAndY_6;
	// UnityEngine.Vector2 UnityStandardAssets._2D.CameraFollow::minXAndY
	Vector2_t6  ___minXAndY_7;
	// UnityEngine.Transform UnityStandardAssets._2D.CameraFollow::m_Player
	Transform_t3 * ___m_Player_8;
};

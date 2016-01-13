#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.Camera
struct Camera_t28;
// UnityEngine.Transform
struct Transform_t3;

#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Cameras_Ab_0.h"

// UnityStandardAssets.Cameras.TargetFieldOfView
struct  TargetFieldOfView_t27  : public AbstractTargetFollower_t14
{
	// System.Single UnityStandardAssets.Cameras.TargetFieldOfView::m_FovAdjustTime
	float ___m_FovAdjustTime_6;
	// System.Single UnityStandardAssets.Cameras.TargetFieldOfView::m_ZoomAmountMultiplier
	float ___m_ZoomAmountMultiplier_7;
	// System.Boolean UnityStandardAssets.Cameras.TargetFieldOfView::m_IncludeEffectsInSize
	bool ___m_IncludeEffectsInSize_8;
	// System.Single UnityStandardAssets.Cameras.TargetFieldOfView::m_BoundSize
	float ___m_BoundSize_9;
	// System.Single UnityStandardAssets.Cameras.TargetFieldOfView::m_FovAdjustVelocity
	float ___m_FovAdjustVelocity_10;
	// UnityEngine.Camera UnityStandardAssets.Cameras.TargetFieldOfView::m_Cam
	Camera_t28 * ___m_Cam_11;
	// UnityEngine.Transform UnityStandardAssets.Cameras.TargetFieldOfView::m_LastTarget
	Transform_t3 * ___m_LastTarget_12;
};

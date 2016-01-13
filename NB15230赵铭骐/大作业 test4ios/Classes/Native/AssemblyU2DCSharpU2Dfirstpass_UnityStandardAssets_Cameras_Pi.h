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

#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Cameras_Ab_0.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityStandardAssets.Cameras.PivotBasedCameraRig
struct  PivotBasedCameraRig_t17  : public AbstractTargetFollower_t14
{
	// UnityEngine.Transform UnityStandardAssets.Cameras.PivotBasedCameraRig::m_Cam
	Transform_t3 * ___m_Cam_6;
	// UnityEngine.Transform UnityStandardAssets.Cameras.PivotBasedCameraRig::m_Pivot
	Transform_t3 * ___m_Pivot_7;
	// UnityEngine.Vector3 UnityStandardAssets.Cameras.PivotBasedCameraRig::m_LastTargetPosition
	Vector3_t4  ___m_LastTargetPosition_8;
};

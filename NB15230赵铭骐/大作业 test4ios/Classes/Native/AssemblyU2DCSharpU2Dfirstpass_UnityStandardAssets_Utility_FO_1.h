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
// UnityEngine.AnimationCurve
struct AnimationCurve_t41;
struct AnimationCurve_t41_marshaled;

#include "mscorlib_System_Object.h"

// UnityStandardAssets.Utility.FOVKick
struct  FOVKick_t31  : public Object_t
{
	// UnityEngine.Camera UnityStandardAssets.Utility.FOVKick::Camera
	Camera_t28 * ___Camera_0;
	// System.Single UnityStandardAssets.Utility.FOVKick::originalFov
	float ___originalFov_1;
	// System.Single UnityStandardAssets.Utility.FOVKick::FOVIncrease
	float ___FOVIncrease_2;
	// System.Single UnityStandardAssets.Utility.FOVKick::TimeToIncrease
	float ___TimeToIncrease_3;
	// System.Single UnityStandardAssets.Utility.FOVKick::TimeToDecrease
	float ___TimeToDecrease_4;
	// UnityEngine.AnimationCurve UnityStandardAssets.Utility.FOVKick::IncreaseCurve
	AnimationCurve_t41 * ___IncreaseCurve_5;
};

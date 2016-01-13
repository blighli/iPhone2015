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

// UnityStandardAssets.Utility.FollowTarget
struct  FollowTarget_t95  : public MonoBehaviour_t2
{
	// UnityEngine.Transform UnityStandardAssets.Utility.FollowTarget::target
	Transform_t3 * ___target_2;
	// UnityEngine.Vector3 UnityStandardAssets.Utility.FollowTarget::offset
	Vector3_t4  ___offset_3;
};

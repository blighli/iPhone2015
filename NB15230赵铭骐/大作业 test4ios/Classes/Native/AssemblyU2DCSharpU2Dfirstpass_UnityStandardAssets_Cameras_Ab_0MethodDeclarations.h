#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// UnityStandardAssets.Cameras.AbstractTargetFollower
struct AbstractTargetFollower_t14;
// UnityEngine.Transform
struct Transform_t3;

#include "codegen/il2cpp-codegen.h"

// System.Void UnityStandardAssets.Cameras.AbstractTargetFollower::.ctor()
extern "C" void AbstractTargetFollower__ctor_m20 (AbstractTargetFollower_t14 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.AbstractTargetFollower::Start()
extern "C" void AbstractTargetFollower_Start_m21 (AbstractTargetFollower_t14 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.AbstractTargetFollower::FixedUpdate()
extern "C" void AbstractTargetFollower_FixedUpdate_m22 (AbstractTargetFollower_t14 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.AbstractTargetFollower::LateUpdate()
extern "C" void AbstractTargetFollower_LateUpdate_m23 (AbstractTargetFollower_t14 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.AbstractTargetFollower::ManualUpdate()
extern "C" void AbstractTargetFollower_ManualUpdate_m24 (AbstractTargetFollower_t14 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.AbstractTargetFollower::FindAndTargetPlayer()
extern "C" void AbstractTargetFollower_FindAndTargetPlayer_m25 (AbstractTargetFollower_t14 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.AbstractTargetFollower::SetTarget(UnityEngine.Transform)
extern "C" void AbstractTargetFollower_SetTarget_m26 (AbstractTargetFollower_t14 * __this, Transform_t3 * ___newTransform, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Transform UnityStandardAssets.Cameras.AbstractTargetFollower::get_Target()
extern "C" Transform_t3 * AbstractTargetFollower_get_Target_m27 (AbstractTargetFollower_t14 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

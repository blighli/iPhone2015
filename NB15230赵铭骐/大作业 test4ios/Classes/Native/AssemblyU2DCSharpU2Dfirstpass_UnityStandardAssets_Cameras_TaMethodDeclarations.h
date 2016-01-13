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

// UnityStandardAssets.Cameras.TargetFieldOfView
struct TargetFieldOfView_t27;
// UnityEngine.Transform
struct Transform_t3;

#include "codegen/il2cpp-codegen.h"

// System.Void UnityStandardAssets.Cameras.TargetFieldOfView::.ctor()
extern "C" void TargetFieldOfView__ctor_m50 (TargetFieldOfView_t27 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.TargetFieldOfView::Start()
extern "C" void TargetFieldOfView_Start_m51 (TargetFieldOfView_t27 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.TargetFieldOfView::FollowTarget(System.Single)
extern "C" void TargetFieldOfView_FollowTarget_m52 (TargetFieldOfView_t27 * __this, float ___deltaTime, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Cameras.TargetFieldOfView::SetTarget(UnityEngine.Transform)
extern "C" void TargetFieldOfView_SetTarget_m53 (TargetFieldOfView_t27 * __this, Transform_t3 * ___newTransform, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityStandardAssets.Cameras.TargetFieldOfView::MaxBoundsExtent(UnityEngine.Transform,System.Boolean)
extern "C" float TargetFieldOfView_MaxBoundsExtent_m54 (Object_t * __this /* static, unused */, Transform_t3 * ___obj, bool ___includeEffects, const MethodInfo* method) IL2CPP_METHOD_ATTR;

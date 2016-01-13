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

// UnityEngine.Animation
struct Animation_t157;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// UnityEngine.AnimationState
struct AnimationState_t295;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_PlayMode.h"

// System.Boolean UnityEngine.Animation::Play()
extern "C" bool Animation_Play_m620 (Animation_t157 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Animation::Play(UnityEngine.PlayMode)
extern "C" bool Animation_Play_m1555 (Animation_t157 * __this, int32_t ___mode, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Animation::PlayDefaultAnimation(UnityEngine.PlayMode)
extern "C" bool Animation_PlayDefaultAnimation_m1556 (Animation_t157 * __this, int32_t ___mode, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Collections.IEnumerator UnityEngine.Animation::GetEnumerator()
extern "C" Object_t * Animation_GetEnumerator_m1557 (Animation_t157 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.AnimationState UnityEngine.Animation::GetStateAtIndex(System.Int32)
extern "C" AnimationState_t295 * Animation_GetStateAtIndex_m1558 (Animation_t157 * __this, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.Animation::GetStateCount()
extern "C" int32_t Animation_GetStateCount_m1559 (Animation_t157 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

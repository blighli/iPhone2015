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

// UnityEngine.AnimationCurve
struct AnimationCurve_t41;
struct AnimationCurve_t41_marshaled;
// UnityEngine.Keyframe[]
struct KeyframeU5BU5D_t146;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Keyframe.h"

// System.Void UnityEngine.AnimationCurve::.ctor(UnityEngine.Keyframe[])
extern "C" void AnimationCurve__ctor_m538 (AnimationCurve_t41 * __this, KeyframeU5BU5D_t146* ___keys, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AnimationCurve::.ctor()
extern "C" void AnimationCurve__ctor_m1546 (AnimationCurve_t41 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AnimationCurve::Cleanup()
extern "C" void AnimationCurve_Cleanup_m1547 (AnimationCurve_t41 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AnimationCurve::Finalize()
extern "C" void AnimationCurve_Finalize_m1548 (AnimationCurve_t41 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.AnimationCurve::Evaluate(System.Single)
extern "C" float AnimationCurve_Evaluate_m547 (AnimationCurve_t41 * __this, float ___time, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Keyframe UnityEngine.AnimationCurve::get_Item(System.Int32)
extern "C" Keyframe_t147  AnimationCurve_get_Item_m639 (AnimationCurve_t41 * __this, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.AnimationCurve::get_length()
extern "C" int32_t AnimationCurve_get_length_m638 (AnimationCurve_t41 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Keyframe UnityEngine.AnimationCurve::GetKey_Internal(System.Int32)
extern "C" Keyframe_t147  AnimationCurve_GetKey_Internal_m1549 (AnimationCurve_t41 * __this, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AnimationCurve::Init(UnityEngine.Keyframe[])
extern "C" void AnimationCurve_Init_m1550 (AnimationCurve_t41 * __this, KeyframeU5BU5D_t146* ___keys, const MethodInfo* method) IL2CPP_METHOD_ATTR;
extern "C" void AnimationCurve_t41_marshal(const AnimationCurve_t41& unmarshaled, AnimationCurve_t41_marshaled& marshaled);
extern "C" void AnimationCurve_t41_marshal_back(const AnimationCurve_t41_marshaled& marshaled, AnimationCurve_t41& unmarshaled);
extern "C" void AnimationCurve_t41_marshal_cleanup(AnimationCurve_t41_marshaled& marshaled);

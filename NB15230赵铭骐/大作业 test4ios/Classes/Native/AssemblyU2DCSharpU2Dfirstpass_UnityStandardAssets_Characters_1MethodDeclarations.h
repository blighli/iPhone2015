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

// UnityStandardAssets.Characters.FirstPerson.MouseLook
struct MouseLook_t30;
// UnityEngine.Transform
struct Transform_t3;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Quaternion.h"

// System.Void UnityStandardAssets.Characters.FirstPerson.MouseLook::.ctor()
extern "C" void MouseLook__ctor_m70 (MouseLook_t30 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Characters.FirstPerson.MouseLook::Init(UnityEngine.Transform,UnityEngine.Transform)
extern "C" void MouseLook_Init_m71 (MouseLook_t30 * __this, Transform_t3 * ___character, Transform_t3 * ___camera, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Characters.FirstPerson.MouseLook::LookRotation(UnityEngine.Transform,UnityEngine.Transform)
extern "C" void MouseLook_LookRotation_m72 (MouseLook_t30 * __this, Transform_t3 * ___character, Transform_t3 * ___camera, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityStandardAssets.Characters.FirstPerson.MouseLook::ClampRotationAroundXAxis(UnityEngine.Quaternion)
extern "C" Quaternion_t19  MouseLook_ClampRotationAroundXAxis_m73 (MouseLook_t30 * __this, Quaternion_t19  ___q, const MethodInfo* method) IL2CPP_METHOD_ATTR;

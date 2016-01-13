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

// UnityStandardAssets.Vehicles.Ball.Ball
struct Ball_t44;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void UnityStandardAssets.Vehicles.Ball.Ball::.ctor()
extern "C" void Ball__ctor_m90 (Ball_t44 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Vehicles.Ball.Ball::Start()
extern "C" void Ball_Start_m91 (Ball_t44 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Vehicles.Ball.Ball::Move(UnityEngine.Vector3,System.Boolean)
extern "C" void Ball_Move_m92 (Ball_t44 * __this, Vector3_t4  ___moveDirection, bool ___jump, const MethodInfo* method) IL2CPP_METHOD_ATTR;

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

// UnityEngine.ControllerColliderHit
struct ControllerColliderHit_t130;
// UnityEngine.Collider
struct Collider_t132;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityEngine.Collider UnityEngine.ControllerColliderHit::get_collider()
extern "C" Collider_t132 * ControllerColliderHit_get_collider_m533 (ControllerColliderHit_t130 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.ControllerColliderHit::get_point()
extern "C" Vector3_t4  ControllerColliderHit_get_point_m535 (ControllerColliderHit_t130 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

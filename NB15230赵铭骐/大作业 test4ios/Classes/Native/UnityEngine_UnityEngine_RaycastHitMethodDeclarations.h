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

// UnityEngine.Collider
struct Collider_t132;
// UnityEngine.Rigidbody
struct Rigidbody_t15;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_RaycastHit.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityEngine.Vector3 UnityEngine.RaycastHit::get_point()
extern "C" Vector3_t4  RaycastHit_get_point_m498 (RaycastHit_t26 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.RaycastHit::get_normal()
extern "C" Vector3_t4  RaycastHit_get_normal_m521 (RaycastHit_t26 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.RaycastHit::get_distance()
extern "C" float RaycastHit_get_distance_m483 (RaycastHit_t26 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Collider UnityEngine.RaycastHit::get_collider()
extern "C" Collider_t132 * RaycastHit_get_collider_m497 (RaycastHit_t26 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Rigidbody UnityEngine.RaycastHit::get_rigidbody()
extern "C" Rigidbody_t15 * RaycastHit_get_rigidbody_m653 (RaycastHit_t26 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

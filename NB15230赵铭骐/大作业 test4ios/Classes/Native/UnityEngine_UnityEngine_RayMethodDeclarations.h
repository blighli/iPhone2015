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

// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Ray.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void UnityEngine.Ray::.ctor(UnityEngine.Vector3,UnityEngine.Vector3)
extern "C" void Ray__ctor_m574 (Ray_t24 * __this, Vector3_t4  ___origin, Vector3_t4  ___direction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Ray::get_origin()
extern "C" Vector3_t4  Ray_get_origin_m489 (Ray_t24 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Ray::set_origin(UnityEngine.Vector3)
extern "C" void Ray_set_origin_m486 (Ray_t24 * __this, Vector3_t4  ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Ray::get_direction()
extern "C" Vector3_t4  Ray_get_direction_m651 (Ray_t24 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Ray::set_direction(UnityEngine.Vector3)
extern "C" void Ray_set_direction_m488 (Ray_t24 * __this, Vector3_t4  ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Ray::GetPoint(System.Single)
extern "C" Vector3_t4  Ray_GetPoint_m646 (Ray_t24 * __this, float ___distance, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String UnityEngine.Ray::ToString()
extern "C" String_t* Ray_ToString_m1115 (Ray_t24 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

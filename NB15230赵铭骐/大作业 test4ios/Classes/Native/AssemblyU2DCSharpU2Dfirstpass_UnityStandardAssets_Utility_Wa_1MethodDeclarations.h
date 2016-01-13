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

// UnityStandardAssets.Utility.WaypointCircuit
struct WaypointCircuit_t123;
// UnityEngine.Transform[]
struct TransformU5BU5D_t99;

#include "codegen/il2cpp-codegen.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Utility_Wa_0.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void UnityStandardAssets.Utility.WaypointCircuit::.ctor()
extern "C" void WaypointCircuit__ctor_m376 (WaypointCircuit_t123 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityStandardAssets.Utility.WaypointCircuit::get_Length()
extern "C" float WaypointCircuit_get_Length_m377 (WaypointCircuit_t123 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.WaypointCircuit::set_Length(System.Single)
extern "C" void WaypointCircuit_set_Length_m378 (WaypointCircuit_t123 * __this, float ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Transform[] UnityStandardAssets.Utility.WaypointCircuit::get_Waypoints()
extern "C" TransformU5BU5D_t99* WaypointCircuit_get_Waypoints_m379 (WaypointCircuit_t123 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.WaypointCircuit::Awake()
extern "C" void WaypointCircuit_Awake_m380 (WaypointCircuit_t123 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityStandardAssets.Utility.WaypointCircuit/RoutePoint UnityStandardAssets.Utility.WaypointCircuit::GetRoutePoint(System.Single)
extern "C" RoutePoint_t124  WaypointCircuit_GetRoutePoint_m381 (WaypointCircuit_t123 * __this, float ___dist, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityStandardAssets.Utility.WaypointCircuit::GetRoutePosition(System.Single)
extern "C" Vector3_t4  WaypointCircuit_GetRoutePosition_m382 (WaypointCircuit_t123 * __this, float ___dist, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityStandardAssets.Utility.WaypointCircuit::CatmullRom(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
extern "C" Vector3_t4  WaypointCircuit_CatmullRom_m383 (WaypointCircuit_t123 * __this, Vector3_t4  ___p0, Vector3_t4  ___p1, Vector3_t4  ___p2, Vector3_t4  ___p3, float ___i, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.WaypointCircuit::CachePositionsAndDistances()
extern "C" void WaypointCircuit_CachePositionsAndDistances_m384 (WaypointCircuit_t123 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.WaypointCircuit::OnDrawGizmos()
extern "C" void WaypointCircuit_OnDrawGizmos_m385 (WaypointCircuit_t123 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.WaypointCircuit::OnDrawGizmosSelected()
extern "C" void WaypointCircuit_OnDrawGizmosSelected_m386 (WaypointCircuit_t123 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.WaypointCircuit::DrawGizmos(System.Boolean)
extern "C" void WaypointCircuit_DrawGizmos_m387 (WaypointCircuit_t123 * __this, bool ___selected, const MethodInfo* method) IL2CPP_METHOD_ATTR;

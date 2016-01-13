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

// UnityEngine.RaycastHit[]
struct RaycastHitU5BU5D_t25;
// UnityEngine.Collider[]
struct ColliderU5BU5D_t138;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "UnityEngine_UnityEngine_QueryTriggerInteraction.h"
#include "UnityEngine_UnityEngine_RaycastHit.h"
#include "UnityEngine_UnityEngine_Ray.h"

// UnityEngine.Vector3 UnityEngine.Physics::get_gravity()
extern "C" Vector3_t4  Physics_get_gravity_m523 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Physics::INTERNAL_get_gravity(UnityEngine.Vector3&)
extern "C" void Physics_INTERNAL_get_gravity_m1449 (Object_t * __this /* static, unused */, Vector3_t4 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Vector3,UnityEngine.Vector3,System.Single)
extern "C" bool Physics_Raycast_m556 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, float ___maxDistance, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Vector3,UnityEngine.Vector3,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_Raycast_m1450 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, float ___maxDistance, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single,System.Int32)
extern "C" bool Physics_Raycast_m652 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layerMask, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single)
extern "C" bool Physics_Raycast_m584 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_Raycast_m1451 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Ray,UnityEngine.RaycastHit&,System.Single,System.Int32)
extern "C" bool Physics_Raycast_m1452 (Object_t * __this /* static, unused */, Ray_t24  ___ray, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layerMask, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Ray,UnityEngine.RaycastHit&)
extern "C" bool Physics_Raycast_m665 (Object_t * __this /* static, unused */, Ray_t24  ___ray, RaycastHit_t26 * ___hitInfo, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Raycast(UnityEngine.Ray,UnityEngine.RaycastHit&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_Raycast_m1453 (Object_t * __this /* static, unused */, Ray_t24  ___ray, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::RaycastAll(UnityEngine.Ray,System.Single,System.Int32)
extern "C" RaycastHitU5BU5D_t25* Physics_RaycastAll_m1454 (Object_t * __this /* static, unused */, Ray_t24  ___ray, float ___maxDistance, int32_t ___layerMask, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::RaycastAll(UnityEngine.Ray,System.Single)
extern "C" RaycastHitU5BU5D_t25* Physics_RaycastAll_m494 (Object_t * __this /* static, unused */, Ray_t24  ___ray, float ___maxDistance, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::RaycastAll(UnityEngine.Ray,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" RaycastHitU5BU5D_t25* Physics_RaycastAll_m1455 (Object_t * __this /* static, unused */, Ray_t24  ___ray, float ___maxDistance, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::RaycastAll(UnityEngine.Vector3,UnityEngine.Vector3,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" RaycastHitU5BU5D_t25* Physics_RaycastAll_m1456 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::INTERNAL_CALL_RaycastAll(UnityEngine.Vector3&,UnityEngine.Vector3&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" RaycastHitU5BU5D_t25* Physics_INTERNAL_CALL_RaycastAll_m1457 (Object_t * __this /* static, unused */, Vector3_t4 * ___origin, Vector3_t4 * ___direction, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Collider[] UnityEngine.Physics::OverlapSphere(UnityEngine.Vector3,System.Single)
extern "C" ColliderU5BU5D_t138* Physics_OverlapSphere_m490 (Object_t * __this /* static, unused */, Vector3_t4  ___position, float ___radius, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Collider[] UnityEngine.Physics::INTERNAL_CALL_OverlapSphere(UnityEngine.Vector3&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" ColliderU5BU5D_t138* Physics_INTERNAL_CALL_OverlapSphere_m1458 (Object_t * __this /* static, unused */, Vector3_t4 * ___position, float ___radius, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::SphereCast(UnityEngine.Vector3,System.Single,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single)
extern "C" bool Physics_SphereCast_m520 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, float ___radius, Vector3_t4  ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::SphereCast(UnityEngine.Vector3,System.Single,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_SphereCast_m1459 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, float ___radius, Vector3_t4  ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::SphereCast(UnityEngine.Ray,System.Single,System.Single)
extern "C" bool Physics_SphereCast_m575 (Object_t * __this /* static, unused */, Ray_t24  ___ray, float ___radius, float ___maxDistance, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::SphereCast(UnityEngine.Ray,System.Single,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_SphereCast_m1460 (Object_t * __this /* static, unused */, Ray_t24  ___ray, float ___radius, float ___maxDistance, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::CapsuleCastAll(UnityEngine.Vector3,UnityEngine.Vector3,System.Single,UnityEngine.Vector3,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" RaycastHitU5BU5D_t25* Physics_CapsuleCastAll_m1461 (Object_t * __this /* static, unused */, Vector3_t4  ___point1, Vector3_t4  ___point2, float ___radius, Vector3_t4  ___direction, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::INTERNAL_CALL_CapsuleCastAll(UnityEngine.Vector3&,UnityEngine.Vector3&,System.Single,UnityEngine.Vector3&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" RaycastHitU5BU5D_t25* Physics_INTERNAL_CALL_CapsuleCastAll_m1462 (Object_t * __this /* static, unused */, Vector3_t4 * ___point1, Vector3_t4 * ___point2, float ___radius, Vector3_t4 * ___direction, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::SphereCastAll(UnityEngine.Ray,System.Single,System.Single)
extern "C" RaycastHitU5BU5D_t25* Physics_SphereCastAll_m495 (Object_t * __this /* static, unused */, Ray_t24  ___ray, float ___radius, float ___maxDistance, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RaycastHit[] UnityEngine.Physics::SphereCastAll(UnityEngine.Ray,System.Single,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" RaycastHitU5BU5D_t25* Physics_SphereCastAll_m1463 (Object_t * __this /* static, unused */, Ray_t24  ___ray, float ___radius, float ___maxDistance, int32_t ___layerMask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Internal_Raycast(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_Internal_Raycast_m1464 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::INTERNAL_CALL_Internal_Raycast(UnityEngine.Vector3&,UnityEngine.Vector3&,UnityEngine.RaycastHit&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_INTERNAL_CALL_Internal_Raycast_m1465 (Object_t * __this /* static, unused */, Vector3_t4 * ___origin, Vector3_t4 * ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Internal_CapsuleCast(UnityEngine.Vector3,UnityEngine.Vector3,System.Single,UnityEngine.Vector3,UnityEngine.RaycastHit&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_Internal_CapsuleCast_m1466 (Object_t * __this /* static, unused */, Vector3_t4  ___point1, Vector3_t4  ___point2, float ___radius, Vector3_t4  ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::INTERNAL_CALL_Internal_CapsuleCast(UnityEngine.Vector3&,UnityEngine.Vector3&,System.Single,UnityEngine.Vector3&,UnityEngine.RaycastHit&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_INTERNAL_CALL_Internal_CapsuleCast_m1467 (Object_t * __this /* static, unused */, Vector3_t4 * ___point1, Vector3_t4 * ___point2, float ___radius, Vector3_t4 * ___direction, RaycastHit_t26 * ___hitInfo, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::Internal_RaycastTest(UnityEngine.Vector3,UnityEngine.Vector3,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_Internal_RaycastTest_m1468 (Object_t * __this /* static, unused */, Vector3_t4  ___origin, Vector3_t4  ___direction, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Physics::INTERNAL_CALL_Internal_RaycastTest(UnityEngine.Vector3&,UnityEngine.Vector3&,System.Single,System.Int32,UnityEngine.QueryTriggerInteraction)
extern "C" bool Physics_INTERNAL_CALL_Internal_RaycastTest_m1469 (Object_t * __this /* static, unused */, Vector3_t4 * ___origin, Vector3_t4 * ___direction, float ___maxDistance, int32_t ___layermask, int32_t ___queryTriggerInteraction, const MethodInfo* method) IL2CPP_METHOD_ATTR;

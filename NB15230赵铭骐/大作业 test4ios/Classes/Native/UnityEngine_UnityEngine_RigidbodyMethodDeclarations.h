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

// UnityEngine.Rigidbody
struct Rigidbody_t15;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "UnityEngine_UnityEngine_RigidbodyConstraints.h"
#include "UnityEngine_UnityEngine_ForceMode.h"

// UnityEngine.Vector3 UnityEngine.Rigidbody::get_velocity()
extern "C" Vector3_t4  Rigidbody_get_velocity_m452 (Rigidbody_t15 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::set_velocity(UnityEngine.Vector3)
extern "C" void Rigidbody_set_velocity_m544 (Rigidbody_t15 * __this, Vector3_t4  ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_get_velocity(UnityEngine.Vector3&)
extern "C" void Rigidbody_INTERNAL_get_velocity_m1470 (Rigidbody_t15 * __this, Vector3_t4 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_set_velocity(UnityEngine.Vector3&)
extern "C" void Rigidbody_INTERNAL_set_velocity_m1471 (Rigidbody_t15 * __this, Vector3_t4 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::set_angularVelocity(UnityEngine.Vector3)
extern "C" void Rigidbody_set_angularVelocity_m677 (Rigidbody_t15 * __this, Vector3_t4  ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_set_angularVelocity(UnityEngine.Vector3&)
extern "C" void Rigidbody_INTERNAL_set_angularVelocity_m1472 (Rigidbody_t15 * __this, Vector3_t4 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rigidbody::get_drag()
extern "C" float Rigidbody_get_drag_m642 (Rigidbody_t15 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::set_drag(System.Single)
extern "C" void Rigidbody_set_drag_m543 (Rigidbody_t15 * __this, float ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Rigidbody::get_angularDrag()
extern "C" float Rigidbody_get_angularDrag_m643 (Rigidbody_t15 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::set_angularDrag(System.Single)
extern "C" void Rigidbody_set_angularDrag_m644 (Rigidbody_t15 * __this, float ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Rigidbody::get_isKinematic()
extern "C" bool Rigidbody_get_isKinematic_m534 (Rigidbody_t15 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::set_isKinematic(System.Boolean)
extern "C" void Rigidbody_set_isKinematic_m657 (Rigidbody_t15 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::set_constraints(UnityEngine.RigidbodyConstraints)
extern "C" void Rigidbody_set_constraints_m567 (Rigidbody_t15 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::AddForce(UnityEngine.Vector3,UnityEngine.ForceMode)
extern "C" void Rigidbody_AddForce_m542 (Rigidbody_t15 * __this, Vector3_t4  ___force, int32_t ___mode, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::AddForce(UnityEngine.Vector3)
extern "C" void Rigidbody_AddForce_m555 (Rigidbody_t15 * __this, Vector3_t4  ___force, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_CALL_AddForce(UnityEngine.Rigidbody,UnityEngine.Vector3&,UnityEngine.ForceMode)
extern "C" void Rigidbody_INTERNAL_CALL_AddForce_m1473 (Object_t * __this /* static, unused */, Rigidbody_t15 * ___self, Vector3_t4 * ___force, int32_t ___mode, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::AddTorque(UnityEngine.Vector3)
extern "C" void Rigidbody_AddTorque_m554 (Rigidbody_t15 * __this, Vector3_t4  ___torque, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_CALL_AddTorque(UnityEngine.Rigidbody,UnityEngine.Vector3&,UnityEngine.ForceMode)
extern "C" void Rigidbody_INTERNAL_CALL_AddTorque_m1474 (Object_t * __this /* static, unused */, Rigidbody_t15 * ___self, Vector3_t4 * ___torque, int32_t ___mode, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::AddForceAtPosition(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.ForceMode)
extern "C" void Rigidbody_AddForceAtPosition_m536 (Rigidbody_t15 * __this, Vector3_t4  ___force, Vector3_t4  ___position, int32_t ___mode, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_CALL_AddForceAtPosition(UnityEngine.Rigidbody,UnityEngine.Vector3&,UnityEngine.Vector3&,UnityEngine.ForceMode)
extern "C" void Rigidbody_INTERNAL_CALL_AddForceAtPosition_m1475 (Object_t * __this /* static, unused */, Rigidbody_t15 * ___self, Vector3_t4 * ___force, Vector3_t4 * ___position, int32_t ___mode, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Rigidbody::get_position()
extern "C" Vector3_t4  Rigidbody_get_position_m573 (Rigidbody_t15 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_get_position(UnityEngine.Vector3&)
extern "C" void Rigidbody_INTERNAL_get_position_m1476 (Rigidbody_t15 * __this, Vector3_t4 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::Sleep()
extern "C" void Rigidbody_Sleep_m545 (Rigidbody_t15 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::INTERNAL_CALL_Sleep(UnityEngine.Rigidbody)
extern "C" void Rigidbody_INTERNAL_CALL_Sleep_m1477 (Object_t * __this /* static, unused */, Rigidbody_t15 * ___self, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Rigidbody::set_maxAngularVelocity(System.Single)
extern "C" void Rigidbody_set_maxAngularVelocity_m553 (Rigidbody_t15 * __this, float ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;

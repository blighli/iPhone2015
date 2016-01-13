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
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Quaternion.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void UnityEngine.Quaternion::.ctor(System.Single,System.Single,System.Single,System.Single)
extern "C" void Quaternion__ctor_m991 (Quaternion_t19 * __this, float ___x, float ___y, float ___z, float ___w, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Single UnityEngine.Quaternion::Dot(UnityEngine.Quaternion,UnityEngine.Quaternion)
extern "C" float Quaternion_Dot_m992 (Object_t * __this /* static, unused */, Quaternion_t19  ___a, Quaternion_t19  ___b, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::AngleAxis(System.Single,UnityEngine.Vector3)
extern "C" Quaternion_t19  Quaternion_AngleAxis_m551 (Object_t * __this /* static, unused */, float ___angle, Vector3_t4  ___axis, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::INTERNAL_CALL_AngleAxis(System.Single,UnityEngine.Vector3&)
extern "C" Quaternion_t19  Quaternion_INTERNAL_CALL_AngleAxis_m993 (Object_t * __this /* static, unused */, float ___angle, Vector3_t4 * ___axis, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::LookRotation(UnityEngine.Vector3,UnityEngine.Vector3)
extern "C" Quaternion_t19  Quaternion_LookRotation_m460 (Object_t * __this /* static, unused */, Vector3_t4  ___forward, Vector3_t4  ___upwards, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::LookRotation(UnityEngine.Vector3)
extern "C" Quaternion_t19  Quaternion_LookRotation_m700 (Object_t * __this /* static, unused */, Vector3_t4  ___forward, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::INTERNAL_CALL_LookRotation(UnityEngine.Vector3&,UnityEngine.Vector3&)
extern "C" Quaternion_t19  Quaternion_INTERNAL_CALL_LookRotation_m994 (Object_t * __this /* static, unused */, Vector3_t4 * ___forward, Vector3_t4 * ___upwards, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::Slerp(UnityEngine.Quaternion,UnityEngine.Quaternion,System.Single)
extern "C" Quaternion_t19  Quaternion_Slerp_m472 (Object_t * __this /* static, unused */, Quaternion_t19  ___a, Quaternion_t19  ___b, float ___t, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::INTERNAL_CALL_Slerp(UnityEngine.Quaternion&,UnityEngine.Quaternion&,System.Single)
extern "C" Quaternion_t19  Quaternion_INTERNAL_CALL_Slerp_m995 (Object_t * __this /* static, unused */, Quaternion_t19 * ___a, Quaternion_t19 * ___b, float ___t, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::Lerp(UnityEngine.Quaternion,UnityEngine.Quaternion,System.Single)
extern "C" Quaternion_t19  Quaternion_Lerp_m463 (Object_t * __this /* static, unused */, Quaternion_t19  ___a, Quaternion_t19  ___b, float ___t, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::INTERNAL_CALL_Lerp(UnityEngine.Quaternion&,UnityEngine.Quaternion&,System.Single)
extern "C" Quaternion_t19  Quaternion_INTERNAL_CALL_Lerp_m996 (Object_t * __this /* static, unused */, Quaternion_t19 * ___a, Quaternion_t19 * ___b, float ___t, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::Inverse(UnityEngine.Quaternion)
extern "C" Quaternion_t19  Quaternion_Inverse_m997 (Object_t * __this /* static, unused */, Quaternion_t19  ___rotation, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::INTERNAL_CALL_Inverse(UnityEngine.Quaternion&)
extern "C" Quaternion_t19  Quaternion_INTERNAL_CALL_Inverse_m998 (Object_t * __this /* static, unused */, Quaternion_t19 * ___rotation, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String UnityEngine.Quaternion::ToString()
extern "C" String_t* Quaternion_ToString_m999 (Quaternion_t19 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Quaternion::get_eulerAngles()
extern "C" Vector3_t4  Quaternion_get_eulerAngles_m467 (Quaternion_t19 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::Euler(System.Single,System.Single,System.Single)
extern "C" Quaternion_t19  Quaternion_Euler_m471 (Object_t * __this /* static, unused */, float ___x, float ___y, float ___z, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Quaternion::Internal_ToEulerRad(UnityEngine.Quaternion)
extern "C" Vector3_t4  Quaternion_Internal_ToEulerRad_m1000 (Object_t * __this /* static, unused */, Quaternion_t19  ___rotation, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Quaternion::INTERNAL_CALL_Internal_ToEulerRad(UnityEngine.Quaternion&)
extern "C" Vector3_t4  Quaternion_INTERNAL_CALL_Internal_ToEulerRad_m1001 (Object_t * __this /* static, unused */, Quaternion_t19 * ___rotation, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::Internal_FromEulerRad(UnityEngine.Vector3)
extern "C" Quaternion_t19  Quaternion_Internal_FromEulerRad_m1002 (Object_t * __this /* static, unused */, Vector3_t4  ___euler, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::INTERNAL_CALL_Internal_FromEulerRad(UnityEngine.Vector3&)
extern "C" Quaternion_t19  Quaternion_INTERNAL_CALL_Internal_FromEulerRad_m1003 (Object_t * __this /* static, unused */, Vector3_t4 * ___euler, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.Quaternion::GetHashCode()
extern "C" int32_t Quaternion_GetHashCode_m1004 (Quaternion_t19 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Quaternion::Equals(System.Object)
extern "C" bool Quaternion_Equals_m1005 (Quaternion_t19 * __this, Object_t * ___other, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Quaternion UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Quaternion)
extern "C" Quaternion_t19  Quaternion_op_Multiply_m478 (Object_t * __this /* static, unused */, Quaternion_t19  ___lhs, Quaternion_t19  ___rhs, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityEngine.Quaternion::op_Multiply(UnityEngine.Quaternion,UnityEngine.Vector3)
extern "C" Vector3_t4  Quaternion_op_Multiply_m552 (Object_t * __this /* static, unused */, Quaternion_t19  ___rotation, Vector3_t4  ___point, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.Quaternion::op_Inequality(UnityEngine.Quaternion,UnityEngine.Quaternion)
extern "C" bool Quaternion_op_Inequality_m1006 (Object_t * __this /* static, unused */, Quaternion_t19  ___lhs, Quaternion_t19  ___rhs, const MethodInfo* method) IL2CPP_METHOD_ATTR;

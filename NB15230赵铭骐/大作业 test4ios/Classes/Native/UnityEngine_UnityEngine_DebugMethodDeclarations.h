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
// UnityEngine.Object
struct Object_t76;
struct Object_t76_marshaled;
// System.Exception
struct Exception_t152;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "UnityEngine_UnityEngine_Color.h"

// System.Void UnityEngine.Debug::DrawLine(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.Color,System.Single,System.Boolean)
extern "C" void Debug_DrawLine_m1267 (Object_t * __this /* static, unused */, Vector3_t4  ___start, Vector3_t4  ___end, Color_t139  ___color, float ___duration, bool ___depthTest, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::INTERNAL_CALL_DrawLine(UnityEngine.Vector3&,UnityEngine.Vector3&,UnityEngine.Color&,System.Single,System.Boolean)
extern "C" void Debug_INTERNAL_CALL_DrawLine_m1268 (Object_t * __this /* static, unused */, Vector3_t4 * ___start, Vector3_t4 * ___end, Color_t139 * ___color, float ___duration, bool ___depthTest, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::DrawRay(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.Color)
extern "C" void Debug_DrawRay_m500 (Object_t * __this /* static, unused */, Vector3_t4  ___start, Vector3_t4  ___dir, Color_t139  ___color, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::DrawRay(UnityEngine.Vector3,UnityEngine.Vector3,UnityEngine.Color,System.Single,System.Boolean)
extern "C" void Debug_DrawRay_m1269 (Object_t * __this /* static, unused */, Vector3_t4  ___start, Vector3_t4  ___dir, Color_t139  ___color, float ___duration, bool ___depthTest, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::Internal_Log(System.Int32,System.String,UnityEngine.Object)
extern "C" void Debug_Internal_Log_m1270 (Object_t * __this /* static, unused */, int32_t ___level, String_t* ___msg, Object_t76 * ___obj, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::Internal_LogException(System.Exception,UnityEngine.Object)
extern "C" void Debug_Internal_LogException_m1271 (Object_t * __this /* static, unused */, Exception_t152 * ___exception, Object_t76 * ___obj, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::Log(System.Object)
extern "C" void Debug_Log_m623 (Object_t * __this /* static, unused */, Object_t * ___message, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::LogError(System.Object)
extern "C" void Debug_LogError_m614 (Object_t * __this /* static, unused */, Object_t * ___message, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::LogError(System.Object,UnityEngine.Object)
extern "C" void Debug_LogError_m1272 (Object_t * __this /* static, unused */, Object_t * ___message, Object_t76 * ___context, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::LogException(System.Exception)
extern "C" void Debug_LogException_m1273 (Object_t * __this /* static, unused */, Exception_t152 * ___exception, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::LogException(System.Exception,UnityEngine.Object)
extern "C" void Debug_LogException_m1274 (Object_t * __this /* static, unused */, Exception_t152 * ___exception, Object_t76 * ___context, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::LogWarning(System.Object)
extern "C" void Debug_LogWarning_m558 (Object_t * __this /* static, unused */, Object_t * ___message, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Debug::LogWarning(System.Object,UnityEngine.Object)
extern "C" void Debug_LogWarning_m1275 (Object_t * __this /* static, unused */, Object_t * ___message, Object_t76 * ___context, const MethodInfo* method) IL2CPP_METHOD_ATTR;

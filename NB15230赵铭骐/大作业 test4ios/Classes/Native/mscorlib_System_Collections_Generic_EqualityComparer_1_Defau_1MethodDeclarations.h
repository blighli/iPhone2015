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

// System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector4>
struct DefaultComparer_t1944;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector4.h"

// System.Void System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector4>::.ctor()
extern "C" void DefaultComparer__ctor_m12207_gshared (DefaultComparer_t1944 * __this, const MethodInfo* method);
#define DefaultComparer__ctor_m12207(__this, method) (( void (*) (DefaultComparer_t1944 *, const MethodInfo*))DefaultComparer__ctor_m12207_gshared)(__this, method)
// System.Int32 System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector4>::GetHashCode(T)
extern "C" int32_t DefaultComparer_GetHashCode_m12208_gshared (DefaultComparer_t1944 * __this, Vector4_t234  ___obj, const MethodInfo* method);
#define DefaultComparer_GetHashCode_m12208(__this, ___obj, method) (( int32_t (*) (DefaultComparer_t1944 *, Vector4_t234 , const MethodInfo*))DefaultComparer_GetHashCode_m12208_gshared)(__this, ___obj, method)
// System.Boolean System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector4>::Equals(T,T)
extern "C" bool DefaultComparer_Equals_m12209_gshared (DefaultComparer_t1944 * __this, Vector4_t234  ___x, Vector4_t234  ___y, const MethodInfo* method);
#define DefaultComparer_Equals_m12209(__this, ___x, ___y, method) (( bool (*) (DefaultComparer_t1944 *, Vector4_t234 , Vector4_t234 , const MethodInfo*))DefaultComparer_Equals_m12209_gshared)(__this, ___x, ___y, method)

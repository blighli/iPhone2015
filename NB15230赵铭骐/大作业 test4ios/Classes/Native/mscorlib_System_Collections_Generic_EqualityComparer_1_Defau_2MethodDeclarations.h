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

// System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector2>
struct DefaultComparer_t1954;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector2.h"

// System.Void System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector2>::.ctor()
extern "C" void DefaultComparer__ctor_m12351_gshared (DefaultComparer_t1954 * __this, const MethodInfo* method);
#define DefaultComparer__ctor_m12351(__this, method) (( void (*) (DefaultComparer_t1954 *, const MethodInfo*))DefaultComparer__ctor_m12351_gshared)(__this, method)
// System.Int32 System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector2>::GetHashCode(T)
extern "C" int32_t DefaultComparer_GetHashCode_m12352_gshared (DefaultComparer_t1954 * __this, Vector2_t6  ___obj, const MethodInfo* method);
#define DefaultComparer_GetHashCode_m12352(__this, ___obj, method) (( int32_t (*) (DefaultComparer_t1954 *, Vector2_t6 , const MethodInfo*))DefaultComparer_GetHashCode_m12352_gshared)(__this, ___obj, method)
// System.Boolean System.Collections.Generic.EqualityComparer`1/DefaultComparer<UnityEngine.Vector2>::Equals(T,T)
extern "C" bool DefaultComparer_Equals_m12353_gshared (DefaultComparer_t1954 * __this, Vector2_t6  ___x, Vector2_t6  ___y, const MethodInfo* method);
#define DefaultComparer_Equals_m12353(__this, ___x, ___y, method) (( bool (*) (DefaultComparer_t1954 *, Vector2_t6 , Vector2_t6 , const MethodInfo*))DefaultComparer_Equals_m12353_gshared)(__this, ___x, ___y, method)

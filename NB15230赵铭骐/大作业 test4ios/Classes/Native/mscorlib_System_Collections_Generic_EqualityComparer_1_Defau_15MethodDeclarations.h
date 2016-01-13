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

// System.Collections.Generic.EqualityComparer`1/DefaultComparer<System.TimeSpan>
struct DefaultComparer_t2429;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_TimeSpan.h"

// System.Void System.Collections.Generic.EqualityComparer`1/DefaultComparer<System.TimeSpan>::.ctor()
extern "C" void DefaultComparer__ctor_m18044_gshared (DefaultComparer_t2429 * __this, const MethodInfo* method);
#define DefaultComparer__ctor_m18044(__this, method) (( void (*) (DefaultComparer_t2429 *, const MethodInfo*))DefaultComparer__ctor_m18044_gshared)(__this, method)
// System.Int32 System.Collections.Generic.EqualityComparer`1/DefaultComparer<System.TimeSpan>::GetHashCode(T)
extern "C" int32_t DefaultComparer_GetHashCode_m18045_gshared (DefaultComparer_t2429 * __this, TimeSpan_t803  ___obj, const MethodInfo* method);
#define DefaultComparer_GetHashCode_m18045(__this, ___obj, method) (( int32_t (*) (DefaultComparer_t2429 *, TimeSpan_t803 , const MethodInfo*))DefaultComparer_GetHashCode_m18045_gshared)(__this, ___obj, method)
// System.Boolean System.Collections.Generic.EqualityComparer`1/DefaultComparer<System.TimeSpan>::Equals(T,T)
extern "C" bool DefaultComparer_Equals_m18046_gshared (DefaultComparer_t2429 * __this, TimeSpan_t803  ___x, TimeSpan_t803  ___y, const MethodInfo* method);
#define DefaultComparer_Equals_m18046(__this, ___x, ___y, method) (( bool (*) (DefaultComparer_t2429 *, TimeSpan_t803 , TimeSpan_t803 , const MethodInfo*))DefaultComparer_Equals_m18046_gshared)(__this, ___x, ___y, method)

﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// System.Collections.Generic.Dictionary`2/Transform`1<System.Object,System.Object,System.Collections.DictionaryEntry>
struct Transform_1_t1856;
// System.Object
struct Object_t;
// System.IAsyncResult
struct IAsyncResult_t221;
// System.AsyncCallback
struct AsyncCallback_t222;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IntPtr.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Generic.Dictionary`2/Transform`1<System.Object,System.Object,System.Collections.DictionaryEntry>::.ctor(System.Object,System.IntPtr)
extern "C" void Transform_1__ctor_m11129_gshared (Transform_1_t1856 * __this, Object_t * ___object, IntPtr_t ___method, const MethodInfo* method);
#define Transform_1__ctor_m11129(__this, ___object, ___method, method) (( void (*) (Transform_1_t1856 *, Object_t *, IntPtr_t, const MethodInfo*))Transform_1__ctor_m11129_gshared)(__this, ___object, ___method, method)
// TRet System.Collections.Generic.Dictionary`2/Transform`1<System.Object,System.Object,System.Collections.DictionaryEntry>::Invoke(TKey,TValue)
extern "C" DictionaryEntry_t900  Transform_1_Invoke_m11130_gshared (Transform_1_t1856 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Transform_1_Invoke_m11130(__this, ___key, ___value, method) (( DictionaryEntry_t900  (*) (Transform_1_t1856 *, Object_t *, Object_t *, const MethodInfo*))Transform_1_Invoke_m11130_gshared)(__this, ___key, ___value, method)
// System.IAsyncResult System.Collections.Generic.Dictionary`2/Transform`1<System.Object,System.Object,System.Collections.DictionaryEntry>::BeginInvoke(TKey,TValue,System.AsyncCallback,System.Object)
extern "C" Object_t * Transform_1_BeginInvoke_m11131_gshared (Transform_1_t1856 * __this, Object_t * ___key, Object_t * ___value, AsyncCallback_t222 * ___callback, Object_t * ___object, const MethodInfo* method);
#define Transform_1_BeginInvoke_m11131(__this, ___key, ___value, ___callback, ___object, method) (( Object_t * (*) (Transform_1_t1856 *, Object_t *, Object_t *, AsyncCallback_t222 *, Object_t *, const MethodInfo*))Transform_1_BeginInvoke_m11131_gshared)(__this, ___key, ___value, ___callback, ___object, method)
// TRet System.Collections.Generic.Dictionary`2/Transform`1<System.Object,System.Object,System.Collections.DictionaryEntry>::EndInvoke(System.IAsyncResult)
extern "C" DictionaryEntry_t900  Transform_1_EndInvoke_m11132_gshared (Transform_1_t1856 * __this, Object_t * ___result, const MethodInfo* method);
#define Transform_1_EndInvoke_m11132(__this, ___result, method) (( DictionaryEntry_t900  (*) (Transform_1_t1856 *, Object_t *, const MethodInfo*))Transform_1_EndInvoke_m11132_gshared)(__this, ___result, method)

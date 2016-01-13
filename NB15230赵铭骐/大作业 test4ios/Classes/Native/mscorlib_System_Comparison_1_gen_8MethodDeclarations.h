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

// System.Comparison`1<UnityEngine.Vector3>
struct Comparison_1_t1938;
// System.Object
struct Object_t;
// System.IAsyncResult
struct IAsyncResult_t221;
// System.AsyncCallback
struct AsyncCallback_t222;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IntPtr.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void System.Comparison`1<UnityEngine.Vector3>::.ctor(System.Object,System.IntPtr)
extern "C" void Comparison_1__ctor_m12076_gshared (Comparison_1_t1938 * __this, Object_t * ___object, IntPtr_t ___method, const MethodInfo* method);
#define Comparison_1__ctor_m12076(__this, ___object, ___method, method) (( void (*) (Comparison_1_t1938 *, Object_t *, IntPtr_t, const MethodInfo*))Comparison_1__ctor_m12076_gshared)(__this, ___object, ___method, method)
// System.Int32 System.Comparison`1<UnityEngine.Vector3>::Invoke(T,T)
extern "C" int32_t Comparison_1_Invoke_m12077_gshared (Comparison_1_t1938 * __this, Vector3_t4  ___x, Vector3_t4  ___y, const MethodInfo* method);
#define Comparison_1_Invoke_m12077(__this, ___x, ___y, method) (( int32_t (*) (Comparison_1_t1938 *, Vector3_t4 , Vector3_t4 , const MethodInfo*))Comparison_1_Invoke_m12077_gshared)(__this, ___x, ___y, method)
// System.IAsyncResult System.Comparison`1<UnityEngine.Vector3>::BeginInvoke(T,T,System.AsyncCallback,System.Object)
extern "C" Object_t * Comparison_1_BeginInvoke_m12078_gshared (Comparison_1_t1938 * __this, Vector3_t4  ___x, Vector3_t4  ___y, AsyncCallback_t222 * ___callback, Object_t * ___object, const MethodInfo* method);
#define Comparison_1_BeginInvoke_m12078(__this, ___x, ___y, ___callback, ___object, method) (( Object_t * (*) (Comparison_1_t1938 *, Vector3_t4 , Vector3_t4 , AsyncCallback_t222 *, Object_t *, const MethodInfo*))Comparison_1_BeginInvoke_m12078_gshared)(__this, ___x, ___y, ___callback, ___object, method)
// System.Int32 System.Comparison`1<UnityEngine.Vector3>::EndInvoke(System.IAsyncResult)
extern "C" int32_t Comparison_1_EndInvoke_m12079_gshared (Comparison_1_t1938 * __this, Object_t * ___result, const MethodInfo* method);
#define Comparison_1_EndInvoke_m12079(__this, ___result, method) (( int32_t (*) (Comparison_1_t1938 *, Object_t *, const MethodInfo*))Comparison_1_EndInvoke_m12079_gshared)(__this, ___result, method)

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

// System.Comparison`1<UnityEngine.Vector4>
struct Comparison_1_t1948;
// System.Object
struct Object_t;
// System.IAsyncResult
struct IAsyncResult_t221;
// System.AsyncCallback
struct AsyncCallback_t222;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IntPtr.h"
#include "UnityEngine_UnityEngine_Vector4.h"

// System.Void System.Comparison`1<UnityEngine.Vector4>::.ctor(System.Object,System.IntPtr)
extern "C" void Comparison_1__ctor_m12220_gshared (Comparison_1_t1948 * __this, Object_t * ___object, IntPtr_t ___method, const MethodInfo* method);
#define Comparison_1__ctor_m12220(__this, ___object, ___method, method) (( void (*) (Comparison_1_t1948 *, Object_t *, IntPtr_t, const MethodInfo*))Comparison_1__ctor_m12220_gshared)(__this, ___object, ___method, method)
// System.Int32 System.Comparison`1<UnityEngine.Vector4>::Invoke(T,T)
extern "C" int32_t Comparison_1_Invoke_m12221_gshared (Comparison_1_t1948 * __this, Vector4_t234  ___x, Vector4_t234  ___y, const MethodInfo* method);
#define Comparison_1_Invoke_m12221(__this, ___x, ___y, method) (( int32_t (*) (Comparison_1_t1948 *, Vector4_t234 , Vector4_t234 , const MethodInfo*))Comparison_1_Invoke_m12221_gshared)(__this, ___x, ___y, method)
// System.IAsyncResult System.Comparison`1<UnityEngine.Vector4>::BeginInvoke(T,T,System.AsyncCallback,System.Object)
extern "C" Object_t * Comparison_1_BeginInvoke_m12222_gshared (Comparison_1_t1948 * __this, Vector4_t234  ___x, Vector4_t234  ___y, AsyncCallback_t222 * ___callback, Object_t * ___object, const MethodInfo* method);
#define Comparison_1_BeginInvoke_m12222(__this, ___x, ___y, ___callback, ___object, method) (( Object_t * (*) (Comparison_1_t1948 *, Vector4_t234 , Vector4_t234 , AsyncCallback_t222 *, Object_t *, const MethodInfo*))Comparison_1_BeginInvoke_m12222_gshared)(__this, ___x, ___y, ___callback, ___object, method)
// System.Int32 System.Comparison`1<UnityEngine.Vector4>::EndInvoke(System.IAsyncResult)
extern "C" int32_t Comparison_1_EndInvoke_m12223_gshared (Comparison_1_t1948 * __this, Object_t * ___result, const MethodInfo* method);
#define Comparison_1_EndInvoke_m12223(__this, ___result, method) (( int32_t (*) (Comparison_1_t1948 *, Object_t *, const MethodInfo*))Comparison_1_EndInvoke_m12223_gshared)(__this, ___result, method)

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

// System.Predicate`1<UnityEngine.Vector3>
struct Predicate_1_t1935;
// System.Object
struct Object_t;
// System.IAsyncResult
struct IAsyncResult_t221;
// System.AsyncCallback
struct AsyncCallback_t222;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IntPtr.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void System.Predicate`1<UnityEngine.Vector3>::.ctor(System.Object,System.IntPtr)
extern "C" void Predicate_1__ctor_m12066_gshared (Predicate_1_t1935 * __this, Object_t * ___object, IntPtr_t ___method, const MethodInfo* method);
#define Predicate_1__ctor_m12066(__this, ___object, ___method, method) (( void (*) (Predicate_1_t1935 *, Object_t *, IntPtr_t, const MethodInfo*))Predicate_1__ctor_m12066_gshared)(__this, ___object, ___method, method)
// System.Boolean System.Predicate`1<UnityEngine.Vector3>::Invoke(T)
extern "C" bool Predicate_1_Invoke_m12067_gshared (Predicate_1_t1935 * __this, Vector3_t4  ___obj, const MethodInfo* method);
#define Predicate_1_Invoke_m12067(__this, ___obj, method) (( bool (*) (Predicate_1_t1935 *, Vector3_t4 , const MethodInfo*))Predicate_1_Invoke_m12067_gshared)(__this, ___obj, method)
// System.IAsyncResult System.Predicate`1<UnityEngine.Vector3>::BeginInvoke(T,System.AsyncCallback,System.Object)
extern "C" Object_t * Predicate_1_BeginInvoke_m12068_gshared (Predicate_1_t1935 * __this, Vector3_t4  ___obj, AsyncCallback_t222 * ___callback, Object_t * ___object, const MethodInfo* method);
#define Predicate_1_BeginInvoke_m12068(__this, ___obj, ___callback, ___object, method) (( Object_t * (*) (Predicate_1_t1935 *, Vector3_t4 , AsyncCallback_t222 *, Object_t *, const MethodInfo*))Predicate_1_BeginInvoke_m12068_gshared)(__this, ___obj, ___callback, ___object, method)
// System.Boolean System.Predicate`1<UnityEngine.Vector3>::EndInvoke(System.IAsyncResult)
extern "C" bool Predicate_1_EndInvoke_m12069_gshared (Predicate_1_t1935 * __this, Object_t * ___result, const MethodInfo* method);
#define Predicate_1_EndInvoke_m12069(__this, ___result, method) (( bool (*) (Predicate_1_t1935 *, Object_t *, const MethodInfo*))Predicate_1_EndInvoke_m12069_gshared)(__this, ___result, method)

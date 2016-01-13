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

// System.Predicate`1<UnityEngine.EventSystems.RaycastResult>
struct Predicate_1_t2121;
// System.Object
struct Object_t;
// System.IAsyncResult
struct IAsyncResult_t221;
// System.AsyncCallback
struct AsyncCallback_t222;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IntPtr.h"
#include "UnityEngine_UI_UnityEngine_EventSystems_RaycastResult.h"

// System.Void System.Predicate`1<UnityEngine.EventSystems.RaycastResult>::.ctor(System.Object,System.IntPtr)
extern "C" void Predicate_1__ctor_m14355_gshared (Predicate_1_t2121 * __this, Object_t * ___object, IntPtr_t ___method, const MethodInfo* method);
#define Predicate_1__ctor_m14355(__this, ___object, ___method, method) (( void (*) (Predicate_1_t2121 *, Object_t *, IntPtr_t, const MethodInfo*))Predicate_1__ctor_m14355_gshared)(__this, ___object, ___method, method)
// System.Boolean System.Predicate`1<UnityEngine.EventSystems.RaycastResult>::Invoke(T)
extern "C" bool Predicate_1_Invoke_m14356_gshared (Predicate_1_t2121 * __this, RaycastResult_t508  ___obj, const MethodInfo* method);
#define Predicate_1_Invoke_m14356(__this, ___obj, method) (( bool (*) (Predicate_1_t2121 *, RaycastResult_t508 , const MethodInfo*))Predicate_1_Invoke_m14356_gshared)(__this, ___obj, method)
// System.IAsyncResult System.Predicate`1<UnityEngine.EventSystems.RaycastResult>::BeginInvoke(T,System.AsyncCallback,System.Object)
extern "C" Object_t * Predicate_1_BeginInvoke_m14357_gshared (Predicate_1_t2121 * __this, RaycastResult_t508  ___obj, AsyncCallback_t222 * ___callback, Object_t * ___object, const MethodInfo* method);
#define Predicate_1_BeginInvoke_m14357(__this, ___obj, ___callback, ___object, method) (( Object_t * (*) (Predicate_1_t2121 *, RaycastResult_t508 , AsyncCallback_t222 *, Object_t *, const MethodInfo*))Predicate_1_BeginInvoke_m14357_gshared)(__this, ___obj, ___callback, ___object, method)
// System.Boolean System.Predicate`1<UnityEngine.EventSystems.RaycastResult>::EndInvoke(System.IAsyncResult)
extern "C" bool Predicate_1_EndInvoke_m14358_gshared (Predicate_1_t2121 * __this, Object_t * ___result, const MethodInfo* method);
#define Predicate_1_EndInvoke_m14358(__this, ___result, method) (( bool (*) (Predicate_1_t2121 *, Object_t *, const MethodInfo*))Predicate_1_EndInvoke_m14358_gshared)(__this, ___result, method)

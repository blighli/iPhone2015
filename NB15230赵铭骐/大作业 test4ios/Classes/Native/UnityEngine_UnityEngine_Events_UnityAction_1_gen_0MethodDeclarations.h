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

// UnityEngine.Events.UnityAction`1<UnityEngine.Color>
struct UnityAction_1_t676;
// System.Object
struct Object_t;
// System.IAsyncResult
struct IAsyncResult_t221;
// System.AsyncCallback
struct AsyncCallback_t222;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IntPtr.h"
#include "UnityEngine_UnityEngine_Color.h"

// System.Void UnityEngine.Events.UnityAction`1<UnityEngine.Color>::.ctor(System.Object,System.IntPtr)
extern "C" void UnityAction_1__ctor_m3567_gshared (UnityAction_1_t676 * __this, Object_t * ___object, IntPtr_t ___method, const MethodInfo* method);
#define UnityAction_1__ctor_m3567(__this, ___object, ___method, method) (( void (*) (UnityAction_1_t676 *, Object_t *, IntPtr_t, const MethodInfo*))UnityAction_1__ctor_m3567_gshared)(__this, ___object, ___method, method)
// System.Void UnityEngine.Events.UnityAction`1<UnityEngine.Color>::Invoke(T0)
extern "C" void UnityAction_1_Invoke_m14988_gshared (UnityAction_1_t676 * __this, Color_t139  ___arg0, const MethodInfo* method);
#define UnityAction_1_Invoke_m14988(__this, ___arg0, method) (( void (*) (UnityAction_1_t676 *, Color_t139 , const MethodInfo*))UnityAction_1_Invoke_m14988_gshared)(__this, ___arg0, method)
// System.IAsyncResult UnityEngine.Events.UnityAction`1<UnityEngine.Color>::BeginInvoke(T0,System.AsyncCallback,System.Object)
extern "C" Object_t * UnityAction_1_BeginInvoke_m14989_gshared (UnityAction_1_t676 * __this, Color_t139  ___arg0, AsyncCallback_t222 * ___callback, Object_t * ___object, const MethodInfo* method);
#define UnityAction_1_BeginInvoke_m14989(__this, ___arg0, ___callback, ___object, method) (( Object_t * (*) (UnityAction_1_t676 *, Color_t139 , AsyncCallback_t222 *, Object_t *, const MethodInfo*))UnityAction_1_BeginInvoke_m14989_gshared)(__this, ___arg0, ___callback, ___object, method)
// System.Void UnityEngine.Events.UnityAction`1<UnityEngine.Color>::EndInvoke(System.IAsyncResult)
extern "C" void UnityAction_1_EndInvoke_m14990_gshared (UnityAction_1_t676 * __this, Object_t * ___result, const MethodInfo* method);
#define UnityAction_1_EndInvoke_m14990(__this, ___result, method) (( void (*) (UnityAction_1_t676 *, Object_t *, const MethodInfo*))UnityAction_1_EndInvoke_m14990_gshared)(__this, ___result, method)

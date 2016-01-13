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


#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UI_UnityEngine_UI_ObjectPool_1_gen_1MethodDeclarations.h"

// System.Void UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Canvas>>::.ctor(UnityEngine.Events.UnityAction`1<T>,UnityEngine.Events.UnityAction`1<T>)
#define ObjectPool_1__ctor_m15422(__this, ___actionOnGet, ___actionOnRelease, method) (( void (*) (ObjectPool_1_t2186 *, UnityAction_1_t2187 *, UnityAction_1_t2187 *, const MethodInfo*))ObjectPool_1__ctor_m14159_gshared)(__this, ___actionOnGet, ___actionOnRelease, method)
// System.Int32 UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Canvas>>::get_countAll()
#define ObjectPool_1_get_countAll_m15423(__this, method) (( int32_t (*) (ObjectPool_1_t2186 *, const MethodInfo*))ObjectPool_1_get_countAll_m14161_gshared)(__this, method)
// System.Void UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Canvas>>::set_countAll(System.Int32)
#define ObjectPool_1_set_countAll_m15424(__this, ___value, method) (( void (*) (ObjectPool_1_t2186 *, int32_t, const MethodInfo*))ObjectPool_1_set_countAll_m14163_gshared)(__this, ___value, method)
// T UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Canvas>>::Get()
#define ObjectPool_1_Get_m15425(__this, method) (( List_1_t690 * (*) (ObjectPool_1_t2186 *, const MethodInfo*))ObjectPool_1_Get_m14165_gshared)(__this, method)
// System.Void UnityEngine.UI.ObjectPool`1<System.Collections.Generic.List`1<UnityEngine.Canvas>>::Release(T)
#define ObjectPool_1_Release_m15426(__this, ___element, method) (( void (*) (ObjectPool_1_t2186 *, List_1_t690 *, const MethodInfo*))ObjectPool_1_Release_m14167_gshared)(__this, ___element, method)

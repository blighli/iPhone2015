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

// System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>
struct ShimEnumerator_t1869;
// System.Collections.Generic.Dictionary`2<System.Object,System.Object>
struct Dictionary_2_t1855;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>::.ctor(System.Collections.Generic.Dictionary`2<TKey,TValue>)
extern "C" void ShimEnumerator__ctor_m11143_gshared (ShimEnumerator_t1869 * __this, Dictionary_2_t1855 * ___host, const MethodInfo* method);
#define ShimEnumerator__ctor_m11143(__this, ___host, method) (( void (*) (ShimEnumerator_t1869 *, Dictionary_2_t1855 *, const MethodInfo*))ShimEnumerator__ctor_m11143_gshared)(__this, ___host, method)
// System.Boolean System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>::MoveNext()
extern "C" bool ShimEnumerator_MoveNext_m11144_gshared (ShimEnumerator_t1869 * __this, const MethodInfo* method);
#define ShimEnumerator_MoveNext_m11144(__this, method) (( bool (*) (ShimEnumerator_t1869 *, const MethodInfo*))ShimEnumerator_MoveNext_m11144_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>::get_Entry()
extern "C" DictionaryEntry_t900  ShimEnumerator_get_Entry_m11145_gshared (ShimEnumerator_t1869 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Entry_m11145(__this, method) (( DictionaryEntry_t900  (*) (ShimEnumerator_t1869 *, const MethodInfo*))ShimEnumerator_get_Entry_m11145_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>::get_Key()
extern "C" Object_t * ShimEnumerator_get_Key_m11146_gshared (ShimEnumerator_t1869 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Key_m11146(__this, method) (( Object_t * (*) (ShimEnumerator_t1869 *, const MethodInfo*))ShimEnumerator_get_Key_m11146_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>::get_Value()
extern "C" Object_t * ShimEnumerator_get_Value_m11147_gshared (ShimEnumerator_t1869 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Value_m11147(__this, method) (( Object_t * (*) (ShimEnumerator_t1869 *, const MethodInfo*))ShimEnumerator_get_Value_m11147_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>::get_Current()
extern "C" Object_t * ShimEnumerator_get_Current_m11148_gshared (ShimEnumerator_t1869 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Current_m11148(__this, method) (( Object_t * (*) (ShimEnumerator_t1869 *, const MethodInfo*))ShimEnumerator_get_Current_m11148_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Object>::Reset()
extern "C" void ShimEnumerator_Reset_m11149_gshared (ShimEnumerator_t1869 * __this, const MethodInfo* method);
#define ShimEnumerator_Reset_m11149(__this, method) (( void (*) (ShimEnumerator_t1869 *, const MethodInfo*))ShimEnumerator_Reset_m11149_gshared)(__this, method)

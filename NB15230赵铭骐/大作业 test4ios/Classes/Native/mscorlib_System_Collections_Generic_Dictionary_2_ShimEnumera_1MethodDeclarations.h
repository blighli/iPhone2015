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

// System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>
struct ShimEnumerator_t2154;
// System.Collections.Generic.Dictionary`2<System.Int32,System.Object>
struct Dictionary_2_t2145;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>::.ctor(System.Collections.Generic.Dictionary`2<TKey,TValue>)
extern "C" void ShimEnumerator__ctor_m14844_gshared (ShimEnumerator_t2154 * __this, Dictionary_2_t2145 * ___host, const MethodInfo* method);
#define ShimEnumerator__ctor_m14844(__this, ___host, method) (( void (*) (ShimEnumerator_t2154 *, Dictionary_2_t2145 *, const MethodInfo*))ShimEnumerator__ctor_m14844_gshared)(__this, ___host, method)
// System.Boolean System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>::MoveNext()
extern "C" bool ShimEnumerator_MoveNext_m14845_gshared (ShimEnumerator_t2154 * __this, const MethodInfo* method);
#define ShimEnumerator_MoveNext_m14845(__this, method) (( bool (*) (ShimEnumerator_t2154 *, const MethodInfo*))ShimEnumerator_MoveNext_m14845_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>::get_Entry()
extern "C" DictionaryEntry_t900  ShimEnumerator_get_Entry_m14846_gshared (ShimEnumerator_t2154 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Entry_m14846(__this, method) (( DictionaryEntry_t900  (*) (ShimEnumerator_t2154 *, const MethodInfo*))ShimEnumerator_get_Entry_m14846_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>::get_Key()
extern "C" Object_t * ShimEnumerator_get_Key_m14847_gshared (ShimEnumerator_t2154 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Key_m14847(__this, method) (( Object_t * (*) (ShimEnumerator_t2154 *, const MethodInfo*))ShimEnumerator_get_Key_m14847_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>::get_Value()
extern "C" Object_t * ShimEnumerator_get_Value_m14848_gshared (ShimEnumerator_t2154 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Value_m14848(__this, method) (( Object_t * (*) (ShimEnumerator_t2154 *, const MethodInfo*))ShimEnumerator_get_Value_m14848_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>::get_Current()
extern "C" Object_t * ShimEnumerator_get_Current_m14849_gshared (ShimEnumerator_t2154 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Current_m14849(__this, method) (( Object_t * (*) (ShimEnumerator_t2154 *, const MethodInfo*))ShimEnumerator_get_Current_m14849_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Int32,System.Object>::Reset()
extern "C" void ShimEnumerator_Reset_m14850_gshared (ShimEnumerator_t2154 * __this, const MethodInfo* method);
#define ShimEnumerator_Reset_m14850(__this, method) (( void (*) (ShimEnumerator_t2154 *, const MethodInfo*))ShimEnumerator_Reset_m14850_gshared)(__this, method)

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

// System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>
struct ShimEnumerator_t2315;
// System.Collections.Generic.Dictionary`2<System.Object,System.Boolean>
struct Dictionary_2_t2305;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>::.ctor(System.Collections.Generic.Dictionary`2<TKey,TValue>)
extern "C" void ShimEnumerator__ctor_m17088_gshared (ShimEnumerator_t2315 * __this, Dictionary_2_t2305 * ___host, const MethodInfo* method);
#define ShimEnumerator__ctor_m17088(__this, ___host, method) (( void (*) (ShimEnumerator_t2315 *, Dictionary_2_t2305 *, const MethodInfo*))ShimEnumerator__ctor_m17088_gshared)(__this, ___host, method)
// System.Boolean System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>::MoveNext()
extern "C" bool ShimEnumerator_MoveNext_m17089_gshared (ShimEnumerator_t2315 * __this, const MethodInfo* method);
#define ShimEnumerator_MoveNext_m17089(__this, method) (( bool (*) (ShimEnumerator_t2315 *, const MethodInfo*))ShimEnumerator_MoveNext_m17089_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>::get_Entry()
extern "C" DictionaryEntry_t900  ShimEnumerator_get_Entry_m17090_gshared (ShimEnumerator_t2315 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Entry_m17090(__this, method) (( DictionaryEntry_t900  (*) (ShimEnumerator_t2315 *, const MethodInfo*))ShimEnumerator_get_Entry_m17090_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>::get_Key()
extern "C" Object_t * ShimEnumerator_get_Key_m17091_gshared (ShimEnumerator_t2315 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Key_m17091(__this, method) (( Object_t * (*) (ShimEnumerator_t2315 *, const MethodInfo*))ShimEnumerator_get_Key_m17091_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>::get_Value()
extern "C" Object_t * ShimEnumerator_get_Value_m17092_gshared (ShimEnumerator_t2315 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Value_m17092(__this, method) (( Object_t * (*) (ShimEnumerator_t2315 *, const MethodInfo*))ShimEnumerator_get_Value_m17092_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>::get_Current()
extern "C" Object_t * ShimEnumerator_get_Current_m17093_gshared (ShimEnumerator_t2315 * __this, const MethodInfo* method);
#define ShimEnumerator_get_Current_m17093(__this, method) (( Object_t * (*) (ShimEnumerator_t2315 *, const MethodInfo*))ShimEnumerator_get_Current_m17093_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/ShimEnumerator<System.Object,System.Boolean>::Reset()
extern "C" void ShimEnumerator_Reset_m17094_gshared (ShimEnumerator_t2315 * __this, const MethodInfo* method);
#define ShimEnumerator_Reset_m17094(__this, method) (( void (*) (ShimEnumerator_t2315 *, const MethodInfo*))ShimEnumerator_Reset_m17094_gshared)(__this, method)

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

// System.Array
struct Array_t;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Array_InternalEnumerator_1_gen_45.h"
#include "mscorlib_System_Collections_Generic_KeyValuePair_2_gen_3.h"

// System.Void System.Array/InternalEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>>::.ctor(System.Array)
extern "C" void InternalEnumerator_1__ctor_m13434_gshared (InternalEnumerator_1_t2034 * __this, Array_t * ___array, const MethodInfo* method);
#define InternalEnumerator_1__ctor_m13434(__this, ___array, method) (( void (*) (InternalEnumerator_1_t2034 *, Array_t *, const MethodInfo*))InternalEnumerator_1__ctor_m13434_gshared)(__this, ___array, method)
// System.Void System.Array/InternalEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>>::System.Collections.IEnumerator.Reset()
extern "C" void InternalEnumerator_1_System_Collections_IEnumerator_Reset_m13435_gshared (InternalEnumerator_1_t2034 * __this, const MethodInfo* method);
#define InternalEnumerator_1_System_Collections_IEnumerator_Reset_m13435(__this, method) (( void (*) (InternalEnumerator_1_t2034 *, const MethodInfo*))InternalEnumerator_1_System_Collections_IEnumerator_Reset_m13435_gshared)(__this, method)
// System.Object System.Array/InternalEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>>::System.Collections.IEnumerator.get_Current()
extern "C" Object_t * InternalEnumerator_1_System_Collections_IEnumerator_get_Current_m13436_gshared (InternalEnumerator_1_t2034 * __this, const MethodInfo* method);
#define InternalEnumerator_1_System_Collections_IEnumerator_get_Current_m13436(__this, method) (( Object_t * (*) (InternalEnumerator_1_t2034 *, const MethodInfo*))InternalEnumerator_1_System_Collections_IEnumerator_get_Current_m13436_gshared)(__this, method)
// System.Void System.Array/InternalEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>>::Dispose()
extern "C" void InternalEnumerator_1_Dispose_m13437_gshared (InternalEnumerator_1_t2034 * __this, const MethodInfo* method);
#define InternalEnumerator_1_Dispose_m13437(__this, method) (( void (*) (InternalEnumerator_1_t2034 *, const MethodInfo*))InternalEnumerator_1_Dispose_m13437_gshared)(__this, method)
// System.Boolean System.Array/InternalEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>>::MoveNext()
extern "C" bool InternalEnumerator_1_MoveNext_m13438_gshared (InternalEnumerator_1_t2034 * __this, const MethodInfo* method);
#define InternalEnumerator_1_MoveNext_m13438(__this, method) (( bool (*) (InternalEnumerator_1_t2034 *, const MethodInfo*))InternalEnumerator_1_MoveNext_m13438_gshared)(__this, method)
// T System.Array/InternalEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>>::get_Current()
extern "C" KeyValuePair_2_t2033  InternalEnumerator_1_get_Current_m13439_gshared (InternalEnumerator_1_t2034 * __this, const MethodInfo* method);
#define InternalEnumerator_1_get_Current_m13439(__this, method) (( KeyValuePair_2_t2033  (*) (InternalEnumerator_1_t2034 *, const MethodInfo*))InternalEnumerator_1_get_Current_m13439_gshared)(__this, method)

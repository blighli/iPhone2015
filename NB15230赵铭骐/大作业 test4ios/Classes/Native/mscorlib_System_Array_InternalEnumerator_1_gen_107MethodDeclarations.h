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
#include "mscorlib_System_Array_InternalEnumerator_1_gen_107.h"
#include "mscorlib_System_DateTime.h"

// System.Void System.Array/InternalEnumerator`1<System.DateTime>::.ctor(System.Array)
extern "C" void InternalEnumerator_1__ctor_m17815_gshared (InternalEnumerator_1_t2403 * __this, Array_t * ___array, const MethodInfo* method);
#define InternalEnumerator_1__ctor_m17815(__this, ___array, method) (( void (*) (InternalEnumerator_1_t2403 *, Array_t *, const MethodInfo*))InternalEnumerator_1__ctor_m17815_gshared)(__this, ___array, method)
// System.Void System.Array/InternalEnumerator`1<System.DateTime>::System.Collections.IEnumerator.Reset()
extern "C" void InternalEnumerator_1_System_Collections_IEnumerator_Reset_m17816_gshared (InternalEnumerator_1_t2403 * __this, const MethodInfo* method);
#define InternalEnumerator_1_System_Collections_IEnumerator_Reset_m17816(__this, method) (( void (*) (InternalEnumerator_1_t2403 *, const MethodInfo*))InternalEnumerator_1_System_Collections_IEnumerator_Reset_m17816_gshared)(__this, method)
// System.Object System.Array/InternalEnumerator`1<System.DateTime>::System.Collections.IEnumerator.get_Current()
extern "C" Object_t * InternalEnumerator_1_System_Collections_IEnumerator_get_Current_m17817_gshared (InternalEnumerator_1_t2403 * __this, const MethodInfo* method);
#define InternalEnumerator_1_System_Collections_IEnumerator_get_Current_m17817(__this, method) (( Object_t * (*) (InternalEnumerator_1_t2403 *, const MethodInfo*))InternalEnumerator_1_System_Collections_IEnumerator_get_Current_m17817_gshared)(__this, method)
// System.Void System.Array/InternalEnumerator`1<System.DateTime>::Dispose()
extern "C" void InternalEnumerator_1_Dispose_m17818_gshared (InternalEnumerator_1_t2403 * __this, const MethodInfo* method);
#define InternalEnumerator_1_Dispose_m17818(__this, method) (( void (*) (InternalEnumerator_1_t2403 *, const MethodInfo*))InternalEnumerator_1_Dispose_m17818_gshared)(__this, method)
// System.Boolean System.Array/InternalEnumerator`1<System.DateTime>::MoveNext()
extern "C" bool InternalEnumerator_1_MoveNext_m17819_gshared (InternalEnumerator_1_t2403 * __this, const MethodInfo* method);
#define InternalEnumerator_1_MoveNext_m17819(__this, method) (( bool (*) (InternalEnumerator_1_t2403 *, const MethodInfo*))InternalEnumerator_1_MoveNext_m17819_gshared)(__this, method)
// T System.Array/InternalEnumerator`1<System.DateTime>::get_Current()
extern "C" DateTime_t365  InternalEnumerator_1_get_Current_m17820_gshared (InternalEnumerator_1_t2403 * __this, const MethodInfo* method);
#define InternalEnumerator_1_get_Current_m17820(__this, method) (( DateTime_t365  (*) (InternalEnumerator_1_t2403 *, const MethodInfo*))InternalEnumerator_1_get_Current_m17820_gshared)(__this, method)

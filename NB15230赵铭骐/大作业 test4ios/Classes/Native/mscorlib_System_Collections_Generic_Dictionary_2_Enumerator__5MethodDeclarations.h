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

// System.Collections.Generic.Dictionary`2<System.Int32,System.Object>
struct Dictionary_2_t2145;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_Generic_Dictionary_2_Enumerator__5.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"
#include "mscorlib_System_Collections_Generic_KeyValuePair_2_gen_5.h"

// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::.ctor(System.Collections.Generic.Dictionary`2<TKey,TValue>)
extern "C" void Enumerator__ctor_m14818_gshared (Enumerator_t2151 * __this, Dictionary_2_t2145 * ___dictionary, const MethodInfo* method);
#define Enumerator__ctor_m14818(__this, ___dictionary, method) (( void (*) (Enumerator_t2151 *, Dictionary_2_t2145 *, const MethodInfo*))Enumerator__ctor_m14818_gshared)(__this, ___dictionary, method)
// System.Object System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::System.Collections.IEnumerator.get_Current()
extern "C" Object_t * Enumerator_System_Collections_IEnumerator_get_Current_m14819_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IEnumerator_get_Current_m14819(__this, method) (( Object_t * (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_System_Collections_IEnumerator_get_Current_m14819_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::System.Collections.IEnumerator.Reset()
extern "C" void Enumerator_System_Collections_IEnumerator_Reset_m14820_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IEnumerator_Reset_m14820(__this, method) (( void (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_System_Collections_IEnumerator_Reset_m14820_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::System.Collections.IDictionaryEnumerator.get_Entry()
extern "C" DictionaryEntry_t900  Enumerator_System_Collections_IDictionaryEnumerator_get_Entry_m14821_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IDictionaryEnumerator_get_Entry_m14821(__this, method) (( DictionaryEntry_t900  (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_System_Collections_IDictionaryEnumerator_get_Entry_m14821_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::System.Collections.IDictionaryEnumerator.get_Key()
extern "C" Object_t * Enumerator_System_Collections_IDictionaryEnumerator_get_Key_m14822_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IDictionaryEnumerator_get_Key_m14822(__this, method) (( Object_t * (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_System_Collections_IDictionaryEnumerator_get_Key_m14822_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::System.Collections.IDictionaryEnumerator.get_Value()
extern "C" Object_t * Enumerator_System_Collections_IDictionaryEnumerator_get_Value_m14823_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IDictionaryEnumerator_get_Value_m14823(__this, method) (( Object_t * (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_System_Collections_IDictionaryEnumerator_get_Value_m14823_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::MoveNext()
extern "C" bool Enumerator_MoveNext_m14824_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_MoveNext_m14824(__this, method) (( bool (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_MoveNext_m14824_gshared)(__this, method)
// System.Collections.Generic.KeyValuePair`2<TKey,TValue> System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::get_Current()
extern "C" KeyValuePair_2_t2147  Enumerator_get_Current_m14825_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_get_Current_m14825(__this, method) (( KeyValuePair_2_t2147  (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_get_Current_m14825_gshared)(__this, method)
// TKey System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::get_CurrentKey()
extern "C" int32_t Enumerator_get_CurrentKey_m14826_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_get_CurrentKey_m14826(__this, method) (( int32_t (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_get_CurrentKey_m14826_gshared)(__this, method)
// TValue System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::get_CurrentValue()
extern "C" Object_t * Enumerator_get_CurrentValue_m14827_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_get_CurrentValue_m14827(__this, method) (( Object_t * (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_get_CurrentValue_m14827_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::Reset()
extern "C" void Enumerator_Reset_m14828_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_Reset_m14828(__this, method) (( void (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_Reset_m14828_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::VerifyState()
extern "C" void Enumerator_VerifyState_m14829_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_VerifyState_m14829(__this, method) (( void (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_VerifyState_m14829_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::VerifyCurrent()
extern "C" void Enumerator_VerifyCurrent_m14830_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_VerifyCurrent_m14830(__this, method) (( void (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_VerifyCurrent_m14830_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Int32,System.Object>::Dispose()
extern "C" void Enumerator_Dispose_m14831_gshared (Enumerator_t2151 * __this, const MethodInfo* method);
#define Enumerator_Dispose_m14831(__this, method) (( void (*) (Enumerator_t2151 *, const MethodInfo*))Enumerator_Dispose_m14831_gshared)(__this, method)

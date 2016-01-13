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

// System.Collections.Generic.Dictionary`2<System.Object,System.Int32>
struct Dictionary_2_t2031;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_Generic_Dictionary_2_Enumerator__3.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"
#include "mscorlib_System_Collections_Generic_KeyValuePair_2_gen_3.h"

// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::.ctor(System.Collections.Generic.Dictionary`2<TKey,TValue>)
extern "C" void Enumerator__ctor_m13466_gshared (Enumerator_t2037 * __this, Dictionary_2_t2031 * ___dictionary, const MethodInfo* method);
#define Enumerator__ctor_m13466(__this, ___dictionary, method) (( void (*) (Enumerator_t2037 *, Dictionary_2_t2031 *, const MethodInfo*))Enumerator__ctor_m13466_gshared)(__this, ___dictionary, method)
// System.Object System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::System.Collections.IEnumerator.get_Current()
extern "C" Object_t * Enumerator_System_Collections_IEnumerator_get_Current_m13467_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IEnumerator_get_Current_m13467(__this, method) (( Object_t * (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_System_Collections_IEnumerator_get_Current_m13467_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::System.Collections.IEnumerator.Reset()
extern "C" void Enumerator_System_Collections_IEnumerator_Reset_m13468_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IEnumerator_Reset_m13468(__this, method) (( void (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_System_Collections_IEnumerator_Reset_m13468_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::System.Collections.IDictionaryEnumerator.get_Entry()
extern "C" DictionaryEntry_t900  Enumerator_System_Collections_IDictionaryEnumerator_get_Entry_m13469_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IDictionaryEnumerator_get_Entry_m13469(__this, method) (( DictionaryEntry_t900  (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_System_Collections_IDictionaryEnumerator_get_Entry_m13469_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::System.Collections.IDictionaryEnumerator.get_Key()
extern "C" Object_t * Enumerator_System_Collections_IDictionaryEnumerator_get_Key_m13470_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IDictionaryEnumerator_get_Key_m13470(__this, method) (( Object_t * (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_System_Collections_IDictionaryEnumerator_get_Key_m13470_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::System.Collections.IDictionaryEnumerator.get_Value()
extern "C" Object_t * Enumerator_System_Collections_IDictionaryEnumerator_get_Value_m13471_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_System_Collections_IDictionaryEnumerator_get_Value_m13471(__this, method) (( Object_t * (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_System_Collections_IDictionaryEnumerator_get_Value_m13471_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::MoveNext()
extern "C" bool Enumerator_MoveNext_m13472_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_MoveNext_m13472(__this, method) (( bool (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_MoveNext_m13472_gshared)(__this, method)
// System.Collections.Generic.KeyValuePair`2<TKey,TValue> System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::get_Current()
extern "C" KeyValuePair_2_t2033  Enumerator_get_Current_m13473_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_get_Current_m13473(__this, method) (( KeyValuePair_2_t2033  (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_get_Current_m13473_gshared)(__this, method)
// TKey System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::get_CurrentKey()
extern "C" Object_t * Enumerator_get_CurrentKey_m13474_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_get_CurrentKey_m13474(__this, method) (( Object_t * (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_get_CurrentKey_m13474_gshared)(__this, method)
// TValue System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::get_CurrentValue()
extern "C" int32_t Enumerator_get_CurrentValue_m13475_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_get_CurrentValue_m13475(__this, method) (( int32_t (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_get_CurrentValue_m13475_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::Reset()
extern "C" void Enumerator_Reset_m13476_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_Reset_m13476(__this, method) (( void (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_Reset_m13476_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::VerifyState()
extern "C" void Enumerator_VerifyState_m13477_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_VerifyState_m13477(__this, method) (( void (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_VerifyState_m13477_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::VerifyCurrent()
extern "C" void Enumerator_VerifyCurrent_m13478_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_VerifyCurrent_m13478(__this, method) (( void (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_VerifyCurrent_m13478_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Int32>::Dispose()
extern "C" void Enumerator_Dispose_m13479_gshared (Enumerator_t2037 * __this, const MethodInfo* method);
#define Enumerator_Dispose_m13479(__this, method) (( void (*) (Enumerator_t2037 *, const MethodInfo*))Enumerator_Dispose_m13479_gshared)(__this, method)

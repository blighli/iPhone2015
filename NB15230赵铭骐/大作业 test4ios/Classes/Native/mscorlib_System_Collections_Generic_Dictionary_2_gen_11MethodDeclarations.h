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
// System.Collections.Generic.IEqualityComparer`1<System.Int32>
struct IEqualityComparer_1_t2144;
// System.Runtime.Serialization.SerializationInfo
struct SerializationInfo_t433;
// System.Object
struct Object_t;
// System.Collections.Generic.KeyValuePair`2<System.Int32,System.Object>[]
struct KeyValuePair_2U5BU5D_t2469;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Int32,System.Object>>
struct IEnumerator_1_t2470;
// System.Collections.IDictionaryEnumerator
struct IDictionaryEnumerator_t899;
// System.Collections.Generic.Dictionary`2/ValueCollection<System.Int32,System.Object>
struct ValueCollection_t2149;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Runtime_Serialization_StreamingContext.h"
#include "mscorlib_System_Collections_Generic_KeyValuePair_2_gen_5.h"
#include "mscorlib_System_Collections_Generic_Dictionary_2_Enumerator__5.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::.ctor()
extern "C" void Dictionary_2__ctor_m14701_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2__ctor_m14701(__this, method) (( void (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2__ctor_m14701_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::.ctor(System.Collections.Generic.IEqualityComparer`1<TKey>)
extern "C" void Dictionary_2__ctor_m14703_gshared (Dictionary_2_t2145 * __this, Object_t* ___comparer, const MethodInfo* method);
#define Dictionary_2__ctor_m14703(__this, ___comparer, method) (( void (*) (Dictionary_2_t2145 *, Object_t*, const MethodInfo*))Dictionary_2__ctor_m14703_gshared)(__this, ___comparer, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::.ctor(System.Int32)
extern "C" void Dictionary_2__ctor_m14705_gshared (Dictionary_2_t2145 * __this, int32_t ___capacity, const MethodInfo* method);
#define Dictionary_2__ctor_m14705(__this, ___capacity, method) (( void (*) (Dictionary_2_t2145 *, int32_t, const MethodInfo*))Dictionary_2__ctor_m14705_gshared)(__this, ___capacity, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::.ctor(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
extern "C" void Dictionary_2__ctor_m14707_gshared (Dictionary_2_t2145 * __this, SerializationInfo_t433 * ___info, StreamingContext_t434  ___context, const MethodInfo* method);
#define Dictionary_2__ctor_m14707(__this, ___info, ___context, method) (( void (*) (Dictionary_2_t2145 *, SerializationInfo_t433 *, StreamingContext_t434 , const MethodInfo*))Dictionary_2__ctor_m14707_gshared)(__this, ___info, ___context, method)
// System.Object System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.IDictionary.get_Item(System.Object)
extern "C" Object_t * Dictionary_2_System_Collections_IDictionary_get_Item_m14709_gshared (Dictionary_2_t2145 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_get_Item_m14709(__this, ___key, method) (( Object_t * (*) (Dictionary_2_t2145 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_get_Item_m14709_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.IDictionary.set_Item(System.Object,System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_set_Item_m14711_gshared (Dictionary_2_t2145 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_set_Item_m14711(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2145 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_set_Item_m14711_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.IDictionary.Add(System.Object,System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_Add_m14713_gshared (Dictionary_2_t2145 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Add_m14713(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2145 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Add_m14713_gshared)(__this, ___key, ___value, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.IDictionary.Contains(System.Object)
extern "C" bool Dictionary_2_System_Collections_IDictionary_Contains_m14715_gshared (Dictionary_2_t2145 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Contains_m14715(__this, ___key, method) (( bool (*) (Dictionary_2_t2145 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Contains_m14715_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.IDictionary.Remove(System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_Remove_m14717_gshared (Dictionary_2_t2145 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Remove_m14717(__this, ___key, method) (( void (*) (Dictionary_2_t2145 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Remove_m14717_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.ICollection.get_IsSynchronized()
extern "C" bool Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m14719_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m14719(__this, method) (( bool (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m14719_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.ICollection.get_SyncRoot()
extern "C" Object_t * Dictionary_2_System_Collections_ICollection_get_SyncRoot_m14721_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_get_SyncRoot_m14721(__this, method) (( Object_t * (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_System_Collections_ICollection_get_SyncRoot_m14721_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.get_IsReadOnly()
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m14723_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m14723(__this, method) (( bool (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m14723_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Add(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" void Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m14725_gshared (Dictionary_2_t2145 * __this, KeyValuePair_2_t2147  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m14725(__this, ___keyValuePair, method) (( void (*) (Dictionary_2_t2145 *, KeyValuePair_2_t2147 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m14725_gshared)(__this, ___keyValuePair, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Contains(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m14727_gshared (Dictionary_2_t2145 * __this, KeyValuePair_2_t2147  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m14727(__this, ___keyValuePair, method) (( bool (*) (Dictionary_2_t2145 *, KeyValuePair_2_t2147 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m14727_gshared)(__this, ___keyValuePair, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.CopyTo(System.Collections.Generic.KeyValuePair`2<TKey,TValue>[],System.Int32)
extern "C" void Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m14729_gshared (Dictionary_2_t2145 * __this, KeyValuePair_2U5BU5D_t2469* ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m14729(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2145 *, KeyValuePair_2U5BU5D_t2469*, int32_t, const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m14729_gshared)(__this, ___array, ___index, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Remove(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m14731_gshared (Dictionary_2_t2145 * __this, KeyValuePair_2_t2147  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m14731(__this, ___keyValuePair, method) (( bool (*) (Dictionary_2_t2145 *, KeyValuePair_2_t2147 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m14731_gshared)(__this, ___keyValuePair, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
extern "C" void Dictionary_2_System_Collections_ICollection_CopyTo_m14733_gshared (Dictionary_2_t2145 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_CopyTo_m14733(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2145 *, Array_t *, int32_t, const MethodInfo*))Dictionary_2_System_Collections_ICollection_CopyTo_m14733_gshared)(__this, ___array, ___index, method)
// System.Collections.IEnumerator System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m14735_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m14735(__this, method) (( Object_t * (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m14735_gshared)(__this, method)
// System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<TKey,TValue>> System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.Generic.IEnumerable<System.Collections.Generic.KeyValuePair<TKey,TValue>>.GetEnumerator()
extern "C" Object_t* Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m14737_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m14737(__this, method) (( Object_t* (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m14737_gshared)(__this, method)
// System.Collections.IDictionaryEnumerator System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::System.Collections.IDictionary.GetEnumerator()
extern "C" Object_t * Dictionary_2_System_Collections_IDictionary_GetEnumerator_m14739_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_GetEnumerator_m14739(__this, method) (( Object_t * (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_GetEnumerator_m14739_gshared)(__this, method)
// System.Int32 System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::get_Count()
extern "C" int32_t Dictionary_2_get_Count_m14741_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_get_Count_m14741(__this, method) (( int32_t (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_get_Count_m14741_gshared)(__this, method)
// TValue System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::get_Item(TKey)
extern "C" Object_t * Dictionary_2_get_Item_m14743_gshared (Dictionary_2_t2145 * __this, int32_t ___key, const MethodInfo* method);
#define Dictionary_2_get_Item_m14743(__this, ___key, method) (( Object_t * (*) (Dictionary_2_t2145 *, int32_t, const MethodInfo*))Dictionary_2_get_Item_m14743_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::set_Item(TKey,TValue)
extern "C" void Dictionary_2_set_Item_m14745_gshared (Dictionary_2_t2145 * __this, int32_t ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_set_Item_m14745(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2145 *, int32_t, Object_t *, const MethodInfo*))Dictionary_2_set_Item_m14745_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::Init(System.Int32,System.Collections.Generic.IEqualityComparer`1<TKey>)
extern "C" void Dictionary_2_Init_m14747_gshared (Dictionary_2_t2145 * __this, int32_t ___capacity, Object_t* ___hcp, const MethodInfo* method);
#define Dictionary_2_Init_m14747(__this, ___capacity, ___hcp, method) (( void (*) (Dictionary_2_t2145 *, int32_t, Object_t*, const MethodInfo*))Dictionary_2_Init_m14747_gshared)(__this, ___capacity, ___hcp, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::InitArrays(System.Int32)
extern "C" void Dictionary_2_InitArrays_m14749_gshared (Dictionary_2_t2145 * __this, int32_t ___size, const MethodInfo* method);
#define Dictionary_2_InitArrays_m14749(__this, ___size, method) (( void (*) (Dictionary_2_t2145 *, int32_t, const MethodInfo*))Dictionary_2_InitArrays_m14749_gshared)(__this, ___size, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::CopyToCheck(System.Array,System.Int32)
extern "C" void Dictionary_2_CopyToCheck_m14751_gshared (Dictionary_2_t2145 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_CopyToCheck_m14751(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2145 *, Array_t *, int32_t, const MethodInfo*))Dictionary_2_CopyToCheck_m14751_gshared)(__this, ___array, ___index, method)
// System.Collections.Generic.KeyValuePair`2<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::make_pair(TKey,TValue)
extern "C" KeyValuePair_2_t2147  Dictionary_2_make_pair_m14753_gshared (Object_t * __this /* static, unused */, int32_t ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_make_pair_m14753(__this /* static, unused */, ___key, ___value, method) (( KeyValuePair_2_t2147  (*) (Object_t * /* static, unused */, int32_t, Object_t *, const MethodInfo*))Dictionary_2_make_pair_m14753_gshared)(__this /* static, unused */, ___key, ___value, method)
// TValue System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::pick_value(TKey,TValue)
extern "C" Object_t * Dictionary_2_pick_value_m14755_gshared (Object_t * __this /* static, unused */, int32_t ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_pick_value_m14755(__this /* static, unused */, ___key, ___value, method) (( Object_t * (*) (Object_t * /* static, unused */, int32_t, Object_t *, const MethodInfo*))Dictionary_2_pick_value_m14755_gshared)(__this /* static, unused */, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::CopyTo(System.Collections.Generic.KeyValuePair`2<TKey,TValue>[],System.Int32)
extern "C" void Dictionary_2_CopyTo_m14757_gshared (Dictionary_2_t2145 * __this, KeyValuePair_2U5BU5D_t2469* ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_CopyTo_m14757(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2145 *, KeyValuePair_2U5BU5D_t2469*, int32_t, const MethodInfo*))Dictionary_2_CopyTo_m14757_gshared)(__this, ___array, ___index, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::Resize()
extern "C" void Dictionary_2_Resize_m14759_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_Resize_m14759(__this, method) (( void (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_Resize_m14759_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::Add(TKey,TValue)
extern "C" void Dictionary_2_Add_m14761_gshared (Dictionary_2_t2145 * __this, int32_t ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_Add_m14761(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2145 *, int32_t, Object_t *, const MethodInfo*))Dictionary_2_Add_m14761_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::Clear()
extern "C" void Dictionary_2_Clear_m14763_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_Clear_m14763(__this, method) (( void (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_Clear_m14763_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::ContainsKey(TKey)
extern "C" bool Dictionary_2_ContainsKey_m14765_gshared (Dictionary_2_t2145 * __this, int32_t ___key, const MethodInfo* method);
#define Dictionary_2_ContainsKey_m14765(__this, ___key, method) (( bool (*) (Dictionary_2_t2145 *, int32_t, const MethodInfo*))Dictionary_2_ContainsKey_m14765_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::ContainsValue(TValue)
extern "C" bool Dictionary_2_ContainsValue_m14767_gshared (Dictionary_2_t2145 * __this, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_ContainsValue_m14767(__this, ___value, method) (( bool (*) (Dictionary_2_t2145 *, Object_t *, const MethodInfo*))Dictionary_2_ContainsValue_m14767_gshared)(__this, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::GetObjectData(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
extern "C" void Dictionary_2_GetObjectData_m14769_gshared (Dictionary_2_t2145 * __this, SerializationInfo_t433 * ___info, StreamingContext_t434  ___context, const MethodInfo* method);
#define Dictionary_2_GetObjectData_m14769(__this, ___info, ___context, method) (( void (*) (Dictionary_2_t2145 *, SerializationInfo_t433 *, StreamingContext_t434 , const MethodInfo*))Dictionary_2_GetObjectData_m14769_gshared)(__this, ___info, ___context, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::OnDeserialization(System.Object)
extern "C" void Dictionary_2_OnDeserialization_m14771_gshared (Dictionary_2_t2145 * __this, Object_t * ___sender, const MethodInfo* method);
#define Dictionary_2_OnDeserialization_m14771(__this, ___sender, method) (( void (*) (Dictionary_2_t2145 *, Object_t *, const MethodInfo*))Dictionary_2_OnDeserialization_m14771_gshared)(__this, ___sender, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::Remove(TKey)
extern "C" bool Dictionary_2_Remove_m14773_gshared (Dictionary_2_t2145 * __this, int32_t ___key, const MethodInfo* method);
#define Dictionary_2_Remove_m14773(__this, ___key, method) (( bool (*) (Dictionary_2_t2145 *, int32_t, const MethodInfo*))Dictionary_2_Remove_m14773_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::TryGetValue(TKey,TValue&)
extern "C" bool Dictionary_2_TryGetValue_m14775_gshared (Dictionary_2_t2145 * __this, int32_t ___key, Object_t ** ___value, const MethodInfo* method);
#define Dictionary_2_TryGetValue_m14775(__this, ___key, ___value, method) (( bool (*) (Dictionary_2_t2145 *, int32_t, Object_t **, const MethodInfo*))Dictionary_2_TryGetValue_m14775_gshared)(__this, ___key, ___value, method)
// System.Collections.Generic.Dictionary`2/ValueCollection<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::get_Values()
extern "C" ValueCollection_t2149 * Dictionary_2_get_Values_m14776_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_get_Values_m14776(__this, method) (( ValueCollection_t2149 * (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_get_Values_m14776_gshared)(__this, method)
// TKey System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::ToTKey(System.Object)
extern "C" int32_t Dictionary_2_ToTKey_m14778_gshared (Dictionary_2_t2145 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_ToTKey_m14778(__this, ___key, method) (( int32_t (*) (Dictionary_2_t2145 *, Object_t *, const MethodInfo*))Dictionary_2_ToTKey_m14778_gshared)(__this, ___key, method)
// TValue System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::ToTValue(System.Object)
extern "C" Object_t * Dictionary_2_ToTValue_m14780_gshared (Dictionary_2_t2145 * __this, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_ToTValue_m14780(__this, ___value, method) (( Object_t * (*) (Dictionary_2_t2145 *, Object_t *, const MethodInfo*))Dictionary_2_ToTValue_m14780_gshared)(__this, ___value, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::ContainsKeyValuePair(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_ContainsKeyValuePair_m14782_gshared (Dictionary_2_t2145 * __this, KeyValuePair_2_t2147  ___pair, const MethodInfo* method);
#define Dictionary_2_ContainsKeyValuePair_m14782(__this, ___pair, method) (( bool (*) (Dictionary_2_t2145 *, KeyValuePair_2_t2147 , const MethodInfo*))Dictionary_2_ContainsKeyValuePair_m14782_gshared)(__this, ___pair, method)
// System.Collections.Generic.Dictionary`2/Enumerator<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::GetEnumerator()
extern "C" Enumerator_t2151  Dictionary_2_GetEnumerator_m14783_gshared (Dictionary_2_t2145 * __this, const MethodInfo* method);
#define Dictionary_2_GetEnumerator_m14783(__this, method) (( Enumerator_t2151  (*) (Dictionary_2_t2145 *, const MethodInfo*))Dictionary_2_GetEnumerator_m14783_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2<System.Int32,System.Object>::<CopyTo>m__0(TKey,TValue)
extern "C" DictionaryEntry_t900  Dictionary_2_U3CCopyToU3Em__0_m14785_gshared (Object_t * __this /* static, unused */, int32_t ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_U3CCopyToU3Em__0_m14785(__this /* static, unused */, ___key, ___value, method) (( DictionaryEntry_t900  (*) (Object_t * /* static, unused */, int32_t, Object_t *, const MethodInfo*))Dictionary_2_U3CCopyToU3Em__0_m14785_gshared)(__this /* static, unused */, ___key, ___value, method)

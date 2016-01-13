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
// System.Collections.Generic.IEqualityComparer`1<System.Object>
struct IEqualityComparer_1_t1857;
// System.Runtime.Serialization.SerializationInfo
struct SerializationInfo_t433;
// System.Object
struct Object_t;
// System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>[]
struct KeyValuePair_2U5BU5D_t2460;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Int32>>
struct IEnumerator_1_t2461;
// System.Collections.IDictionaryEnumerator
struct IDictionaryEnumerator_t899;
// System.Collections.Generic.Dictionary`2/ValueCollection<System.Object,System.Int32>
struct ValueCollection_t2035;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Runtime_Serialization_StreamingContext.h"
#include "mscorlib_System_Collections_Generic_KeyValuePair_2_gen_3.h"
#include "mscorlib_System_Collections_Generic_Dictionary_2_Enumerator__3.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::.ctor()
extern "C" void Dictionary_2__ctor_m13348_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2__ctor_m13348(__this, method) (( void (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2__ctor_m13348_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::.ctor(System.Collections.Generic.IEqualityComparer`1<TKey>)
extern "C" void Dictionary_2__ctor_m13350_gshared (Dictionary_2_t2031 * __this, Object_t* ___comparer, const MethodInfo* method);
#define Dictionary_2__ctor_m13350(__this, ___comparer, method) (( void (*) (Dictionary_2_t2031 *, Object_t*, const MethodInfo*))Dictionary_2__ctor_m13350_gshared)(__this, ___comparer, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::.ctor(System.Int32)
extern "C" void Dictionary_2__ctor_m13351_gshared (Dictionary_2_t2031 * __this, int32_t ___capacity, const MethodInfo* method);
#define Dictionary_2__ctor_m13351(__this, ___capacity, method) (( void (*) (Dictionary_2_t2031 *, int32_t, const MethodInfo*))Dictionary_2__ctor_m13351_gshared)(__this, ___capacity, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::.ctor(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
extern "C" void Dictionary_2__ctor_m13353_gshared (Dictionary_2_t2031 * __this, SerializationInfo_t433 * ___info, StreamingContext_t434  ___context, const MethodInfo* method);
#define Dictionary_2__ctor_m13353(__this, ___info, ___context, method) (( void (*) (Dictionary_2_t2031 *, SerializationInfo_t433 *, StreamingContext_t434 , const MethodInfo*))Dictionary_2__ctor_m13353_gshared)(__this, ___info, ___context, method)
// System.Object System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.IDictionary.get_Item(System.Object)
extern "C" Object_t * Dictionary_2_System_Collections_IDictionary_get_Item_m13355_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_get_Item_m13355(__this, ___key, method) (( Object_t * (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_get_Item_m13355_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.IDictionary.set_Item(System.Object,System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_set_Item_m13357_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_set_Item_m13357(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2031 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_set_Item_m13357_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.IDictionary.Add(System.Object,System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_Add_m13359_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Add_m13359(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2031 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Add_m13359_gshared)(__this, ___key, ___value, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.IDictionary.Contains(System.Object)
extern "C" bool Dictionary_2_System_Collections_IDictionary_Contains_m13361_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Contains_m13361(__this, ___key, method) (( bool (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Contains_m13361_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.IDictionary.Remove(System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_Remove_m13363_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Remove_m13363(__this, ___key, method) (( void (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Remove_m13363_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.ICollection.get_IsSynchronized()
extern "C" bool Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m13365_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m13365(__this, method) (( bool (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m13365_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.ICollection.get_SyncRoot()
extern "C" Object_t * Dictionary_2_System_Collections_ICollection_get_SyncRoot_m13367_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_get_SyncRoot_m13367(__this, method) (( Object_t * (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_System_Collections_ICollection_get_SyncRoot_m13367_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.get_IsReadOnly()
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m13369_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m13369(__this, method) (( bool (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m13369_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Add(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" void Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m13371_gshared (Dictionary_2_t2031 * __this, KeyValuePair_2_t2033  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m13371(__this, ___keyValuePair, method) (( void (*) (Dictionary_2_t2031 *, KeyValuePair_2_t2033 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m13371_gshared)(__this, ___keyValuePair, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Contains(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m13373_gshared (Dictionary_2_t2031 * __this, KeyValuePair_2_t2033  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m13373(__this, ___keyValuePair, method) (( bool (*) (Dictionary_2_t2031 *, KeyValuePair_2_t2033 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m13373_gshared)(__this, ___keyValuePair, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.CopyTo(System.Collections.Generic.KeyValuePair`2<TKey,TValue>[],System.Int32)
extern "C" void Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m13375_gshared (Dictionary_2_t2031 * __this, KeyValuePair_2U5BU5D_t2460* ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m13375(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2031 *, KeyValuePair_2U5BU5D_t2460*, int32_t, const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m13375_gshared)(__this, ___array, ___index, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Remove(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m13377_gshared (Dictionary_2_t2031 * __this, KeyValuePair_2_t2033  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m13377(__this, ___keyValuePair, method) (( bool (*) (Dictionary_2_t2031 *, KeyValuePair_2_t2033 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m13377_gshared)(__this, ___keyValuePair, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
extern "C" void Dictionary_2_System_Collections_ICollection_CopyTo_m13379_gshared (Dictionary_2_t2031 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_CopyTo_m13379(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2031 *, Array_t *, int32_t, const MethodInfo*))Dictionary_2_System_Collections_ICollection_CopyTo_m13379_gshared)(__this, ___array, ___index, method)
// System.Collections.IEnumerator System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m13381_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m13381(__this, method) (( Object_t * (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m13381_gshared)(__this, method)
// System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<TKey,TValue>> System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.Generic.IEnumerable<System.Collections.Generic.KeyValuePair<TKey,TValue>>.GetEnumerator()
extern "C" Object_t* Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m13383_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m13383(__this, method) (( Object_t* (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m13383_gshared)(__this, method)
// System.Collections.IDictionaryEnumerator System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::System.Collections.IDictionary.GetEnumerator()
extern "C" Object_t * Dictionary_2_System_Collections_IDictionary_GetEnumerator_m13385_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_GetEnumerator_m13385(__this, method) (( Object_t * (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_GetEnumerator_m13385_gshared)(__this, method)
// System.Int32 System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::get_Count()
extern "C" int32_t Dictionary_2_get_Count_m13387_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_get_Count_m13387(__this, method) (( int32_t (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_get_Count_m13387_gshared)(__this, method)
// TValue System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::get_Item(TKey)
extern "C" int32_t Dictionary_2_get_Item_m13389_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_get_Item_m13389(__this, ___key, method) (( int32_t (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_get_Item_m13389_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::set_Item(TKey,TValue)
extern "C" void Dictionary_2_set_Item_m13391_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, int32_t ___value, const MethodInfo* method);
#define Dictionary_2_set_Item_m13391(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2031 *, Object_t *, int32_t, const MethodInfo*))Dictionary_2_set_Item_m13391_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::Init(System.Int32,System.Collections.Generic.IEqualityComparer`1<TKey>)
extern "C" void Dictionary_2_Init_m13393_gshared (Dictionary_2_t2031 * __this, int32_t ___capacity, Object_t* ___hcp, const MethodInfo* method);
#define Dictionary_2_Init_m13393(__this, ___capacity, ___hcp, method) (( void (*) (Dictionary_2_t2031 *, int32_t, Object_t*, const MethodInfo*))Dictionary_2_Init_m13393_gshared)(__this, ___capacity, ___hcp, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::InitArrays(System.Int32)
extern "C" void Dictionary_2_InitArrays_m13395_gshared (Dictionary_2_t2031 * __this, int32_t ___size, const MethodInfo* method);
#define Dictionary_2_InitArrays_m13395(__this, ___size, method) (( void (*) (Dictionary_2_t2031 *, int32_t, const MethodInfo*))Dictionary_2_InitArrays_m13395_gshared)(__this, ___size, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::CopyToCheck(System.Array,System.Int32)
extern "C" void Dictionary_2_CopyToCheck_m13397_gshared (Dictionary_2_t2031 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_CopyToCheck_m13397(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2031 *, Array_t *, int32_t, const MethodInfo*))Dictionary_2_CopyToCheck_m13397_gshared)(__this, ___array, ___index, method)
// System.Collections.Generic.KeyValuePair`2<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::make_pair(TKey,TValue)
extern "C" KeyValuePair_2_t2033  Dictionary_2_make_pair_m13399_gshared (Object_t * __this /* static, unused */, Object_t * ___key, int32_t ___value, const MethodInfo* method);
#define Dictionary_2_make_pair_m13399(__this /* static, unused */, ___key, ___value, method) (( KeyValuePair_2_t2033  (*) (Object_t * /* static, unused */, Object_t *, int32_t, const MethodInfo*))Dictionary_2_make_pair_m13399_gshared)(__this /* static, unused */, ___key, ___value, method)
// TValue System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::pick_value(TKey,TValue)
extern "C" int32_t Dictionary_2_pick_value_m13401_gshared (Object_t * __this /* static, unused */, Object_t * ___key, int32_t ___value, const MethodInfo* method);
#define Dictionary_2_pick_value_m13401(__this /* static, unused */, ___key, ___value, method) (( int32_t (*) (Object_t * /* static, unused */, Object_t *, int32_t, const MethodInfo*))Dictionary_2_pick_value_m13401_gshared)(__this /* static, unused */, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::CopyTo(System.Collections.Generic.KeyValuePair`2<TKey,TValue>[],System.Int32)
extern "C" void Dictionary_2_CopyTo_m13403_gshared (Dictionary_2_t2031 * __this, KeyValuePair_2U5BU5D_t2460* ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_CopyTo_m13403(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t2031 *, KeyValuePair_2U5BU5D_t2460*, int32_t, const MethodInfo*))Dictionary_2_CopyTo_m13403_gshared)(__this, ___array, ___index, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::Resize()
extern "C" void Dictionary_2_Resize_m13405_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_Resize_m13405(__this, method) (( void (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_Resize_m13405_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::Add(TKey,TValue)
extern "C" void Dictionary_2_Add_m13407_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, int32_t ___value, const MethodInfo* method);
#define Dictionary_2_Add_m13407(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t2031 *, Object_t *, int32_t, const MethodInfo*))Dictionary_2_Add_m13407_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::Clear()
extern "C" void Dictionary_2_Clear_m13409_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_Clear_m13409(__this, method) (( void (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_Clear_m13409_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::ContainsKey(TKey)
extern "C" bool Dictionary_2_ContainsKey_m13411_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_ContainsKey_m13411(__this, ___key, method) (( bool (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_ContainsKey_m13411_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::ContainsValue(TValue)
extern "C" bool Dictionary_2_ContainsValue_m13413_gshared (Dictionary_2_t2031 * __this, int32_t ___value, const MethodInfo* method);
#define Dictionary_2_ContainsValue_m13413(__this, ___value, method) (( bool (*) (Dictionary_2_t2031 *, int32_t, const MethodInfo*))Dictionary_2_ContainsValue_m13413_gshared)(__this, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::GetObjectData(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
extern "C" void Dictionary_2_GetObjectData_m13415_gshared (Dictionary_2_t2031 * __this, SerializationInfo_t433 * ___info, StreamingContext_t434  ___context, const MethodInfo* method);
#define Dictionary_2_GetObjectData_m13415(__this, ___info, ___context, method) (( void (*) (Dictionary_2_t2031 *, SerializationInfo_t433 *, StreamingContext_t434 , const MethodInfo*))Dictionary_2_GetObjectData_m13415_gshared)(__this, ___info, ___context, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::OnDeserialization(System.Object)
extern "C" void Dictionary_2_OnDeserialization_m13417_gshared (Dictionary_2_t2031 * __this, Object_t * ___sender, const MethodInfo* method);
#define Dictionary_2_OnDeserialization_m13417(__this, ___sender, method) (( void (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_OnDeserialization_m13417_gshared)(__this, ___sender, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::Remove(TKey)
extern "C" bool Dictionary_2_Remove_m13419_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_Remove_m13419(__this, ___key, method) (( bool (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_Remove_m13419_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::TryGetValue(TKey,TValue&)
extern "C" bool Dictionary_2_TryGetValue_m13421_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, int32_t* ___value, const MethodInfo* method);
#define Dictionary_2_TryGetValue_m13421(__this, ___key, ___value, method) (( bool (*) (Dictionary_2_t2031 *, Object_t *, int32_t*, const MethodInfo*))Dictionary_2_TryGetValue_m13421_gshared)(__this, ___key, ___value, method)
// System.Collections.Generic.Dictionary`2/ValueCollection<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::get_Values()
extern "C" ValueCollection_t2035 * Dictionary_2_get_Values_m13423_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_get_Values_m13423(__this, method) (( ValueCollection_t2035 * (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_get_Values_m13423_gshared)(__this, method)
// TKey System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::ToTKey(System.Object)
extern "C" Object_t * Dictionary_2_ToTKey_m13425_gshared (Dictionary_2_t2031 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_ToTKey_m13425(__this, ___key, method) (( Object_t * (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_ToTKey_m13425_gshared)(__this, ___key, method)
// TValue System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::ToTValue(System.Object)
extern "C" int32_t Dictionary_2_ToTValue_m13427_gshared (Dictionary_2_t2031 * __this, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_ToTValue_m13427(__this, ___value, method) (( int32_t (*) (Dictionary_2_t2031 *, Object_t *, const MethodInfo*))Dictionary_2_ToTValue_m13427_gshared)(__this, ___value, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::ContainsKeyValuePair(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_ContainsKeyValuePair_m13429_gshared (Dictionary_2_t2031 * __this, KeyValuePair_2_t2033  ___pair, const MethodInfo* method);
#define Dictionary_2_ContainsKeyValuePair_m13429(__this, ___pair, method) (( bool (*) (Dictionary_2_t2031 *, KeyValuePair_2_t2033 , const MethodInfo*))Dictionary_2_ContainsKeyValuePair_m13429_gshared)(__this, ___pair, method)
// System.Collections.Generic.Dictionary`2/Enumerator<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::GetEnumerator()
extern "C" Enumerator_t2037  Dictionary_2_GetEnumerator_m13431_gshared (Dictionary_2_t2031 * __this, const MethodInfo* method);
#define Dictionary_2_GetEnumerator_m13431(__this, method) (( Enumerator_t2037  (*) (Dictionary_2_t2031 *, const MethodInfo*))Dictionary_2_GetEnumerator_m13431_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2<System.Object,System.Int32>::<CopyTo>m__0(TKey,TValue)
extern "C" DictionaryEntry_t900  Dictionary_2_U3CCopyToU3Em__0_m13433_gshared (Object_t * __this /* static, unused */, Object_t * ___key, int32_t ___value, const MethodInfo* method);
#define Dictionary_2_U3CCopyToU3Em__0_m13433(__this /* static, unused */, ___key, ___value, method) (( DictionaryEntry_t900  (*) (Object_t * /* static, unused */, Object_t *, int32_t, const MethodInfo*))Dictionary_2_U3CCopyToU3Em__0_m13433_gshared)(__this /* static, unused */, ___key, ___value, method)

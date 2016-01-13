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

// System.Collections.Generic.Dictionary`2<System.Object,System.Object>
struct Dictionary_2_t1855;
// System.Collections.Generic.IEqualityComparer`1<System.Object>
struct IEqualityComparer_1_t1857;
// System.Runtime.Serialization.SerializationInfo
struct SerializationInfo_t433;
// System.Object
struct Object_t;
// System.Collections.Generic.KeyValuePair`2<System.Object,System.Object>[]
struct KeyValuePair_2U5BU5D_t2431;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<System.Object,System.Object>>
struct IEnumerator_1_t2432;
// System.Collections.IDictionaryEnumerator
struct IDictionaryEnumerator_t899;
// System.Collections.Generic.Dictionary`2/ValueCollection<System.Object,System.Object>
struct ValueCollection_t1863;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Runtime_Serialization_StreamingContext.h"
#include "mscorlib_System_Collections_Generic_KeyValuePair_2_gen_0.h"
#include "mscorlib_System_Collections_Generic_Dictionary_2_Enumerator__0.h"
#include "mscorlib_System_Collections_DictionaryEntry.h"

// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::.ctor()
extern "C" void Dictionary_2__ctor_m10974_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2__ctor_m10974(__this, method) (( void (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2__ctor_m10974_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::.ctor(System.Collections.Generic.IEqualityComparer`1<TKey>)
extern "C" void Dictionary_2__ctor_m10976_gshared (Dictionary_2_t1855 * __this, Object_t* ___comparer, const MethodInfo* method);
#define Dictionary_2__ctor_m10976(__this, ___comparer, method) (( void (*) (Dictionary_2_t1855 *, Object_t*, const MethodInfo*))Dictionary_2__ctor_m10976_gshared)(__this, ___comparer, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::.ctor(System.Int32)
extern "C" void Dictionary_2__ctor_m10978_gshared (Dictionary_2_t1855 * __this, int32_t ___capacity, const MethodInfo* method);
#define Dictionary_2__ctor_m10978(__this, ___capacity, method) (( void (*) (Dictionary_2_t1855 *, int32_t, const MethodInfo*))Dictionary_2__ctor_m10978_gshared)(__this, ___capacity, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::.ctor(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
extern "C" void Dictionary_2__ctor_m10980_gshared (Dictionary_2_t1855 * __this, SerializationInfo_t433 * ___info, StreamingContext_t434  ___context, const MethodInfo* method);
#define Dictionary_2__ctor_m10980(__this, ___info, ___context, method) (( void (*) (Dictionary_2_t1855 *, SerializationInfo_t433 *, StreamingContext_t434 , const MethodInfo*))Dictionary_2__ctor_m10980_gshared)(__this, ___info, ___context, method)
// System.Object System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.IDictionary.get_Item(System.Object)
extern "C" Object_t * Dictionary_2_System_Collections_IDictionary_get_Item_m10982_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_get_Item_m10982(__this, ___key, method) (( Object_t * (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_get_Item_m10982_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.IDictionary.set_Item(System.Object,System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_set_Item_m10984_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_set_Item_m10984(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t1855 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_set_Item_m10984_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.IDictionary.Add(System.Object,System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_Add_m10986_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Add_m10986(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t1855 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Add_m10986_gshared)(__this, ___key, ___value, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.IDictionary.Contains(System.Object)
extern "C" bool Dictionary_2_System_Collections_IDictionary_Contains_m10988_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Contains_m10988(__this, ___key, method) (( bool (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Contains_m10988_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.IDictionary.Remove(System.Object)
extern "C" void Dictionary_2_System_Collections_IDictionary_Remove_m10990_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_Remove_m10990(__this, ___key, method) (( void (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_Remove_m10990_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.ICollection.get_IsSynchronized()
extern "C" bool Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m10992_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m10992(__this, method) (( bool (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_System_Collections_ICollection_get_IsSynchronized_m10992_gshared)(__this, method)
// System.Object System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.ICollection.get_SyncRoot()
extern "C" Object_t * Dictionary_2_System_Collections_ICollection_get_SyncRoot_m10994_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_get_SyncRoot_m10994(__this, method) (( Object_t * (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_System_Collections_ICollection_get_SyncRoot_m10994_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.get_IsReadOnly()
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m10996_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m10996(__this, method) (( bool (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_get_IsReadOnly_m10996_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Add(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" void Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m10998_gshared (Dictionary_2_t1855 * __this, KeyValuePair_2_t1858  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m10998(__this, ___keyValuePair, method) (( void (*) (Dictionary_2_t1855 *, KeyValuePair_2_t1858 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Add_m10998_gshared)(__this, ___keyValuePair, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Contains(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m11000_gshared (Dictionary_2_t1855 * __this, KeyValuePair_2_t1858  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m11000(__this, ___keyValuePair, method) (( bool (*) (Dictionary_2_t1855 *, KeyValuePair_2_t1858 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Contains_m11000_gshared)(__this, ___keyValuePair, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.CopyTo(System.Collections.Generic.KeyValuePair`2<TKey,TValue>[],System.Int32)
extern "C" void Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m11002_gshared (Dictionary_2_t1855 * __this, KeyValuePair_2U5BU5D_t2431* ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m11002(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t1855 *, KeyValuePair_2U5BU5D_t2431*, int32_t, const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_CopyTo_m11002_gshared)(__this, ___array, ___index, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.Generic.ICollection<System.Collections.Generic.KeyValuePair<TKey,TValue>>.Remove(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m11004_gshared (Dictionary_2_t1855 * __this, KeyValuePair_2_t1858  ___keyValuePair, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m11004(__this, ___keyValuePair, method) (( bool (*) (Dictionary_2_t1855 *, KeyValuePair_2_t1858 , const MethodInfo*))Dictionary_2_System_Collections_Generic_ICollectionU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_Remove_m11004_gshared)(__this, ___keyValuePair, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
extern "C" void Dictionary_2_System_Collections_ICollection_CopyTo_m11006_gshared (Dictionary_2_t1855 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_System_Collections_ICollection_CopyTo_m11006(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t1855 *, Array_t *, int32_t, const MethodInfo*))Dictionary_2_System_Collections_ICollection_CopyTo_m11006_gshared)(__this, ___array, ___index, method)
// System.Collections.IEnumerator System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m11008_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m11008(__this, method) (( Object_t * (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_System_Collections_IEnumerable_GetEnumerator_m11008_gshared)(__this, method)
// System.Collections.Generic.IEnumerator`1<System.Collections.Generic.KeyValuePair`2<TKey,TValue>> System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.Generic.IEnumerable<System.Collections.Generic.KeyValuePair<TKey,TValue>>.GetEnumerator()
extern "C" Object_t* Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m11010_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m11010(__this, method) (( Object_t* (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_System_Collections_Generic_IEnumerableU3CSystem_Collections_Generic_KeyValuePairU3CTKeyU2CTValueU3EU3E_GetEnumerator_m11010_gshared)(__this, method)
// System.Collections.IDictionaryEnumerator System.Collections.Generic.Dictionary`2<System.Object,System.Object>::System.Collections.IDictionary.GetEnumerator()
extern "C" Object_t * Dictionary_2_System_Collections_IDictionary_GetEnumerator_m11012_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_System_Collections_IDictionary_GetEnumerator_m11012(__this, method) (( Object_t * (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_System_Collections_IDictionary_GetEnumerator_m11012_gshared)(__this, method)
// System.Int32 System.Collections.Generic.Dictionary`2<System.Object,System.Object>::get_Count()
extern "C" int32_t Dictionary_2_get_Count_m11014_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_get_Count_m11014(__this, method) (( int32_t (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_get_Count_m11014_gshared)(__this, method)
// TValue System.Collections.Generic.Dictionary`2<System.Object,System.Object>::get_Item(TKey)
extern "C" Object_t * Dictionary_2_get_Item_m11016_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_get_Item_m11016(__this, ___key, method) (( Object_t * (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_get_Item_m11016_gshared)(__this, ___key, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::set_Item(TKey,TValue)
extern "C" void Dictionary_2_set_Item_m11018_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_set_Item_m11018(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t1855 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_set_Item_m11018_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::Init(System.Int32,System.Collections.Generic.IEqualityComparer`1<TKey>)
extern "C" void Dictionary_2_Init_m11020_gshared (Dictionary_2_t1855 * __this, int32_t ___capacity, Object_t* ___hcp, const MethodInfo* method);
#define Dictionary_2_Init_m11020(__this, ___capacity, ___hcp, method) (( void (*) (Dictionary_2_t1855 *, int32_t, Object_t*, const MethodInfo*))Dictionary_2_Init_m11020_gshared)(__this, ___capacity, ___hcp, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::InitArrays(System.Int32)
extern "C" void Dictionary_2_InitArrays_m11022_gshared (Dictionary_2_t1855 * __this, int32_t ___size, const MethodInfo* method);
#define Dictionary_2_InitArrays_m11022(__this, ___size, method) (( void (*) (Dictionary_2_t1855 *, int32_t, const MethodInfo*))Dictionary_2_InitArrays_m11022_gshared)(__this, ___size, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::CopyToCheck(System.Array,System.Int32)
extern "C" void Dictionary_2_CopyToCheck_m11024_gshared (Dictionary_2_t1855 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_CopyToCheck_m11024(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t1855 *, Array_t *, int32_t, const MethodInfo*))Dictionary_2_CopyToCheck_m11024_gshared)(__this, ___array, ___index, method)
// System.Collections.Generic.KeyValuePair`2<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Object,System.Object>::make_pair(TKey,TValue)
extern "C" KeyValuePair_2_t1858  Dictionary_2_make_pair_m11026_gshared (Object_t * __this /* static, unused */, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_make_pair_m11026(__this /* static, unused */, ___key, ___value, method) (( KeyValuePair_2_t1858  (*) (Object_t * /* static, unused */, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_make_pair_m11026_gshared)(__this /* static, unused */, ___key, ___value, method)
// TValue System.Collections.Generic.Dictionary`2<System.Object,System.Object>::pick_value(TKey,TValue)
extern "C" Object_t * Dictionary_2_pick_value_m11028_gshared (Object_t * __this /* static, unused */, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_pick_value_m11028(__this /* static, unused */, ___key, ___value, method) (( Object_t * (*) (Object_t * /* static, unused */, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_pick_value_m11028_gshared)(__this /* static, unused */, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::CopyTo(System.Collections.Generic.KeyValuePair`2<TKey,TValue>[],System.Int32)
extern "C" void Dictionary_2_CopyTo_m11030_gshared (Dictionary_2_t1855 * __this, KeyValuePair_2U5BU5D_t2431* ___array, int32_t ___index, const MethodInfo* method);
#define Dictionary_2_CopyTo_m11030(__this, ___array, ___index, method) (( void (*) (Dictionary_2_t1855 *, KeyValuePair_2U5BU5D_t2431*, int32_t, const MethodInfo*))Dictionary_2_CopyTo_m11030_gshared)(__this, ___array, ___index, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::Resize()
extern "C" void Dictionary_2_Resize_m11032_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_Resize_m11032(__this, method) (( void (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_Resize_m11032_gshared)(__this, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::Add(TKey,TValue)
extern "C" void Dictionary_2_Add_m11034_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_Add_m11034(__this, ___key, ___value, method) (( void (*) (Dictionary_2_t1855 *, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_Add_m11034_gshared)(__this, ___key, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::Clear()
extern "C" void Dictionary_2_Clear_m11036_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_Clear_m11036(__this, method) (( void (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_Clear_m11036_gshared)(__this, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::ContainsKey(TKey)
extern "C" bool Dictionary_2_ContainsKey_m11038_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_ContainsKey_m11038(__this, ___key, method) (( bool (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_ContainsKey_m11038_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::ContainsValue(TValue)
extern "C" bool Dictionary_2_ContainsValue_m11040_gshared (Dictionary_2_t1855 * __this, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_ContainsValue_m11040(__this, ___value, method) (( bool (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_ContainsValue_m11040_gshared)(__this, ___value, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::GetObjectData(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
extern "C" void Dictionary_2_GetObjectData_m11042_gshared (Dictionary_2_t1855 * __this, SerializationInfo_t433 * ___info, StreamingContext_t434  ___context, const MethodInfo* method);
#define Dictionary_2_GetObjectData_m11042(__this, ___info, ___context, method) (( void (*) (Dictionary_2_t1855 *, SerializationInfo_t433 *, StreamingContext_t434 , const MethodInfo*))Dictionary_2_GetObjectData_m11042_gshared)(__this, ___info, ___context, method)
// System.Void System.Collections.Generic.Dictionary`2<System.Object,System.Object>::OnDeserialization(System.Object)
extern "C" void Dictionary_2_OnDeserialization_m11044_gshared (Dictionary_2_t1855 * __this, Object_t * ___sender, const MethodInfo* method);
#define Dictionary_2_OnDeserialization_m11044(__this, ___sender, method) (( void (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_OnDeserialization_m11044_gshared)(__this, ___sender, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::Remove(TKey)
extern "C" bool Dictionary_2_Remove_m11046_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_Remove_m11046(__this, ___key, method) (( bool (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_Remove_m11046_gshared)(__this, ___key, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::TryGetValue(TKey,TValue&)
extern "C" bool Dictionary_2_TryGetValue_m11048_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, Object_t ** ___value, const MethodInfo* method);
#define Dictionary_2_TryGetValue_m11048(__this, ___key, ___value, method) (( bool (*) (Dictionary_2_t1855 *, Object_t *, Object_t **, const MethodInfo*))Dictionary_2_TryGetValue_m11048_gshared)(__this, ___key, ___value, method)
// System.Collections.Generic.Dictionary`2/ValueCollection<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Object,System.Object>::get_Values()
extern "C" ValueCollection_t1863 * Dictionary_2_get_Values_m11050_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_get_Values_m11050(__this, method) (( ValueCollection_t1863 * (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_get_Values_m11050_gshared)(__this, method)
// TKey System.Collections.Generic.Dictionary`2<System.Object,System.Object>::ToTKey(System.Object)
extern "C" Object_t * Dictionary_2_ToTKey_m11052_gshared (Dictionary_2_t1855 * __this, Object_t * ___key, const MethodInfo* method);
#define Dictionary_2_ToTKey_m11052(__this, ___key, method) (( Object_t * (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_ToTKey_m11052_gshared)(__this, ___key, method)
// TValue System.Collections.Generic.Dictionary`2<System.Object,System.Object>::ToTValue(System.Object)
extern "C" Object_t * Dictionary_2_ToTValue_m11054_gshared (Dictionary_2_t1855 * __this, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_ToTValue_m11054(__this, ___value, method) (( Object_t * (*) (Dictionary_2_t1855 *, Object_t *, const MethodInfo*))Dictionary_2_ToTValue_m11054_gshared)(__this, ___value, method)
// System.Boolean System.Collections.Generic.Dictionary`2<System.Object,System.Object>::ContainsKeyValuePair(System.Collections.Generic.KeyValuePair`2<TKey,TValue>)
extern "C" bool Dictionary_2_ContainsKeyValuePair_m11056_gshared (Dictionary_2_t1855 * __this, KeyValuePair_2_t1858  ___pair, const MethodInfo* method);
#define Dictionary_2_ContainsKeyValuePair_m11056(__this, ___pair, method) (( bool (*) (Dictionary_2_t1855 *, KeyValuePair_2_t1858 , const MethodInfo*))Dictionary_2_ContainsKeyValuePair_m11056_gshared)(__this, ___pair, method)
// System.Collections.Generic.Dictionary`2/Enumerator<TKey,TValue> System.Collections.Generic.Dictionary`2<System.Object,System.Object>::GetEnumerator()
extern "C" Enumerator_t1865  Dictionary_2_GetEnumerator_m11058_gshared (Dictionary_2_t1855 * __this, const MethodInfo* method);
#define Dictionary_2_GetEnumerator_m11058(__this, method) (( Enumerator_t1865  (*) (Dictionary_2_t1855 *, const MethodInfo*))Dictionary_2_GetEnumerator_m11058_gshared)(__this, method)
// System.Collections.DictionaryEntry System.Collections.Generic.Dictionary`2<System.Object,System.Object>::<CopyTo>m__0(TKey,TValue)
extern "C" DictionaryEntry_t900  Dictionary_2_U3CCopyToU3Em__0_m11060_gshared (Object_t * __this /* static, unused */, Object_t * ___key, Object_t * ___value, const MethodInfo* method);
#define Dictionary_2_U3CCopyToU3Em__0_m11060(__this /* static, unused */, ___key, ___value, method) (( DictionaryEntry_t900  (*) (Object_t * /* static, unused */, Object_t *, Object_t *, const MethodInfo*))Dictionary_2_U3CCopyToU3Em__0_m11060_gshared)(__this /* static, unused */, ___key, ___value, method)

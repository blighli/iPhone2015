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

// System.Collections.Generic.List`1<UnityEngine.UILineInfo>
struct List_1_t318;
// System.Collections.Generic.IEnumerable`1<UnityEngine.UILineInfo>
struct IEnumerable_1_t2457;
// System.Collections.Generic.IEnumerator`1<UnityEngine.UILineInfo>
struct IEnumerator_1_t2458;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Object
struct Object_t;
// System.Collections.Generic.ICollection`1<UnityEngine.UILineInfo>
struct ICollection_1_t703;
// System.Collections.ObjectModel.ReadOnlyCollection`1<UnityEngine.UILineInfo>
struct ReadOnlyCollection_1_t2022;
// UnityEngine.UILineInfo[]
struct UILineInfoU5BU5D_t427;
// System.Predicate`1<UnityEngine.UILineInfo>
struct Predicate_1_t2026;
// System.Comparison`1<UnityEngine.UILineInfo>
struct Comparison_1_t2029;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_UILineInfo.h"
#include "mscorlib_System_Collections_Generic_List_1_Enumerator_gen_14.h"

// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::.ctor()
extern "C" void List_1__ctor_m13203_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1__ctor_m13203(__this, method) (( void (*) (List_1_t318 *, const MethodInfo*))List_1__ctor_m13203_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::.ctor(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1__ctor_m13204_gshared (List_1_t318 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1__ctor_m13204(__this, ___collection, method) (( void (*) (List_1_t318 *, Object_t*, const MethodInfo*))List_1__ctor_m13204_gshared)(__this, ___collection, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::.ctor(System.Int32)
extern "C" void List_1__ctor_m2038_gshared (List_1_t318 * __this, int32_t ___capacity, const MethodInfo* method);
#define List_1__ctor_m2038(__this, ___capacity, method) (( void (*) (List_1_t318 *, int32_t, const MethodInfo*))List_1__ctor_m2038_gshared)(__this, ___capacity, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::.cctor()
extern "C" void List_1__cctor_m13205_gshared (Object_t * __this /* static, unused */, const MethodInfo* method);
#define List_1__cctor_m13205(__this /* static, unused */, method) (( void (*) (Object_t * /* static, unused */, const MethodInfo*))List_1__cctor_m13205_gshared)(__this /* static, unused */, method)
// System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.Generic.IEnumerable<T>.GetEnumerator()
extern "C" Object_t* List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m13206_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m13206(__this, method) (( Object_t* (*) (List_1_t318 *, const MethodInfo*))List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m13206_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
extern "C" void List_1_System_Collections_ICollection_CopyTo_m13207_gshared (List_1_t318 * __this, Array_t * ___array, int32_t ___arrayIndex, const MethodInfo* method);
#define List_1_System_Collections_ICollection_CopyTo_m13207(__this, ___array, ___arrayIndex, method) (( void (*) (List_1_t318 *, Array_t *, int32_t, const MethodInfo*))List_1_System_Collections_ICollection_CopyTo_m13207_gshared)(__this, ___array, ___arrayIndex, method)
// System.Collections.IEnumerator System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * List_1_System_Collections_IEnumerable_GetEnumerator_m13208_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_System_Collections_IEnumerable_GetEnumerator_m13208(__this, method) (( Object_t * (*) (List_1_t318 *, const MethodInfo*))List_1_System_Collections_IEnumerable_GetEnumerator_m13208_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.Add(System.Object)
extern "C" int32_t List_1_System_Collections_IList_Add_m13209_gshared (List_1_t318 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Add_m13209(__this, ___item, method) (( int32_t (*) (List_1_t318 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Add_m13209_gshared)(__this, ___item, method)
// System.Boolean System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.Contains(System.Object)
extern "C" bool List_1_System_Collections_IList_Contains_m13210_gshared (List_1_t318 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Contains_m13210(__this, ___item, method) (( bool (*) (List_1_t318 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Contains_m13210_gshared)(__this, ___item, method)
// System.Int32 System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.IndexOf(System.Object)
extern "C" int32_t List_1_System_Collections_IList_IndexOf_m13211_gshared (List_1_t318 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_IndexOf_m13211(__this, ___item, method) (( int32_t (*) (List_1_t318 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_IndexOf_m13211_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.Insert(System.Int32,System.Object)
extern "C" void List_1_System_Collections_IList_Insert_m13212_gshared (List_1_t318 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Insert_m13212(__this, ___index, ___item, method) (( void (*) (List_1_t318 *, int32_t, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Insert_m13212_gshared)(__this, ___index, ___item, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.Remove(System.Object)
extern "C" void List_1_System_Collections_IList_Remove_m13213_gshared (List_1_t318 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Remove_m13213(__this, ___item, method) (( void (*) (List_1_t318 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Remove_m13213_gshared)(__this, ___item, method)
// System.Boolean System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.Generic.ICollection<T>.get_IsReadOnly()
extern "C" bool List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m13214_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m13214(__this, method) (( bool (*) (List_1_t318 *, const MethodInfo*))List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m13214_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.ICollection.get_IsSynchronized()
extern "C" bool List_1_System_Collections_ICollection_get_IsSynchronized_m13215_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_System_Collections_ICollection_get_IsSynchronized_m13215(__this, method) (( bool (*) (List_1_t318 *, const MethodInfo*))List_1_System_Collections_ICollection_get_IsSynchronized_m13215_gshared)(__this, method)
// System.Object System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.ICollection.get_SyncRoot()
extern "C" Object_t * List_1_System_Collections_ICollection_get_SyncRoot_m13216_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_System_Collections_ICollection_get_SyncRoot_m13216(__this, method) (( Object_t * (*) (List_1_t318 *, const MethodInfo*))List_1_System_Collections_ICollection_get_SyncRoot_m13216_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.get_IsFixedSize()
extern "C" bool List_1_System_Collections_IList_get_IsFixedSize_m13217_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_System_Collections_IList_get_IsFixedSize_m13217(__this, method) (( bool (*) (List_1_t318 *, const MethodInfo*))List_1_System_Collections_IList_get_IsFixedSize_m13217_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.get_IsReadOnly()
extern "C" bool List_1_System_Collections_IList_get_IsReadOnly_m13218_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_System_Collections_IList_get_IsReadOnly_m13218(__this, method) (( bool (*) (List_1_t318 *, const MethodInfo*))List_1_System_Collections_IList_get_IsReadOnly_m13218_gshared)(__this, method)
// System.Object System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.get_Item(System.Int32)
extern "C" Object_t * List_1_System_Collections_IList_get_Item_m13219_gshared (List_1_t318 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_System_Collections_IList_get_Item_m13219(__this, ___index, method) (( Object_t * (*) (List_1_t318 *, int32_t, const MethodInfo*))List_1_System_Collections_IList_get_Item_m13219_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::System.Collections.IList.set_Item(System.Int32,System.Object)
extern "C" void List_1_System_Collections_IList_set_Item_m13220_gshared (List_1_t318 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define List_1_System_Collections_IList_set_Item_m13220(__this, ___index, ___value, method) (( void (*) (List_1_t318 *, int32_t, Object_t *, const MethodInfo*))List_1_System_Collections_IList_set_Item_m13220_gshared)(__this, ___index, ___value, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Add(T)
extern "C" void List_1_Add_m13221_gshared (List_1_t318 * __this, UILineInfo_t313  ___item, const MethodInfo* method);
#define List_1_Add_m13221(__this, ___item, method) (( void (*) (List_1_t318 *, UILineInfo_t313 , const MethodInfo*))List_1_Add_m13221_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::GrowIfNeeded(System.Int32)
extern "C" void List_1_GrowIfNeeded_m13222_gshared (List_1_t318 * __this, int32_t ___newCount, const MethodInfo* method);
#define List_1_GrowIfNeeded_m13222(__this, ___newCount, method) (( void (*) (List_1_t318 *, int32_t, const MethodInfo*))List_1_GrowIfNeeded_m13222_gshared)(__this, ___newCount, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::AddCollection(System.Collections.Generic.ICollection`1<T>)
extern "C" void List_1_AddCollection_m13223_gshared (List_1_t318 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_AddCollection_m13223(__this, ___collection, method) (( void (*) (List_1_t318 *, Object_t*, const MethodInfo*))List_1_AddCollection_m13223_gshared)(__this, ___collection, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::AddEnumerable(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_AddEnumerable_m13224_gshared (List_1_t318 * __this, Object_t* ___enumerable, const MethodInfo* method);
#define List_1_AddEnumerable_m13224(__this, ___enumerable, method) (( void (*) (List_1_t318 *, Object_t*, const MethodInfo*))List_1_AddEnumerable_m13224_gshared)(__this, ___enumerable, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::AddRange(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_AddRange_m13225_gshared (List_1_t318 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_AddRange_m13225(__this, ___collection, method) (( void (*) (List_1_t318 *, Object_t*, const MethodInfo*))List_1_AddRange_m13225_gshared)(__this, ___collection, method)
// System.Collections.ObjectModel.ReadOnlyCollection`1<T> System.Collections.Generic.List`1<UnityEngine.UILineInfo>::AsReadOnly()
extern "C" ReadOnlyCollection_1_t2022 * List_1_AsReadOnly_m13226_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_AsReadOnly_m13226(__this, method) (( ReadOnlyCollection_1_t2022 * (*) (List_1_t318 *, const MethodInfo*))List_1_AsReadOnly_m13226_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Clear()
extern "C" void List_1_Clear_m13227_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_Clear_m13227(__this, method) (( void (*) (List_1_t318 *, const MethodInfo*))List_1_Clear_m13227_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Contains(T)
extern "C" bool List_1_Contains_m13228_gshared (List_1_t318 * __this, UILineInfo_t313  ___item, const MethodInfo* method);
#define List_1_Contains_m13228(__this, ___item, method) (( bool (*) (List_1_t318 *, UILineInfo_t313 , const MethodInfo*))List_1_Contains_m13228_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::CopyTo(T[],System.Int32)
extern "C" void List_1_CopyTo_m13229_gshared (List_1_t318 * __this, UILineInfoU5BU5D_t427* ___array, int32_t ___arrayIndex, const MethodInfo* method);
#define List_1_CopyTo_m13229(__this, ___array, ___arrayIndex, method) (( void (*) (List_1_t318 *, UILineInfoU5BU5D_t427*, int32_t, const MethodInfo*))List_1_CopyTo_m13229_gshared)(__this, ___array, ___arrayIndex, method)
// T System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Find(System.Predicate`1<T>)
extern "C" UILineInfo_t313  List_1_Find_m13230_gshared (List_1_t318 * __this, Predicate_1_t2026 * ___match, const MethodInfo* method);
#define List_1_Find_m13230(__this, ___match, method) (( UILineInfo_t313  (*) (List_1_t318 *, Predicate_1_t2026 *, const MethodInfo*))List_1_Find_m13230_gshared)(__this, ___match, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::CheckMatch(System.Predicate`1<T>)
extern "C" void List_1_CheckMatch_m13231_gshared (Object_t * __this /* static, unused */, Predicate_1_t2026 * ___match, const MethodInfo* method);
#define List_1_CheckMatch_m13231(__this /* static, unused */, ___match, method) (( void (*) (Object_t * /* static, unused */, Predicate_1_t2026 *, const MethodInfo*))List_1_CheckMatch_m13231_gshared)(__this /* static, unused */, ___match, method)
// System.Int32 System.Collections.Generic.List`1<UnityEngine.UILineInfo>::GetIndex(System.Int32,System.Int32,System.Predicate`1<T>)
extern "C" int32_t List_1_GetIndex_m13232_gshared (List_1_t318 * __this, int32_t ___startIndex, int32_t ___count, Predicate_1_t2026 * ___match, const MethodInfo* method);
#define List_1_GetIndex_m13232(__this, ___startIndex, ___count, ___match, method) (( int32_t (*) (List_1_t318 *, int32_t, int32_t, Predicate_1_t2026 *, const MethodInfo*))List_1_GetIndex_m13232_gshared)(__this, ___startIndex, ___count, ___match, method)
// System.Collections.Generic.List`1/Enumerator<T> System.Collections.Generic.List`1<UnityEngine.UILineInfo>::GetEnumerator()
extern "C" Enumerator_t2021  List_1_GetEnumerator_m13233_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_GetEnumerator_m13233(__this, method) (( Enumerator_t2021  (*) (List_1_t318 *, const MethodInfo*))List_1_GetEnumerator_m13233_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<UnityEngine.UILineInfo>::IndexOf(T)
extern "C" int32_t List_1_IndexOf_m13234_gshared (List_1_t318 * __this, UILineInfo_t313  ___item, const MethodInfo* method);
#define List_1_IndexOf_m13234(__this, ___item, method) (( int32_t (*) (List_1_t318 *, UILineInfo_t313 , const MethodInfo*))List_1_IndexOf_m13234_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Shift(System.Int32,System.Int32)
extern "C" void List_1_Shift_m13235_gshared (List_1_t318 * __this, int32_t ___start, int32_t ___delta, const MethodInfo* method);
#define List_1_Shift_m13235(__this, ___start, ___delta, method) (( void (*) (List_1_t318 *, int32_t, int32_t, const MethodInfo*))List_1_Shift_m13235_gshared)(__this, ___start, ___delta, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::CheckIndex(System.Int32)
extern "C" void List_1_CheckIndex_m13236_gshared (List_1_t318 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_CheckIndex_m13236(__this, ___index, method) (( void (*) (List_1_t318 *, int32_t, const MethodInfo*))List_1_CheckIndex_m13236_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Insert(System.Int32,T)
extern "C" void List_1_Insert_m13237_gshared (List_1_t318 * __this, int32_t ___index, UILineInfo_t313  ___item, const MethodInfo* method);
#define List_1_Insert_m13237(__this, ___index, ___item, method) (( void (*) (List_1_t318 *, int32_t, UILineInfo_t313 , const MethodInfo*))List_1_Insert_m13237_gshared)(__this, ___index, ___item, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::CheckCollection(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_CheckCollection_m13238_gshared (List_1_t318 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_CheckCollection_m13238(__this, ___collection, method) (( void (*) (List_1_t318 *, Object_t*, const MethodInfo*))List_1_CheckCollection_m13238_gshared)(__this, ___collection, method)
// System.Boolean System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Remove(T)
extern "C" bool List_1_Remove_m13239_gshared (List_1_t318 * __this, UILineInfo_t313  ___item, const MethodInfo* method);
#define List_1_Remove_m13239(__this, ___item, method) (( bool (*) (List_1_t318 *, UILineInfo_t313 , const MethodInfo*))List_1_Remove_m13239_gshared)(__this, ___item, method)
// System.Int32 System.Collections.Generic.List`1<UnityEngine.UILineInfo>::RemoveAll(System.Predicate`1<T>)
extern "C" int32_t List_1_RemoveAll_m13240_gshared (List_1_t318 * __this, Predicate_1_t2026 * ___match, const MethodInfo* method);
#define List_1_RemoveAll_m13240(__this, ___match, method) (( int32_t (*) (List_1_t318 *, Predicate_1_t2026 *, const MethodInfo*))List_1_RemoveAll_m13240_gshared)(__this, ___match, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::RemoveAt(System.Int32)
extern "C" void List_1_RemoveAt_m13241_gshared (List_1_t318 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_RemoveAt_m13241(__this, ___index, method) (( void (*) (List_1_t318 *, int32_t, const MethodInfo*))List_1_RemoveAt_m13241_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Reverse()
extern "C" void List_1_Reverse_m13242_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_Reverse_m13242(__this, method) (( void (*) (List_1_t318 *, const MethodInfo*))List_1_Reverse_m13242_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Sort()
extern "C" void List_1_Sort_m13243_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_Sort_m13243(__this, method) (( void (*) (List_1_t318 *, const MethodInfo*))List_1_Sort_m13243_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::Sort(System.Comparison`1<T>)
extern "C" void List_1_Sort_m13244_gshared (List_1_t318 * __this, Comparison_1_t2029 * ___comparison, const MethodInfo* method);
#define List_1_Sort_m13244(__this, ___comparison, method) (( void (*) (List_1_t318 *, Comparison_1_t2029 *, const MethodInfo*))List_1_Sort_m13244_gshared)(__this, ___comparison, method)
// T[] System.Collections.Generic.List`1<UnityEngine.UILineInfo>::ToArray()
extern "C" UILineInfoU5BU5D_t427* List_1_ToArray_m13245_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_ToArray_m13245(__this, method) (( UILineInfoU5BU5D_t427* (*) (List_1_t318 *, const MethodInfo*))List_1_ToArray_m13245_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::TrimExcess()
extern "C" void List_1_TrimExcess_m13246_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_TrimExcess_m13246(__this, method) (( void (*) (List_1_t318 *, const MethodInfo*))List_1_TrimExcess_m13246_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<UnityEngine.UILineInfo>::get_Capacity()
extern "C" int32_t List_1_get_Capacity_m13247_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_get_Capacity_m13247(__this, method) (( int32_t (*) (List_1_t318 *, const MethodInfo*))List_1_get_Capacity_m13247_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::set_Capacity(System.Int32)
extern "C" void List_1_set_Capacity_m13248_gshared (List_1_t318 * __this, int32_t ___value, const MethodInfo* method);
#define List_1_set_Capacity_m13248(__this, ___value, method) (( void (*) (List_1_t318 *, int32_t, const MethodInfo*))List_1_set_Capacity_m13248_gshared)(__this, ___value, method)
// System.Int32 System.Collections.Generic.List`1<UnityEngine.UILineInfo>::get_Count()
extern "C" int32_t List_1_get_Count_m13249_gshared (List_1_t318 * __this, const MethodInfo* method);
#define List_1_get_Count_m13249(__this, method) (( int32_t (*) (List_1_t318 *, const MethodInfo*))List_1_get_Count_m13249_gshared)(__this, method)
// T System.Collections.Generic.List`1<UnityEngine.UILineInfo>::get_Item(System.Int32)
extern "C" UILineInfo_t313  List_1_get_Item_m13250_gshared (List_1_t318 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_get_Item_m13250(__this, ___index, method) (( UILineInfo_t313  (*) (List_1_t318 *, int32_t, const MethodInfo*))List_1_get_Item_m13250_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<UnityEngine.UILineInfo>::set_Item(System.Int32,T)
extern "C" void List_1_set_Item_m13251_gshared (List_1_t318 * __this, int32_t ___index, UILineInfo_t313  ___value, const MethodInfo* method);
#define List_1_set_Item_m13251(__this, ___index, ___value, method) (( void (*) (List_1_t318 *, int32_t, UILineInfo_t313 , const MethodInfo*))List_1_set_Item_m13251_gshared)(__this, ___index, ___value, method)

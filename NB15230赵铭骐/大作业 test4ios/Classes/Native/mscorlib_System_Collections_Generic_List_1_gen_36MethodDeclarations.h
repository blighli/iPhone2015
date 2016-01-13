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

// System.Collections.Generic.List`1<System.Object>
struct List_1_t706;
// System.Collections.Generic.IEnumerable`1<System.Object>
struct IEnumerable_1_t708;
// System.Collections.Generic.IEnumerator`1<System.Object>
struct IEnumerator_1_t2261;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Object
struct Object_t;
// System.Collections.Generic.ICollection`1<System.Object>
struct ICollection_1_t2436;
// System.Collections.ObjectModel.ReadOnlyCollection`1<System.Object>
struct ReadOnlyCollection_1_t1840;
// System.Object[]
struct ObjectU5BU5D_t162;
// System.Predicate`1<System.Object>
struct Predicate_1_t1885;
// System.Comparison`1<System.Object>
struct Comparison_1_t1890;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_Generic_List_1_Enumerator_gen_1.h"

// System.Void System.Collections.Generic.List`1<System.Object>::.ctor()
extern "C" void List_1__ctor_m11289_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1__ctor_m11289(__this, method) (( void (*) (List_1_t706 *, const MethodInfo*))List_1__ctor_m11289_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Object>::.ctor(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1__ctor_m11291_gshared (List_1_t706 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1__ctor_m11291(__this, ___collection, method) (( void (*) (List_1_t706 *, Object_t*, const MethodInfo*))List_1__ctor_m11291_gshared)(__this, ___collection, method)
// System.Void System.Collections.Generic.List`1<System.Object>::.ctor(System.Int32)
extern "C" void List_1__ctor_m11293_gshared (List_1_t706 * __this, int32_t ___capacity, const MethodInfo* method);
#define List_1__ctor_m11293(__this, ___capacity, method) (( void (*) (List_1_t706 *, int32_t, const MethodInfo*))List_1__ctor_m11293_gshared)(__this, ___capacity, method)
// System.Void System.Collections.Generic.List`1<System.Object>::.cctor()
extern "C" void List_1__cctor_m11295_gshared (Object_t * __this /* static, unused */, const MethodInfo* method);
#define List_1__cctor_m11295(__this /* static, unused */, method) (( void (*) (Object_t * /* static, unused */, const MethodInfo*))List_1__cctor_m11295_gshared)(__this /* static, unused */, method)
// System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1<System.Object>::System.Collections.Generic.IEnumerable<T>.GetEnumerator()
extern "C" Object_t* List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m11297_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m11297(__this, method) (( Object_t* (*) (List_1_t706 *, const MethodInfo*))List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m11297_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Object>::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
extern "C" void List_1_System_Collections_ICollection_CopyTo_m11299_gshared (List_1_t706 * __this, Array_t * ___array, int32_t ___arrayIndex, const MethodInfo* method);
#define List_1_System_Collections_ICollection_CopyTo_m11299(__this, ___array, ___arrayIndex, method) (( void (*) (List_1_t706 *, Array_t *, int32_t, const MethodInfo*))List_1_System_Collections_ICollection_CopyTo_m11299_gshared)(__this, ___array, ___arrayIndex, method)
// System.Collections.IEnumerator System.Collections.Generic.List`1<System.Object>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * List_1_System_Collections_IEnumerable_GetEnumerator_m11301_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_System_Collections_IEnumerable_GetEnumerator_m11301(__this, method) (( Object_t * (*) (List_1_t706 *, const MethodInfo*))List_1_System_Collections_IEnumerable_GetEnumerator_m11301_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<System.Object>::System.Collections.IList.Add(System.Object)
extern "C" int32_t List_1_System_Collections_IList_Add_m11303_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Add_m11303(__this, ___item, method) (( int32_t (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Add_m11303_gshared)(__this, ___item, method)
// System.Boolean System.Collections.Generic.List`1<System.Object>::System.Collections.IList.Contains(System.Object)
extern "C" bool List_1_System_Collections_IList_Contains_m11305_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Contains_m11305(__this, ___item, method) (( bool (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Contains_m11305_gshared)(__this, ___item, method)
// System.Int32 System.Collections.Generic.List`1<System.Object>::System.Collections.IList.IndexOf(System.Object)
extern "C" int32_t List_1_System_Collections_IList_IndexOf_m11307_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_IndexOf_m11307(__this, ___item, method) (( int32_t (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_IndexOf_m11307_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Object>::System.Collections.IList.Insert(System.Int32,System.Object)
extern "C" void List_1_System_Collections_IList_Insert_m11309_gshared (List_1_t706 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Insert_m11309(__this, ___index, ___item, method) (( void (*) (List_1_t706 *, int32_t, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Insert_m11309_gshared)(__this, ___index, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Object>::System.Collections.IList.Remove(System.Object)
extern "C" void List_1_System_Collections_IList_Remove_m11311_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Remove_m11311(__this, ___item, method) (( void (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Remove_m11311_gshared)(__this, ___item, method)
// System.Boolean System.Collections.Generic.List`1<System.Object>::System.Collections.Generic.ICollection<T>.get_IsReadOnly()
extern "C" bool List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m11313_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m11313(__this, method) (( bool (*) (List_1_t706 *, const MethodInfo*))List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m11313_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Object>::System.Collections.ICollection.get_IsSynchronized()
extern "C" bool List_1_System_Collections_ICollection_get_IsSynchronized_m11315_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_System_Collections_ICollection_get_IsSynchronized_m11315(__this, method) (( bool (*) (List_1_t706 *, const MethodInfo*))List_1_System_Collections_ICollection_get_IsSynchronized_m11315_gshared)(__this, method)
// System.Object System.Collections.Generic.List`1<System.Object>::System.Collections.ICollection.get_SyncRoot()
extern "C" Object_t * List_1_System_Collections_ICollection_get_SyncRoot_m11317_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_System_Collections_ICollection_get_SyncRoot_m11317(__this, method) (( Object_t * (*) (List_1_t706 *, const MethodInfo*))List_1_System_Collections_ICollection_get_SyncRoot_m11317_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Object>::System.Collections.IList.get_IsFixedSize()
extern "C" bool List_1_System_Collections_IList_get_IsFixedSize_m11319_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_System_Collections_IList_get_IsFixedSize_m11319(__this, method) (( bool (*) (List_1_t706 *, const MethodInfo*))List_1_System_Collections_IList_get_IsFixedSize_m11319_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Object>::System.Collections.IList.get_IsReadOnly()
extern "C" bool List_1_System_Collections_IList_get_IsReadOnly_m11321_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_System_Collections_IList_get_IsReadOnly_m11321(__this, method) (( bool (*) (List_1_t706 *, const MethodInfo*))List_1_System_Collections_IList_get_IsReadOnly_m11321_gshared)(__this, method)
// System.Object System.Collections.Generic.List`1<System.Object>::System.Collections.IList.get_Item(System.Int32)
extern "C" Object_t * List_1_System_Collections_IList_get_Item_m11323_gshared (List_1_t706 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_System_Collections_IList_get_Item_m11323(__this, ___index, method) (( Object_t * (*) (List_1_t706 *, int32_t, const MethodInfo*))List_1_System_Collections_IList_get_Item_m11323_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Object>::System.Collections.IList.set_Item(System.Int32,System.Object)
extern "C" void List_1_System_Collections_IList_set_Item_m11325_gshared (List_1_t706 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define List_1_System_Collections_IList_set_Item_m11325(__this, ___index, ___value, method) (( void (*) (List_1_t706 *, int32_t, Object_t *, const MethodInfo*))List_1_System_Collections_IList_set_Item_m11325_gshared)(__this, ___index, ___value, method)
// System.Void System.Collections.Generic.List`1<System.Object>::Add(T)
extern "C" void List_1_Add_m11327_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_Add_m11327(__this, ___item, method) (( void (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_Add_m11327_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Object>::GrowIfNeeded(System.Int32)
extern "C" void List_1_GrowIfNeeded_m11329_gshared (List_1_t706 * __this, int32_t ___newCount, const MethodInfo* method);
#define List_1_GrowIfNeeded_m11329(__this, ___newCount, method) (( void (*) (List_1_t706 *, int32_t, const MethodInfo*))List_1_GrowIfNeeded_m11329_gshared)(__this, ___newCount, method)
// System.Void System.Collections.Generic.List`1<System.Object>::AddCollection(System.Collections.Generic.ICollection`1<T>)
extern "C" void List_1_AddCollection_m11331_gshared (List_1_t706 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_AddCollection_m11331(__this, ___collection, method) (( void (*) (List_1_t706 *, Object_t*, const MethodInfo*))List_1_AddCollection_m11331_gshared)(__this, ___collection, method)
// System.Void System.Collections.Generic.List`1<System.Object>::AddEnumerable(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_AddEnumerable_m11333_gshared (List_1_t706 * __this, Object_t* ___enumerable, const MethodInfo* method);
#define List_1_AddEnumerable_m11333(__this, ___enumerable, method) (( void (*) (List_1_t706 *, Object_t*, const MethodInfo*))List_1_AddEnumerable_m11333_gshared)(__this, ___enumerable, method)
// System.Void System.Collections.Generic.List`1<System.Object>::AddRange(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_AddRange_m11335_gshared (List_1_t706 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_AddRange_m11335(__this, ___collection, method) (( void (*) (List_1_t706 *, Object_t*, const MethodInfo*))List_1_AddRange_m11335_gshared)(__this, ___collection, method)
// System.Collections.ObjectModel.ReadOnlyCollection`1<T> System.Collections.Generic.List`1<System.Object>::AsReadOnly()
extern "C" ReadOnlyCollection_1_t1840 * List_1_AsReadOnly_m11337_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_AsReadOnly_m11337(__this, method) (( ReadOnlyCollection_1_t1840 * (*) (List_1_t706 *, const MethodInfo*))List_1_AsReadOnly_m11337_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Object>::Clear()
extern "C" void List_1_Clear_m11339_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_Clear_m11339(__this, method) (( void (*) (List_1_t706 *, const MethodInfo*))List_1_Clear_m11339_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Object>::Contains(T)
extern "C" bool List_1_Contains_m11341_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_Contains_m11341(__this, ___item, method) (( bool (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_Contains_m11341_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Object>::CopyTo(T[],System.Int32)
extern "C" void List_1_CopyTo_m11343_gshared (List_1_t706 * __this, ObjectU5BU5D_t162* ___array, int32_t ___arrayIndex, const MethodInfo* method);
#define List_1_CopyTo_m11343(__this, ___array, ___arrayIndex, method) (( void (*) (List_1_t706 *, ObjectU5BU5D_t162*, int32_t, const MethodInfo*))List_1_CopyTo_m11343_gshared)(__this, ___array, ___arrayIndex, method)
// T System.Collections.Generic.List`1<System.Object>::Find(System.Predicate`1<T>)
extern "C" Object_t * List_1_Find_m11345_gshared (List_1_t706 * __this, Predicate_1_t1885 * ___match, const MethodInfo* method);
#define List_1_Find_m11345(__this, ___match, method) (( Object_t * (*) (List_1_t706 *, Predicate_1_t1885 *, const MethodInfo*))List_1_Find_m11345_gshared)(__this, ___match, method)
// System.Void System.Collections.Generic.List`1<System.Object>::CheckMatch(System.Predicate`1<T>)
extern "C" void List_1_CheckMatch_m11347_gshared (Object_t * __this /* static, unused */, Predicate_1_t1885 * ___match, const MethodInfo* method);
#define List_1_CheckMatch_m11347(__this /* static, unused */, ___match, method) (( void (*) (Object_t * /* static, unused */, Predicate_1_t1885 *, const MethodInfo*))List_1_CheckMatch_m11347_gshared)(__this /* static, unused */, ___match, method)
// System.Int32 System.Collections.Generic.List`1<System.Object>::GetIndex(System.Int32,System.Int32,System.Predicate`1<T>)
extern "C" int32_t List_1_GetIndex_m11349_gshared (List_1_t706 * __this, int32_t ___startIndex, int32_t ___count, Predicate_1_t1885 * ___match, const MethodInfo* method);
#define List_1_GetIndex_m11349(__this, ___startIndex, ___count, ___match, method) (( int32_t (*) (List_1_t706 *, int32_t, int32_t, Predicate_1_t1885 *, const MethodInfo*))List_1_GetIndex_m11349_gshared)(__this, ___startIndex, ___count, ___match, method)
// System.Collections.Generic.List`1/Enumerator<T> System.Collections.Generic.List`1<System.Object>::GetEnumerator()
extern "C" Enumerator_t1882  List_1_GetEnumerator_m11351_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_GetEnumerator_m11351(__this, method) (( Enumerator_t1882  (*) (List_1_t706 *, const MethodInfo*))List_1_GetEnumerator_m11351_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<System.Object>::IndexOf(T)
extern "C" int32_t List_1_IndexOf_m11353_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_IndexOf_m11353(__this, ___item, method) (( int32_t (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_IndexOf_m11353_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Object>::Shift(System.Int32,System.Int32)
extern "C" void List_1_Shift_m11355_gshared (List_1_t706 * __this, int32_t ___start, int32_t ___delta, const MethodInfo* method);
#define List_1_Shift_m11355(__this, ___start, ___delta, method) (( void (*) (List_1_t706 *, int32_t, int32_t, const MethodInfo*))List_1_Shift_m11355_gshared)(__this, ___start, ___delta, method)
// System.Void System.Collections.Generic.List`1<System.Object>::CheckIndex(System.Int32)
extern "C" void List_1_CheckIndex_m11357_gshared (List_1_t706 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_CheckIndex_m11357(__this, ___index, method) (( void (*) (List_1_t706 *, int32_t, const MethodInfo*))List_1_CheckIndex_m11357_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Object>::Insert(System.Int32,T)
extern "C" void List_1_Insert_m11359_gshared (List_1_t706 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define List_1_Insert_m11359(__this, ___index, ___item, method) (( void (*) (List_1_t706 *, int32_t, Object_t *, const MethodInfo*))List_1_Insert_m11359_gshared)(__this, ___index, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Object>::CheckCollection(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_CheckCollection_m11361_gshared (List_1_t706 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_CheckCollection_m11361(__this, ___collection, method) (( void (*) (List_1_t706 *, Object_t*, const MethodInfo*))List_1_CheckCollection_m11361_gshared)(__this, ___collection, method)
// System.Boolean System.Collections.Generic.List`1<System.Object>::Remove(T)
extern "C" bool List_1_Remove_m11363_gshared (List_1_t706 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_Remove_m11363(__this, ___item, method) (( bool (*) (List_1_t706 *, Object_t *, const MethodInfo*))List_1_Remove_m11363_gshared)(__this, ___item, method)
// System.Int32 System.Collections.Generic.List`1<System.Object>::RemoveAll(System.Predicate`1<T>)
extern "C" int32_t List_1_RemoveAll_m11365_gshared (List_1_t706 * __this, Predicate_1_t1885 * ___match, const MethodInfo* method);
#define List_1_RemoveAll_m11365(__this, ___match, method) (( int32_t (*) (List_1_t706 *, Predicate_1_t1885 *, const MethodInfo*))List_1_RemoveAll_m11365_gshared)(__this, ___match, method)
// System.Void System.Collections.Generic.List`1<System.Object>::RemoveAt(System.Int32)
extern "C" void List_1_RemoveAt_m11367_gshared (List_1_t706 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_RemoveAt_m11367(__this, ___index, method) (( void (*) (List_1_t706 *, int32_t, const MethodInfo*))List_1_RemoveAt_m11367_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Object>::Reverse()
extern "C" void List_1_Reverse_m11369_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_Reverse_m11369(__this, method) (( void (*) (List_1_t706 *, const MethodInfo*))List_1_Reverse_m11369_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Object>::Sort()
extern "C" void List_1_Sort_m11371_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_Sort_m11371(__this, method) (( void (*) (List_1_t706 *, const MethodInfo*))List_1_Sort_m11371_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Object>::Sort(System.Comparison`1<T>)
extern "C" void List_1_Sort_m11373_gshared (List_1_t706 * __this, Comparison_1_t1890 * ___comparison, const MethodInfo* method);
#define List_1_Sort_m11373(__this, ___comparison, method) (( void (*) (List_1_t706 *, Comparison_1_t1890 *, const MethodInfo*))List_1_Sort_m11373_gshared)(__this, ___comparison, method)
// T[] System.Collections.Generic.List`1<System.Object>::ToArray()
extern "C" ObjectU5BU5D_t162* List_1_ToArray_m11374_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_ToArray_m11374(__this, method) (( ObjectU5BU5D_t162* (*) (List_1_t706 *, const MethodInfo*))List_1_ToArray_m11374_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Object>::TrimExcess()
extern "C" void List_1_TrimExcess_m11376_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_TrimExcess_m11376(__this, method) (( void (*) (List_1_t706 *, const MethodInfo*))List_1_TrimExcess_m11376_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<System.Object>::get_Capacity()
extern "C" int32_t List_1_get_Capacity_m11378_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_get_Capacity_m11378(__this, method) (( int32_t (*) (List_1_t706 *, const MethodInfo*))List_1_get_Capacity_m11378_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Object>::set_Capacity(System.Int32)
extern "C" void List_1_set_Capacity_m11380_gshared (List_1_t706 * __this, int32_t ___value, const MethodInfo* method);
#define List_1_set_Capacity_m11380(__this, ___value, method) (( void (*) (List_1_t706 *, int32_t, const MethodInfo*))List_1_set_Capacity_m11380_gshared)(__this, ___value, method)
// System.Int32 System.Collections.Generic.List`1<System.Object>::get_Count()
extern "C" int32_t List_1_get_Count_m11382_gshared (List_1_t706 * __this, const MethodInfo* method);
#define List_1_get_Count_m11382(__this, method) (( int32_t (*) (List_1_t706 *, const MethodInfo*))List_1_get_Count_m11382_gshared)(__this, method)
// T System.Collections.Generic.List`1<System.Object>::get_Item(System.Int32)
extern "C" Object_t * List_1_get_Item_m11384_gshared (List_1_t706 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_get_Item_m11384(__this, ___index, method) (( Object_t * (*) (List_1_t706 *, int32_t, const MethodInfo*))List_1_get_Item_m11384_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Object>::set_Item(System.Int32,T)
extern "C" void List_1_set_Item_m11386_gshared (List_1_t706 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define List_1_set_Item_m11386(__this, ___index, ___value, method) (( void (*) (List_1_t706 *, int32_t, Object_t *, const MethodInfo*))List_1_set_Item_m11386_gshared)(__this, ___index, ___value, method)

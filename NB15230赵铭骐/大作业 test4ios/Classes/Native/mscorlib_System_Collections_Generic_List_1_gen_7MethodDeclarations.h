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

// System.Collections.Generic.List`1<System.Int32>
struct List_1_t419;
// System.Collections.Generic.IEnumerable`1<System.Int32>
struct IEnumerable_1_t2449;
// System.Collections.Generic.IEnumerator`1<System.Int32>
struct IEnumerator_1_t2450;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Object
struct Object_t;
// System.Collections.Generic.ICollection`1<System.Int32>
struct ICollection_1_t2451;
// System.Collections.ObjectModel.ReadOnlyCollection`1<System.Int32>
struct ReadOnlyCollection_1_t1970;
// System.Int32[]
struct Int32U5BU5D_t420;
// System.Predicate`1<System.Int32>
struct Predicate_1_t1976;
// System.Comparison`1<System.Int32>
struct Comparison_1_t1980;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Collections_Generic_List_1_Enumerator_gen_9.h"

// System.Void System.Collections.Generic.List`1<System.Int32>::.ctor()
extern "C" void List_1__ctor_m12512_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1__ctor_m12512(__this, method) (( void (*) (List_1_t419 *, const MethodInfo*))List_1__ctor_m12512_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::.ctor(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1__ctor_m12513_gshared (List_1_t419 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1__ctor_m12513(__this, ___collection, method) (( void (*) (List_1_t419 *, Object_t*, const MethodInfo*))List_1__ctor_m12513_gshared)(__this, ___collection, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::.ctor(System.Int32)
extern "C" void List_1__ctor_m12514_gshared (List_1_t419 * __this, int32_t ___capacity, const MethodInfo* method);
#define List_1__ctor_m12514(__this, ___capacity, method) (( void (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1__ctor_m12514_gshared)(__this, ___capacity, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::.cctor()
extern "C" void List_1__cctor_m12515_gshared (Object_t * __this /* static, unused */, const MethodInfo* method);
#define List_1__cctor_m12515(__this /* static, unused */, method) (( void (*) (Object_t * /* static, unused */, const MethodInfo*))List_1__cctor_m12515_gshared)(__this /* static, unused */, method)
// System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.List`1<System.Int32>::System.Collections.Generic.IEnumerable<T>.GetEnumerator()
extern "C" Object_t* List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m12516_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m12516(__this, method) (( Object_t* (*) (List_1_t419 *, const MethodInfo*))List_1_System_Collections_Generic_IEnumerableU3CTU3E_GetEnumerator_m12516_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
extern "C" void List_1_System_Collections_ICollection_CopyTo_m12517_gshared (List_1_t419 * __this, Array_t * ___array, int32_t ___arrayIndex, const MethodInfo* method);
#define List_1_System_Collections_ICollection_CopyTo_m12517(__this, ___array, ___arrayIndex, method) (( void (*) (List_1_t419 *, Array_t *, int32_t, const MethodInfo*))List_1_System_Collections_ICollection_CopyTo_m12517_gshared)(__this, ___array, ___arrayIndex, method)
// System.Collections.IEnumerator System.Collections.Generic.List`1<System.Int32>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * List_1_System_Collections_IEnumerable_GetEnumerator_m12518_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_System_Collections_IEnumerable_GetEnumerator_m12518(__this, method) (( Object_t * (*) (List_1_t419 *, const MethodInfo*))List_1_System_Collections_IEnumerable_GetEnumerator_m12518_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.Add(System.Object)
extern "C" int32_t List_1_System_Collections_IList_Add_m12519_gshared (List_1_t419 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Add_m12519(__this, ___item, method) (( int32_t (*) (List_1_t419 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Add_m12519_gshared)(__this, ___item, method)
// System.Boolean System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.Contains(System.Object)
extern "C" bool List_1_System_Collections_IList_Contains_m12520_gshared (List_1_t419 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Contains_m12520(__this, ___item, method) (( bool (*) (List_1_t419 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Contains_m12520_gshared)(__this, ___item, method)
// System.Int32 System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.IndexOf(System.Object)
extern "C" int32_t List_1_System_Collections_IList_IndexOf_m12521_gshared (List_1_t419 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_IndexOf_m12521(__this, ___item, method) (( int32_t (*) (List_1_t419 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_IndexOf_m12521_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.Insert(System.Int32,System.Object)
extern "C" void List_1_System_Collections_IList_Insert_m12522_gshared (List_1_t419 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Insert_m12522(__this, ___index, ___item, method) (( void (*) (List_1_t419 *, int32_t, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Insert_m12522_gshared)(__this, ___index, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.Remove(System.Object)
extern "C" void List_1_System_Collections_IList_Remove_m12523_gshared (List_1_t419 * __this, Object_t * ___item, const MethodInfo* method);
#define List_1_System_Collections_IList_Remove_m12523(__this, ___item, method) (( void (*) (List_1_t419 *, Object_t *, const MethodInfo*))List_1_System_Collections_IList_Remove_m12523_gshared)(__this, ___item, method)
// System.Boolean System.Collections.Generic.List`1<System.Int32>::System.Collections.Generic.ICollection<T>.get_IsReadOnly()
extern "C" bool List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m12524_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m12524(__this, method) (( bool (*) (List_1_t419 *, const MethodInfo*))List_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m12524_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Int32>::System.Collections.ICollection.get_IsSynchronized()
extern "C" bool List_1_System_Collections_ICollection_get_IsSynchronized_m12525_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_System_Collections_ICollection_get_IsSynchronized_m12525(__this, method) (( bool (*) (List_1_t419 *, const MethodInfo*))List_1_System_Collections_ICollection_get_IsSynchronized_m12525_gshared)(__this, method)
// System.Object System.Collections.Generic.List`1<System.Int32>::System.Collections.ICollection.get_SyncRoot()
extern "C" Object_t * List_1_System_Collections_ICollection_get_SyncRoot_m12526_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_System_Collections_ICollection_get_SyncRoot_m12526(__this, method) (( Object_t * (*) (List_1_t419 *, const MethodInfo*))List_1_System_Collections_ICollection_get_SyncRoot_m12526_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.get_IsFixedSize()
extern "C" bool List_1_System_Collections_IList_get_IsFixedSize_m12527_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_System_Collections_IList_get_IsFixedSize_m12527(__this, method) (( bool (*) (List_1_t419 *, const MethodInfo*))List_1_System_Collections_IList_get_IsFixedSize_m12527_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.get_IsReadOnly()
extern "C" bool List_1_System_Collections_IList_get_IsReadOnly_m12528_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_System_Collections_IList_get_IsReadOnly_m12528(__this, method) (( bool (*) (List_1_t419 *, const MethodInfo*))List_1_System_Collections_IList_get_IsReadOnly_m12528_gshared)(__this, method)
// System.Object System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.get_Item(System.Int32)
extern "C" Object_t * List_1_System_Collections_IList_get_Item_m12529_gshared (List_1_t419 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_System_Collections_IList_get_Item_m12529(__this, ___index, method) (( Object_t * (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_System_Collections_IList_get_Item_m12529_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::System.Collections.IList.set_Item(System.Int32,System.Object)
extern "C" void List_1_System_Collections_IList_set_Item_m12530_gshared (List_1_t419 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define List_1_System_Collections_IList_set_Item_m12530(__this, ___index, ___value, method) (( void (*) (List_1_t419 *, int32_t, Object_t *, const MethodInfo*))List_1_System_Collections_IList_set_Item_m12530_gshared)(__this, ___index, ___value, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::Add(T)
extern "C" void List_1_Add_m12531_gshared (List_1_t419 * __this, int32_t ___item, const MethodInfo* method);
#define List_1_Add_m12531(__this, ___item, method) (( void (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_Add_m12531_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::GrowIfNeeded(System.Int32)
extern "C" void List_1_GrowIfNeeded_m12532_gshared (List_1_t419 * __this, int32_t ___newCount, const MethodInfo* method);
#define List_1_GrowIfNeeded_m12532(__this, ___newCount, method) (( void (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_GrowIfNeeded_m12532_gshared)(__this, ___newCount, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::AddCollection(System.Collections.Generic.ICollection`1<T>)
extern "C" void List_1_AddCollection_m12533_gshared (List_1_t419 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_AddCollection_m12533(__this, ___collection, method) (( void (*) (List_1_t419 *, Object_t*, const MethodInfo*))List_1_AddCollection_m12533_gshared)(__this, ___collection, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::AddEnumerable(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_AddEnumerable_m12534_gshared (List_1_t419 * __this, Object_t* ___enumerable, const MethodInfo* method);
#define List_1_AddEnumerable_m12534(__this, ___enumerable, method) (( void (*) (List_1_t419 *, Object_t*, const MethodInfo*))List_1_AddEnumerable_m12534_gshared)(__this, ___enumerable, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::AddRange(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_AddRange_m3682_gshared (List_1_t419 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_AddRange_m3682(__this, ___collection, method) (( void (*) (List_1_t419 *, Object_t*, const MethodInfo*))List_1_AddRange_m3682_gshared)(__this, ___collection, method)
// System.Collections.ObjectModel.ReadOnlyCollection`1<T> System.Collections.Generic.List`1<System.Int32>::AsReadOnly()
extern "C" ReadOnlyCollection_1_t1970 * List_1_AsReadOnly_m12535_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_AsReadOnly_m12535(__this, method) (( ReadOnlyCollection_1_t1970 * (*) (List_1_t419 *, const MethodInfo*))List_1_AsReadOnly_m12535_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::Clear()
extern "C" void List_1_Clear_m12536_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_Clear_m12536(__this, method) (( void (*) (List_1_t419 *, const MethodInfo*))List_1_Clear_m12536_gshared)(__this, method)
// System.Boolean System.Collections.Generic.List`1<System.Int32>::Contains(T)
extern "C" bool List_1_Contains_m12537_gshared (List_1_t419 * __this, int32_t ___item, const MethodInfo* method);
#define List_1_Contains_m12537(__this, ___item, method) (( bool (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_Contains_m12537_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::CopyTo(T[],System.Int32)
extern "C" void List_1_CopyTo_m12538_gshared (List_1_t419 * __this, Int32U5BU5D_t420* ___array, int32_t ___arrayIndex, const MethodInfo* method);
#define List_1_CopyTo_m12538(__this, ___array, ___arrayIndex, method) (( void (*) (List_1_t419 *, Int32U5BU5D_t420*, int32_t, const MethodInfo*))List_1_CopyTo_m12538_gshared)(__this, ___array, ___arrayIndex, method)
// T System.Collections.Generic.List`1<System.Int32>::Find(System.Predicate`1<T>)
extern "C" int32_t List_1_Find_m12539_gshared (List_1_t419 * __this, Predicate_1_t1976 * ___match, const MethodInfo* method);
#define List_1_Find_m12539(__this, ___match, method) (( int32_t (*) (List_1_t419 *, Predicate_1_t1976 *, const MethodInfo*))List_1_Find_m12539_gshared)(__this, ___match, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::CheckMatch(System.Predicate`1<T>)
extern "C" void List_1_CheckMatch_m12540_gshared (Object_t * __this /* static, unused */, Predicate_1_t1976 * ___match, const MethodInfo* method);
#define List_1_CheckMatch_m12540(__this /* static, unused */, ___match, method) (( void (*) (Object_t * /* static, unused */, Predicate_1_t1976 *, const MethodInfo*))List_1_CheckMatch_m12540_gshared)(__this /* static, unused */, ___match, method)
// System.Int32 System.Collections.Generic.List`1<System.Int32>::GetIndex(System.Int32,System.Int32,System.Predicate`1<T>)
extern "C" int32_t List_1_GetIndex_m12541_gshared (List_1_t419 * __this, int32_t ___startIndex, int32_t ___count, Predicate_1_t1976 * ___match, const MethodInfo* method);
#define List_1_GetIndex_m12541(__this, ___startIndex, ___count, ___match, method) (( int32_t (*) (List_1_t419 *, int32_t, int32_t, Predicate_1_t1976 *, const MethodInfo*))List_1_GetIndex_m12541_gshared)(__this, ___startIndex, ___count, ___match, method)
// System.Collections.Generic.List`1/Enumerator<T> System.Collections.Generic.List`1<System.Int32>::GetEnumerator()
extern "C" Enumerator_t1969  List_1_GetEnumerator_m12542_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_GetEnumerator_m12542(__this, method) (( Enumerator_t1969  (*) (List_1_t419 *, const MethodInfo*))List_1_GetEnumerator_m12542_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<System.Int32>::IndexOf(T)
extern "C" int32_t List_1_IndexOf_m12543_gshared (List_1_t419 * __this, int32_t ___item, const MethodInfo* method);
#define List_1_IndexOf_m12543(__this, ___item, method) (( int32_t (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_IndexOf_m12543_gshared)(__this, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::Shift(System.Int32,System.Int32)
extern "C" void List_1_Shift_m12544_gshared (List_1_t419 * __this, int32_t ___start, int32_t ___delta, const MethodInfo* method);
#define List_1_Shift_m12544(__this, ___start, ___delta, method) (( void (*) (List_1_t419 *, int32_t, int32_t, const MethodInfo*))List_1_Shift_m12544_gshared)(__this, ___start, ___delta, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::CheckIndex(System.Int32)
extern "C" void List_1_CheckIndex_m12545_gshared (List_1_t419 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_CheckIndex_m12545(__this, ___index, method) (( void (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_CheckIndex_m12545_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::Insert(System.Int32,T)
extern "C" void List_1_Insert_m12546_gshared (List_1_t419 * __this, int32_t ___index, int32_t ___item, const MethodInfo* method);
#define List_1_Insert_m12546(__this, ___index, ___item, method) (( void (*) (List_1_t419 *, int32_t, int32_t, const MethodInfo*))List_1_Insert_m12546_gshared)(__this, ___index, ___item, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::CheckCollection(System.Collections.Generic.IEnumerable`1<T>)
extern "C" void List_1_CheckCollection_m12547_gshared (List_1_t419 * __this, Object_t* ___collection, const MethodInfo* method);
#define List_1_CheckCollection_m12547(__this, ___collection, method) (( void (*) (List_1_t419 *, Object_t*, const MethodInfo*))List_1_CheckCollection_m12547_gshared)(__this, ___collection, method)
// System.Boolean System.Collections.Generic.List`1<System.Int32>::Remove(T)
extern "C" bool List_1_Remove_m12548_gshared (List_1_t419 * __this, int32_t ___item, const MethodInfo* method);
#define List_1_Remove_m12548(__this, ___item, method) (( bool (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_Remove_m12548_gshared)(__this, ___item, method)
// System.Int32 System.Collections.Generic.List`1<System.Int32>::RemoveAll(System.Predicate`1<T>)
extern "C" int32_t List_1_RemoveAll_m12549_gshared (List_1_t419 * __this, Predicate_1_t1976 * ___match, const MethodInfo* method);
#define List_1_RemoveAll_m12549(__this, ___match, method) (( int32_t (*) (List_1_t419 *, Predicate_1_t1976 *, const MethodInfo*))List_1_RemoveAll_m12549_gshared)(__this, ___match, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::RemoveAt(System.Int32)
extern "C" void List_1_RemoveAt_m12550_gshared (List_1_t419 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_RemoveAt_m12550(__this, ___index, method) (( void (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_RemoveAt_m12550_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::Reverse()
extern "C" void List_1_Reverse_m12551_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_Reverse_m12551(__this, method) (( void (*) (List_1_t419 *, const MethodInfo*))List_1_Reverse_m12551_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::Sort()
extern "C" void List_1_Sort_m12552_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_Sort_m12552(__this, method) (( void (*) (List_1_t419 *, const MethodInfo*))List_1_Sort_m12552_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::Sort(System.Comparison`1<T>)
extern "C" void List_1_Sort_m12553_gshared (List_1_t419 * __this, Comparison_1_t1980 * ___comparison, const MethodInfo* method);
#define List_1_Sort_m12553(__this, ___comparison, method) (( void (*) (List_1_t419 *, Comparison_1_t1980 *, const MethodInfo*))List_1_Sort_m12553_gshared)(__this, ___comparison, method)
// T[] System.Collections.Generic.List`1<System.Int32>::ToArray()
extern "C" Int32U5BU5D_t420* List_1_ToArray_m12554_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_ToArray_m12554(__this, method) (( Int32U5BU5D_t420* (*) (List_1_t419 *, const MethodInfo*))List_1_ToArray_m12554_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::TrimExcess()
extern "C" void List_1_TrimExcess_m12555_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_TrimExcess_m12555(__this, method) (( void (*) (List_1_t419 *, const MethodInfo*))List_1_TrimExcess_m12555_gshared)(__this, method)
// System.Int32 System.Collections.Generic.List`1<System.Int32>::get_Capacity()
extern "C" int32_t List_1_get_Capacity_m12556_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_get_Capacity_m12556(__this, method) (( int32_t (*) (List_1_t419 *, const MethodInfo*))List_1_get_Capacity_m12556_gshared)(__this, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::set_Capacity(System.Int32)
extern "C" void List_1_set_Capacity_m12557_gshared (List_1_t419 * __this, int32_t ___value, const MethodInfo* method);
#define List_1_set_Capacity_m12557(__this, ___value, method) (( void (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_set_Capacity_m12557_gshared)(__this, ___value, method)
// System.Int32 System.Collections.Generic.List`1<System.Int32>::get_Count()
extern "C" int32_t List_1_get_Count_m12558_gshared (List_1_t419 * __this, const MethodInfo* method);
#define List_1_get_Count_m12558(__this, method) (( int32_t (*) (List_1_t419 *, const MethodInfo*))List_1_get_Count_m12558_gshared)(__this, method)
// T System.Collections.Generic.List`1<System.Int32>::get_Item(System.Int32)
extern "C" int32_t List_1_get_Item_m12559_gshared (List_1_t419 * __this, int32_t ___index, const MethodInfo* method);
#define List_1_get_Item_m12559(__this, ___index, method) (( int32_t (*) (List_1_t419 *, int32_t, const MethodInfo*))List_1_get_Item_m12559_gshared)(__this, ___index, method)
// System.Void System.Collections.Generic.List`1<System.Int32>::set_Item(System.Int32,T)
extern "C" void List_1_set_Item_m12560_gshared (List_1_t419 * __this, int32_t ___index, int32_t ___value, const MethodInfo* method);
#define List_1_set_Item_m12560(__this, ___index, ___value, method) (( void (*) (List_1_t419 *, int32_t, int32_t, const MethodInfo*))List_1_set_Item_m12560_gshared)(__this, ___index, ___value, method)

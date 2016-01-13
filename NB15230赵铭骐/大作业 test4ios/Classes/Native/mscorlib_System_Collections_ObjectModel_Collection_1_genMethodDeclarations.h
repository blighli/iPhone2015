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

// System.Collections.ObjectModel.Collection`1<System.Object>
struct Collection_1_t1884;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Object
struct Object_t;
// System.Object[]
struct ObjectU5BU5D_t162;
// System.Collections.Generic.IEnumerator`1<System.Object>
struct IEnumerator_1_t2261;
// System.Collections.Generic.IList`1<System.Object>
struct IList_1_t1883;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::.ctor()
extern "C" void Collection_1__ctor_m11424_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1__ctor_m11424(__this, method) (( void (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1__ctor_m11424_gshared)(__this, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.Generic.ICollection<T>.get_IsReadOnly()
extern "C" bool Collection_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m11425_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m11425(__this, method) (( bool (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_System_Collections_Generic_ICollectionU3CTU3E_get_IsReadOnly_m11425_gshared)(__this, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.ICollection.CopyTo(System.Array,System.Int32)
extern "C" void Collection_1_System_Collections_ICollection_CopyTo_m11426_gshared (Collection_1_t1884 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method);
#define Collection_1_System_Collections_ICollection_CopyTo_m11426(__this, ___array, ___index, method) (( void (*) (Collection_1_t1884 *, Array_t *, int32_t, const MethodInfo*))Collection_1_System_Collections_ICollection_CopyTo_m11426_gshared)(__this, ___array, ___index, method)
// System.Collections.IEnumerator System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * Collection_1_System_Collections_IEnumerable_GetEnumerator_m11427_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_System_Collections_IEnumerable_GetEnumerator_m11427(__this, method) (( Object_t * (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_System_Collections_IEnumerable_GetEnumerator_m11427_gshared)(__this, method)
// System.Int32 System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.Add(System.Object)
extern "C" int32_t Collection_1_System_Collections_IList_Add_m11428_gshared (Collection_1_t1884 * __this, Object_t * ___value, const MethodInfo* method);
#define Collection_1_System_Collections_IList_Add_m11428(__this, ___value, method) (( int32_t (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_System_Collections_IList_Add_m11428_gshared)(__this, ___value, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.Contains(System.Object)
extern "C" bool Collection_1_System_Collections_IList_Contains_m11429_gshared (Collection_1_t1884 * __this, Object_t * ___value, const MethodInfo* method);
#define Collection_1_System_Collections_IList_Contains_m11429(__this, ___value, method) (( bool (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_System_Collections_IList_Contains_m11429_gshared)(__this, ___value, method)
// System.Int32 System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.IndexOf(System.Object)
extern "C" int32_t Collection_1_System_Collections_IList_IndexOf_m11430_gshared (Collection_1_t1884 * __this, Object_t * ___value, const MethodInfo* method);
#define Collection_1_System_Collections_IList_IndexOf_m11430(__this, ___value, method) (( int32_t (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_System_Collections_IList_IndexOf_m11430_gshared)(__this, ___value, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.Insert(System.Int32,System.Object)
extern "C" void Collection_1_System_Collections_IList_Insert_m11431_gshared (Collection_1_t1884 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define Collection_1_System_Collections_IList_Insert_m11431(__this, ___index, ___value, method) (( void (*) (Collection_1_t1884 *, int32_t, Object_t *, const MethodInfo*))Collection_1_System_Collections_IList_Insert_m11431_gshared)(__this, ___index, ___value, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.Remove(System.Object)
extern "C" void Collection_1_System_Collections_IList_Remove_m11432_gshared (Collection_1_t1884 * __this, Object_t * ___value, const MethodInfo* method);
#define Collection_1_System_Collections_IList_Remove_m11432(__this, ___value, method) (( void (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_System_Collections_IList_Remove_m11432_gshared)(__this, ___value, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.ICollection.get_IsSynchronized()
extern "C" bool Collection_1_System_Collections_ICollection_get_IsSynchronized_m11433_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_System_Collections_ICollection_get_IsSynchronized_m11433(__this, method) (( bool (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_System_Collections_ICollection_get_IsSynchronized_m11433_gshared)(__this, method)
// System.Object System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.ICollection.get_SyncRoot()
extern "C" Object_t * Collection_1_System_Collections_ICollection_get_SyncRoot_m11434_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_System_Collections_ICollection_get_SyncRoot_m11434(__this, method) (( Object_t * (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_System_Collections_ICollection_get_SyncRoot_m11434_gshared)(__this, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.get_IsFixedSize()
extern "C" bool Collection_1_System_Collections_IList_get_IsFixedSize_m11435_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_System_Collections_IList_get_IsFixedSize_m11435(__this, method) (( bool (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_System_Collections_IList_get_IsFixedSize_m11435_gshared)(__this, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.get_IsReadOnly()
extern "C" bool Collection_1_System_Collections_IList_get_IsReadOnly_m11436_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_System_Collections_IList_get_IsReadOnly_m11436(__this, method) (( bool (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_System_Collections_IList_get_IsReadOnly_m11436_gshared)(__this, method)
// System.Object System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.get_Item(System.Int32)
extern "C" Object_t * Collection_1_System_Collections_IList_get_Item_m11437_gshared (Collection_1_t1884 * __this, int32_t ___index, const MethodInfo* method);
#define Collection_1_System_Collections_IList_get_Item_m11437(__this, ___index, method) (( Object_t * (*) (Collection_1_t1884 *, int32_t, const MethodInfo*))Collection_1_System_Collections_IList_get_Item_m11437_gshared)(__this, ___index, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::System.Collections.IList.set_Item(System.Int32,System.Object)
extern "C" void Collection_1_System_Collections_IList_set_Item_m11438_gshared (Collection_1_t1884 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define Collection_1_System_Collections_IList_set_Item_m11438(__this, ___index, ___value, method) (( void (*) (Collection_1_t1884 *, int32_t, Object_t *, const MethodInfo*))Collection_1_System_Collections_IList_set_Item_m11438_gshared)(__this, ___index, ___value, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::Add(T)
extern "C" void Collection_1_Add_m11439_gshared (Collection_1_t1884 * __this, Object_t * ___item, const MethodInfo* method);
#define Collection_1_Add_m11439(__this, ___item, method) (( void (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_Add_m11439_gshared)(__this, ___item, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::Clear()
extern "C" void Collection_1_Clear_m11440_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_Clear_m11440(__this, method) (( void (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_Clear_m11440_gshared)(__this, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::ClearItems()
extern "C" void Collection_1_ClearItems_m11441_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_ClearItems_m11441(__this, method) (( void (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_ClearItems_m11441_gshared)(__this, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::Contains(T)
extern "C" bool Collection_1_Contains_m11442_gshared (Collection_1_t1884 * __this, Object_t * ___item, const MethodInfo* method);
#define Collection_1_Contains_m11442(__this, ___item, method) (( bool (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_Contains_m11442_gshared)(__this, ___item, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::CopyTo(T[],System.Int32)
extern "C" void Collection_1_CopyTo_m11443_gshared (Collection_1_t1884 * __this, ObjectU5BU5D_t162* ___array, int32_t ___index, const MethodInfo* method);
#define Collection_1_CopyTo_m11443(__this, ___array, ___index, method) (( void (*) (Collection_1_t1884 *, ObjectU5BU5D_t162*, int32_t, const MethodInfo*))Collection_1_CopyTo_m11443_gshared)(__this, ___array, ___index, method)
// System.Collections.Generic.IEnumerator`1<T> System.Collections.ObjectModel.Collection`1<System.Object>::GetEnumerator()
extern "C" Object_t* Collection_1_GetEnumerator_m11444_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_GetEnumerator_m11444(__this, method) (( Object_t* (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_GetEnumerator_m11444_gshared)(__this, method)
// System.Int32 System.Collections.ObjectModel.Collection`1<System.Object>::IndexOf(T)
extern "C" int32_t Collection_1_IndexOf_m11445_gshared (Collection_1_t1884 * __this, Object_t * ___item, const MethodInfo* method);
#define Collection_1_IndexOf_m11445(__this, ___item, method) (( int32_t (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_IndexOf_m11445_gshared)(__this, ___item, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::Insert(System.Int32,T)
extern "C" void Collection_1_Insert_m11446_gshared (Collection_1_t1884 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define Collection_1_Insert_m11446(__this, ___index, ___item, method) (( void (*) (Collection_1_t1884 *, int32_t, Object_t *, const MethodInfo*))Collection_1_Insert_m11446_gshared)(__this, ___index, ___item, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::InsertItem(System.Int32,T)
extern "C" void Collection_1_InsertItem_m11447_gshared (Collection_1_t1884 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define Collection_1_InsertItem_m11447(__this, ___index, ___item, method) (( void (*) (Collection_1_t1884 *, int32_t, Object_t *, const MethodInfo*))Collection_1_InsertItem_m11447_gshared)(__this, ___index, ___item, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::Remove(T)
extern "C" bool Collection_1_Remove_m11448_gshared (Collection_1_t1884 * __this, Object_t * ___item, const MethodInfo* method);
#define Collection_1_Remove_m11448(__this, ___item, method) (( bool (*) (Collection_1_t1884 *, Object_t *, const MethodInfo*))Collection_1_Remove_m11448_gshared)(__this, ___item, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::RemoveAt(System.Int32)
extern "C" void Collection_1_RemoveAt_m11449_gshared (Collection_1_t1884 * __this, int32_t ___index, const MethodInfo* method);
#define Collection_1_RemoveAt_m11449(__this, ___index, method) (( void (*) (Collection_1_t1884 *, int32_t, const MethodInfo*))Collection_1_RemoveAt_m11449_gshared)(__this, ___index, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::RemoveItem(System.Int32)
extern "C" void Collection_1_RemoveItem_m11450_gshared (Collection_1_t1884 * __this, int32_t ___index, const MethodInfo* method);
#define Collection_1_RemoveItem_m11450(__this, ___index, method) (( void (*) (Collection_1_t1884 *, int32_t, const MethodInfo*))Collection_1_RemoveItem_m11450_gshared)(__this, ___index, method)
// System.Int32 System.Collections.ObjectModel.Collection`1<System.Object>::get_Count()
extern "C" int32_t Collection_1_get_Count_m11451_gshared (Collection_1_t1884 * __this, const MethodInfo* method);
#define Collection_1_get_Count_m11451(__this, method) (( int32_t (*) (Collection_1_t1884 *, const MethodInfo*))Collection_1_get_Count_m11451_gshared)(__this, method)
// T System.Collections.ObjectModel.Collection`1<System.Object>::get_Item(System.Int32)
extern "C" Object_t * Collection_1_get_Item_m11452_gshared (Collection_1_t1884 * __this, int32_t ___index, const MethodInfo* method);
#define Collection_1_get_Item_m11452(__this, ___index, method) (( Object_t * (*) (Collection_1_t1884 *, int32_t, const MethodInfo*))Collection_1_get_Item_m11452_gshared)(__this, ___index, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::set_Item(System.Int32,T)
extern "C" void Collection_1_set_Item_m11453_gshared (Collection_1_t1884 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define Collection_1_set_Item_m11453(__this, ___index, ___value, method) (( void (*) (Collection_1_t1884 *, int32_t, Object_t *, const MethodInfo*))Collection_1_set_Item_m11453_gshared)(__this, ___index, ___value, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::SetItem(System.Int32,T)
extern "C" void Collection_1_SetItem_m11454_gshared (Collection_1_t1884 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define Collection_1_SetItem_m11454(__this, ___index, ___item, method) (( void (*) (Collection_1_t1884 *, int32_t, Object_t *, const MethodInfo*))Collection_1_SetItem_m11454_gshared)(__this, ___index, ___item, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::IsValidItem(System.Object)
extern "C" bool Collection_1_IsValidItem_m11455_gshared (Object_t * __this /* static, unused */, Object_t * ___item, const MethodInfo* method);
#define Collection_1_IsValidItem_m11455(__this /* static, unused */, ___item, method) (( bool (*) (Object_t * /* static, unused */, Object_t *, const MethodInfo*))Collection_1_IsValidItem_m11455_gshared)(__this /* static, unused */, ___item, method)
// T System.Collections.ObjectModel.Collection`1<System.Object>::ConvertItem(System.Object)
extern "C" Object_t * Collection_1_ConvertItem_m11456_gshared (Object_t * __this /* static, unused */, Object_t * ___item, const MethodInfo* method);
#define Collection_1_ConvertItem_m11456(__this /* static, unused */, ___item, method) (( Object_t * (*) (Object_t * /* static, unused */, Object_t *, const MethodInfo*))Collection_1_ConvertItem_m11456_gshared)(__this /* static, unused */, ___item, method)
// System.Void System.Collections.ObjectModel.Collection`1<System.Object>::CheckWritable(System.Collections.Generic.IList`1<T>)
extern "C" void Collection_1_CheckWritable_m11457_gshared (Object_t * __this /* static, unused */, Object_t* ___list, const MethodInfo* method);
#define Collection_1_CheckWritable_m11457(__this /* static, unused */, ___list, method) (( void (*) (Object_t * /* static, unused */, Object_t*, const MethodInfo*))Collection_1_CheckWritable_m11457_gshared)(__this /* static, unused */, ___list, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::IsSynchronized(System.Collections.Generic.IList`1<T>)
extern "C" bool Collection_1_IsSynchronized_m11458_gshared (Object_t * __this /* static, unused */, Object_t* ___list, const MethodInfo* method);
#define Collection_1_IsSynchronized_m11458(__this /* static, unused */, ___list, method) (( bool (*) (Object_t * /* static, unused */, Object_t*, const MethodInfo*))Collection_1_IsSynchronized_m11458_gshared)(__this /* static, unused */, ___list, method)
// System.Boolean System.Collections.ObjectModel.Collection`1<System.Object>::IsFixedSize(System.Collections.Generic.IList`1<T>)
extern "C" bool Collection_1_IsFixedSize_m11459_gshared (Object_t * __this /* static, unused */, Object_t* ___list, const MethodInfo* method);
#define Collection_1_IsFixedSize_m11459(__this /* static, unused */, ___list, method) (( bool (*) (Object_t * /* static, unused */, Object_t*, const MethodInfo*))Collection_1_IsFixedSize_m11459_gshared)(__this /* static, unused */, ___list, method)

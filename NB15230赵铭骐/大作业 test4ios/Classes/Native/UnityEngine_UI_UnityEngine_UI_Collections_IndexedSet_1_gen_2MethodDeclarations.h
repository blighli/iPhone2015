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

// UnityEngine.UI.Collections.IndexedSet`1<System.Object>
struct IndexedSet_1_t2163;
// System.Collections.IEnumerator
struct IEnumerator_t133;
// System.Object
struct Object_t;
// System.Collections.Generic.IEnumerator`1<System.Object>
struct IEnumerator_1_t2261;
// System.Object[]
struct ObjectU5BU5D_t162;
// System.Comparison`1<System.Object>
struct Comparison_1_t1890;

#include "codegen/il2cpp-codegen.h"

// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::.ctor()
extern "C" void IndexedSet_1__ctor_m14998_gshared (IndexedSet_1_t2163 * __this, const MethodInfo* method);
#define IndexedSet_1__ctor_m14998(__this, method) (( void (*) (IndexedSet_1_t2163 *, const MethodInfo*))IndexedSet_1__ctor_m14998_gshared)(__this, method)
// System.Collections.IEnumerator UnityEngine.UI.Collections.IndexedSet`1<System.Object>::System.Collections.IEnumerable.GetEnumerator()
extern "C" Object_t * IndexedSet_1_System_Collections_IEnumerable_GetEnumerator_m15000_gshared (IndexedSet_1_t2163 * __this, const MethodInfo* method);
#define IndexedSet_1_System_Collections_IEnumerable_GetEnumerator_m15000(__this, method) (( Object_t * (*) (IndexedSet_1_t2163 *, const MethodInfo*))IndexedSet_1_System_Collections_IEnumerable_GetEnumerator_m15000_gshared)(__this, method)
// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::Add(T)
extern "C" void IndexedSet_1_Add_m15002_gshared (IndexedSet_1_t2163 * __this, Object_t * ___item, const MethodInfo* method);
#define IndexedSet_1_Add_m15002(__this, ___item, method) (( void (*) (IndexedSet_1_t2163 *, Object_t *, const MethodInfo*))IndexedSet_1_Add_m15002_gshared)(__this, ___item, method)
// System.Boolean UnityEngine.UI.Collections.IndexedSet`1<System.Object>::Remove(T)
extern "C" bool IndexedSet_1_Remove_m15004_gshared (IndexedSet_1_t2163 * __this, Object_t * ___item, const MethodInfo* method);
#define IndexedSet_1_Remove_m15004(__this, ___item, method) (( bool (*) (IndexedSet_1_t2163 *, Object_t *, const MethodInfo*))IndexedSet_1_Remove_m15004_gshared)(__this, ___item, method)
// System.Collections.Generic.IEnumerator`1<T> UnityEngine.UI.Collections.IndexedSet`1<System.Object>::GetEnumerator()
extern "C" Object_t* IndexedSet_1_GetEnumerator_m15006_gshared (IndexedSet_1_t2163 * __this, const MethodInfo* method);
#define IndexedSet_1_GetEnumerator_m15006(__this, method) (( Object_t* (*) (IndexedSet_1_t2163 *, const MethodInfo*))IndexedSet_1_GetEnumerator_m15006_gshared)(__this, method)
// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::Clear()
extern "C" void IndexedSet_1_Clear_m15008_gshared (IndexedSet_1_t2163 * __this, const MethodInfo* method);
#define IndexedSet_1_Clear_m15008(__this, method) (( void (*) (IndexedSet_1_t2163 *, const MethodInfo*))IndexedSet_1_Clear_m15008_gshared)(__this, method)
// System.Boolean UnityEngine.UI.Collections.IndexedSet`1<System.Object>::Contains(T)
extern "C" bool IndexedSet_1_Contains_m15010_gshared (IndexedSet_1_t2163 * __this, Object_t * ___item, const MethodInfo* method);
#define IndexedSet_1_Contains_m15010(__this, ___item, method) (( bool (*) (IndexedSet_1_t2163 *, Object_t *, const MethodInfo*))IndexedSet_1_Contains_m15010_gshared)(__this, ___item, method)
// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::CopyTo(T[],System.Int32)
extern "C" void IndexedSet_1_CopyTo_m15012_gshared (IndexedSet_1_t2163 * __this, ObjectU5BU5D_t162* ___array, int32_t ___arrayIndex, const MethodInfo* method);
#define IndexedSet_1_CopyTo_m15012(__this, ___array, ___arrayIndex, method) (( void (*) (IndexedSet_1_t2163 *, ObjectU5BU5D_t162*, int32_t, const MethodInfo*))IndexedSet_1_CopyTo_m15012_gshared)(__this, ___array, ___arrayIndex, method)
// System.Int32 UnityEngine.UI.Collections.IndexedSet`1<System.Object>::get_Count()
extern "C" int32_t IndexedSet_1_get_Count_m15014_gshared (IndexedSet_1_t2163 * __this, const MethodInfo* method);
#define IndexedSet_1_get_Count_m15014(__this, method) (( int32_t (*) (IndexedSet_1_t2163 *, const MethodInfo*))IndexedSet_1_get_Count_m15014_gshared)(__this, method)
// System.Boolean UnityEngine.UI.Collections.IndexedSet`1<System.Object>::get_IsReadOnly()
extern "C" bool IndexedSet_1_get_IsReadOnly_m15016_gshared (IndexedSet_1_t2163 * __this, const MethodInfo* method);
#define IndexedSet_1_get_IsReadOnly_m15016(__this, method) (( bool (*) (IndexedSet_1_t2163 *, const MethodInfo*))IndexedSet_1_get_IsReadOnly_m15016_gshared)(__this, method)
// System.Int32 UnityEngine.UI.Collections.IndexedSet`1<System.Object>::IndexOf(T)
extern "C" int32_t IndexedSet_1_IndexOf_m15018_gshared (IndexedSet_1_t2163 * __this, Object_t * ___item, const MethodInfo* method);
#define IndexedSet_1_IndexOf_m15018(__this, ___item, method) (( int32_t (*) (IndexedSet_1_t2163 *, Object_t *, const MethodInfo*))IndexedSet_1_IndexOf_m15018_gshared)(__this, ___item, method)
// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::Insert(System.Int32,T)
extern "C" void IndexedSet_1_Insert_m15020_gshared (IndexedSet_1_t2163 * __this, int32_t ___index, Object_t * ___item, const MethodInfo* method);
#define IndexedSet_1_Insert_m15020(__this, ___index, ___item, method) (( void (*) (IndexedSet_1_t2163 *, int32_t, Object_t *, const MethodInfo*))IndexedSet_1_Insert_m15020_gshared)(__this, ___index, ___item, method)
// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::RemoveAt(System.Int32)
extern "C" void IndexedSet_1_RemoveAt_m15022_gshared (IndexedSet_1_t2163 * __this, int32_t ___index, const MethodInfo* method);
#define IndexedSet_1_RemoveAt_m15022(__this, ___index, method) (( void (*) (IndexedSet_1_t2163 *, int32_t, const MethodInfo*))IndexedSet_1_RemoveAt_m15022_gshared)(__this, ___index, method)
// T UnityEngine.UI.Collections.IndexedSet`1<System.Object>::get_Item(System.Int32)
extern "C" Object_t * IndexedSet_1_get_Item_m15024_gshared (IndexedSet_1_t2163 * __this, int32_t ___index, const MethodInfo* method);
#define IndexedSet_1_get_Item_m15024(__this, ___index, method) (( Object_t * (*) (IndexedSet_1_t2163 *, int32_t, const MethodInfo*))IndexedSet_1_get_Item_m15024_gshared)(__this, ___index, method)
// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::set_Item(System.Int32,T)
extern "C" void IndexedSet_1_set_Item_m15026_gshared (IndexedSet_1_t2163 * __this, int32_t ___index, Object_t * ___value, const MethodInfo* method);
#define IndexedSet_1_set_Item_m15026(__this, ___index, ___value, method) (( void (*) (IndexedSet_1_t2163 *, int32_t, Object_t *, const MethodInfo*))IndexedSet_1_set_Item_m15026_gshared)(__this, ___index, ___value, method)
// System.Void UnityEngine.UI.Collections.IndexedSet`1<System.Object>::Sort(System.Comparison`1<T>)
extern "C" void IndexedSet_1_Sort_m15027_gshared (IndexedSet_1_t2163 * __this, Comparison_1_t1890 * ___sortLayoutFunction, const MethodInfo* method);
#define IndexedSet_1_Sort_m15027(__this, ___sortLayoutFunction, method) (( void (*) (IndexedSet_1_t2163 *, Comparison_1_t1890 *, const MethodInfo*))IndexedSet_1_Sort_m15027_gshared)(__this, ___sortLayoutFunction, method)

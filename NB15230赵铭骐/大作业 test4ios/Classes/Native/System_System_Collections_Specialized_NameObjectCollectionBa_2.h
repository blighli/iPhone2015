#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.Hashtable
struct Hashtable_t725;
// System.Collections.Specialized.NameObjectCollectionBase/_Item
struct _Item_t730;
// System.Collections.ArrayList
struct ArrayList_t734;
// System.Collections.IHashCodeProvider
struct IHashCodeProvider_t735;
// System.Collections.IComparer
struct IComparer_t729;
// System.Runtime.Serialization.SerializationInfo
struct SerializationInfo_t433;
// System.Collections.Specialized.NameObjectCollectionBase/KeysCollection
struct KeysCollection_t733;
// System.Collections.IEqualityComparer
struct IEqualityComparer_t736;

#include "mscorlib_System_Object.h"

// System.Collections.Specialized.NameObjectCollectionBase
struct  NameObjectCollectionBase_t732  : public Object_t
{
	// System.Collections.Hashtable System.Collections.Specialized.NameObjectCollectionBase::m_ItemsContainer
	Hashtable_t725 * ___m_ItemsContainer_0;
	// System.Collections.Specialized.NameObjectCollectionBase/_Item System.Collections.Specialized.NameObjectCollectionBase::m_NullKeyItem
	_Item_t730 * ___m_NullKeyItem_1;
	// System.Collections.ArrayList System.Collections.Specialized.NameObjectCollectionBase::m_ItemsArray
	ArrayList_t734 * ___m_ItemsArray_2;
	// System.Collections.IHashCodeProvider System.Collections.Specialized.NameObjectCollectionBase::m_hashprovider
	Object_t * ___m_hashprovider_3;
	// System.Collections.IComparer System.Collections.Specialized.NameObjectCollectionBase::m_comparer
	Object_t * ___m_comparer_4;
	// System.Int32 System.Collections.Specialized.NameObjectCollectionBase::m_defCapacity
	int32_t ___m_defCapacity_5;
	// System.Boolean System.Collections.Specialized.NameObjectCollectionBase::m_readonly
	bool ___m_readonly_6;
	// System.Runtime.Serialization.SerializationInfo System.Collections.Specialized.NameObjectCollectionBase::infoCopy
	SerializationInfo_t433 * ___infoCopy_7;
	// System.Collections.Specialized.NameObjectCollectionBase/KeysCollection System.Collections.Specialized.NameObjectCollectionBase::keyscoll
	KeysCollection_t733 * ___keyscoll_8;
	// System.Collections.IEqualityComparer System.Collections.Specialized.NameObjectCollectionBase::equality_comparer
	Object_t * ___equality_comparer_9;
};

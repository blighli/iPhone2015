#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Int32[]
struct Int32U5BU5D_t420;
// System.Collections.Generic.Link[]
struct LinkU5BU5D_t1851;
// System.String[]
struct StringU5BU5D_t163;
// UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis[]
struct VirtualAxisU5BU5D_t1852;
// System.Collections.Generic.IEqualityComparer`1<System.String>
struct IEqualityComparer_1_t1854;
// System.Runtime.Serialization.SerializationInfo
struct SerializationInfo_t433;
// System.Collections.Generic.Dictionary`2/Transform`1<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis,System.Collections.DictionaryEntry>
struct Transform_1_t1853;

#include "mscorlib_System_Object.h"

// System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>
struct  Dictionary_2_t71  : public Object_t
{
	// System.Int32[] System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::table
	Int32U5BU5D_t420* ___table_4;
	// System.Collections.Generic.Link[] System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::linkSlots
	LinkU5BU5D_t1851* ___linkSlots_5;
	// TKey[] System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::keySlots
	StringU5BU5D_t163* ___keySlots_6;
	// TValue[] System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::valueSlots
	VirtualAxisU5BU5D_t1852* ___valueSlots_7;
	// System.Int32 System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::touchedSlots
	int32_t ___touchedSlots_8;
	// System.Int32 System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::emptySlot
	int32_t ___emptySlot_9;
	// System.Int32 System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::count
	int32_t ___count_10;
	// System.Int32 System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::threshold
	int32_t ___threshold_11;
	// System.Collections.Generic.IEqualityComparer`1<TKey> System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::hcp
	Object_t* ___hcp_12;
	// System.Runtime.Serialization.SerializationInfo System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::serialization_info
	SerializationInfo_t433 * ___serialization_info_13;
	// System.Int32 System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::generation
	int32_t ___generation_14;
};
struct Dictionary_2_t71_StaticFields{
	// System.Collections.Generic.Dictionary`2/Transform`1<TKey,TValue,System.Collections.DictionaryEntry> System.Collections.Generic.Dictionary`2<System.String,UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis>::<>f__am$cacheB
	Transform_1_t1853 * ___U3CU3Ef__amU24cacheB_15;
};

﻿#pragma once

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
// UnityEngine.UI.ICanvasElement[]
struct ICanvasElementU5BU5D_t2164;
// System.Collections.Generic.IEqualityComparer`1<UnityEngine.UI.ICanvasElement>
struct IEqualityComparer_1_t2166;
// System.Runtime.Serialization.SerializationInfo
struct SerializationInfo_t433;
// System.Collections.Generic.Dictionary`2/Transform`1<UnityEngine.UI.ICanvasElement,System.Int32,System.Collections.DictionaryEntry>
struct Transform_1_t2165;

#include "mscorlib_System_Object.h"

// System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>
struct  Dictionary_2_t700  : public Object_t
{
	// System.Int32[] System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::table
	Int32U5BU5D_t420* ___table_4;
	// System.Collections.Generic.Link[] System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::linkSlots
	LinkU5BU5D_t1851* ___linkSlots_5;
	// TKey[] System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::keySlots
	ICanvasElementU5BU5D_t2164* ___keySlots_6;
	// TValue[] System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::valueSlots
	Int32U5BU5D_t420* ___valueSlots_7;
	// System.Int32 System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::touchedSlots
	int32_t ___touchedSlots_8;
	// System.Int32 System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::emptySlot
	int32_t ___emptySlot_9;
	// System.Int32 System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::count
	int32_t ___count_10;
	// System.Int32 System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::threshold
	int32_t ___threshold_11;
	// System.Collections.Generic.IEqualityComparer`1<TKey> System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::hcp
	Object_t* ___hcp_12;
	// System.Runtime.Serialization.SerializationInfo System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::serialization_info
	SerializationInfo_t433 * ___serialization_info_13;
	// System.Int32 System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::generation
	int32_t ___generation_14;
};
struct Dictionary_2_t700_StaticFields{
	// System.Collections.Generic.Dictionary`2/Transform`1<TKey,TValue,System.Collections.DictionaryEntry> System.Collections.Generic.Dictionary`2<UnityEngine.UI.ICanvasElement,System.Int32>::<>f__am$cacheB
	Transform_1_t2165 * ___U3CU3Ef__amU24cacheB_15;
};

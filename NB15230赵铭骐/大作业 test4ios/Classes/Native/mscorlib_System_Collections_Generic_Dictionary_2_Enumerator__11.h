﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.Generic.Dictionary`2<System.Object,System.Boolean>
struct Dictionary_2_t2305;

#include "mscorlib_System_ValueType.h"
#include "mscorlib_System_Collections_Generic_KeyValuePair_2_gen_11.h"

// System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Boolean>
struct  Enumerator_t2312 
{
	// System.Collections.Generic.Dictionary`2<TKey,TValue> System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Boolean>::dictionary
	Dictionary_2_t2305 * ___dictionary_0;
	// System.Int32 System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Boolean>::next
	int32_t ___next_1;
	// System.Int32 System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Boolean>::stamp
	int32_t ___stamp_2;
	// System.Collections.Generic.KeyValuePair`2<TKey,TValue> System.Collections.Generic.Dictionary`2/Enumerator<System.Object,System.Boolean>::current
	KeyValuePair_2_t2307  ___current_3;
};

﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.Hashtable
struct Hashtable_t725;
// System.Object
struct Object_t;
// System.String
struct String_t;

#include "mscorlib_System_Object.h"
#include "mscorlib_System_Collections_Hashtable_EnumeratorMode.h"

// System.Collections.Hashtable/Enumerator
struct  Enumerator_t1227  : public Object_t
{
	// System.Collections.Hashtable System.Collections.Hashtable/Enumerator::host
	Hashtable_t725 * ___host_0;
	// System.Int32 System.Collections.Hashtable/Enumerator::stamp
	int32_t ___stamp_1;
	// System.Int32 System.Collections.Hashtable/Enumerator::pos
	int32_t ___pos_2;
	// System.Int32 System.Collections.Hashtable/Enumerator::size
	int32_t ___size_3;
	// System.Collections.Hashtable/EnumeratorMode System.Collections.Hashtable/Enumerator::mode
	int32_t ___mode_4;
	// System.Object System.Collections.Hashtable/Enumerator::currentKey
	Object_t * ___currentKey_5;
	// System.Object System.Collections.Hashtable/Enumerator::currentValue
	Object_t * ___currentValue_6;
};
struct Enumerator_t1227_StaticFields{
	// System.String System.Collections.Hashtable/Enumerator::xstr
	String_t* ___xstr_7;
};

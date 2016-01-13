﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.String
struct String_t;
// Mono.Globalization.Unicode.SimpleCollator
struct SimpleCollator_t1162;
// System.Collections.Hashtable
struct Hashtable_t725;
// System.Object
struct Object_t;

#include "mscorlib_System_Object.h"

// System.Globalization.CompareInfo
struct  CompareInfo_t1100  : public Object_t
{
	// System.Int32 System.Globalization.CompareInfo::culture
	int32_t ___culture_1;
	// System.String System.Globalization.CompareInfo::icu_name
	String_t* ___icu_name_2;
	// Mono.Globalization.Unicode.SimpleCollator System.Globalization.CompareInfo::collator
	SimpleCollator_t1162 * ___collator_3;
};
struct CompareInfo_t1100_StaticFields{
	// System.Boolean System.Globalization.CompareInfo::useManagedCollation
	bool ___useManagedCollation_0;
	// System.Collections.Hashtable System.Globalization.CompareInfo::collators
	Hashtable_t725 * ___collators_4;
	// System.Object System.Globalization.CompareInfo::monitor
	Object_t * ___monitor_5;
};

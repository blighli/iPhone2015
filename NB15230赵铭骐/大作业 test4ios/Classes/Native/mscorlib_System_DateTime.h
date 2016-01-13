﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.String[]
struct StringU5BU5D_t163;
// System.Int32[]
struct Int32U5BU5D_t420;
// System.Object
struct Object_t;

#include "mscorlib_System_ValueType.h"
#include "mscorlib_System_TimeSpan.h"
#include "mscorlib_System_DateTimeKind.h"
#include "mscorlib_System_DateTime.h"

// System.DateTime
struct  DateTime_t365 
{
	// System.TimeSpan System.DateTime::ticks
	TimeSpan_t803  ___ticks_0;
	// System.DateTimeKind System.DateTime::kind
	int32_t ___kind_1;
};
struct DateTime_t365_StaticFields{
	// System.DateTime System.DateTime::MaxValue
	DateTime_t365  ___MaxValue_2;
	// System.DateTime System.DateTime::MinValue
	DateTime_t365  ___MinValue_3;
	// System.String[] System.DateTime::ParseTimeFormats
	StringU5BU5D_t163* ___ParseTimeFormats_4;
	// System.String[] System.DateTime::ParseYearDayMonthFormats
	StringU5BU5D_t163* ___ParseYearDayMonthFormats_5;
	// System.String[] System.DateTime::ParseYearMonthDayFormats
	StringU5BU5D_t163* ___ParseYearMonthDayFormats_6;
	// System.String[] System.DateTime::ParseDayMonthYearFormats
	StringU5BU5D_t163* ___ParseDayMonthYearFormats_7;
	// System.String[] System.DateTime::ParseMonthDayYearFormats
	StringU5BU5D_t163* ___ParseMonthDayYearFormats_8;
	// System.String[] System.DateTime::MonthDayShortFormats
	StringU5BU5D_t163* ___MonthDayShortFormats_9;
	// System.String[] System.DateTime::DayMonthShortFormats
	StringU5BU5D_t163* ___DayMonthShortFormats_10;
	// System.Int32[] System.DateTime::daysmonth
	Int32U5BU5D_t420* ___daysmonth_11;
	// System.Int32[] System.DateTime::daysmonthleap
	Int32U5BU5D_t420* ___daysmonthleap_12;
	// System.Object System.DateTime::to_local_time_span_object
	Object_t * ___to_local_time_span_object_13;
	// System.Int64 System.DateTime::last_now
	int64_t ___last_now_14;
};

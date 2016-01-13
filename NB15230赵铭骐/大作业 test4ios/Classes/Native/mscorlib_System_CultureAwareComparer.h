#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Globalization.CompareInfo
struct CompareInfo_t1100;

#include "mscorlib_System_StringComparer.h"

// System.CultureAwareComparer
struct  CultureAwareComparer_t1730  : public StringComparer_t921
{
	// System.Boolean System.CultureAwareComparer::_ignoreCase
	bool ____ignoreCase_4;
	// System.Globalization.CompareInfo System.CultureAwareComparer::_compareInfo
	CompareInfo_t1100 * ____compareInfo_5;
};

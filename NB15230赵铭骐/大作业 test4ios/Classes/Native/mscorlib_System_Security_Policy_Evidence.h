﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.ArrayList
struct ArrayList_t734;

#include "mscorlib_System_Object.h"

// System.Security.Policy.Evidence
struct  Evidence_t1335  : public Object_t
{
	// System.Collections.ArrayList System.Security.Policy.Evidence::hostEvidenceList
	ArrayList_t734 * ___hostEvidenceList_0;
	// System.Collections.ArrayList System.Security.Policy.Evidence::assemblyEvidenceList
	ArrayList_t734 * ___assemblyEvidenceList_1;
	// System.Int32 System.Security.Policy.Evidence::_hashCode
	int32_t ____hashCode_2;
};

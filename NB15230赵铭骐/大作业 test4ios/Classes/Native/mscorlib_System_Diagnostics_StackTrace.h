﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Diagnostics.StackFrame[]
struct StackFrameU5BU5D_t1244;

#include "mscorlib_System_Object.h"

// System.Diagnostics.StackTrace
struct  StackTrace_t432  : public Object_t
{
	// System.Diagnostics.StackFrame[] System.Diagnostics.StackTrace::frames
	StackFrameU5BU5D_t1244* ___frames_1;
	// System.Boolean System.Diagnostics.StackTrace::debug_info
	bool ___debug_info_2;
};

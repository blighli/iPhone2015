﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// Microsoft.Win32.SafeHandles.SafeWaitHandle
struct SafeWaitHandle_t1146;

#include "mscorlib_System_MarshalByRefObject.h"
#include "mscorlib_System_IntPtr.h"

// System.Threading.WaitHandle
struct  WaitHandle_t1085  : public MarshalByRefObject_t773
{
	// Microsoft.Win32.SafeHandles.SafeWaitHandle System.Threading.WaitHandle::safe_wait_handle
	SafeWaitHandle_t1146 * ___safe_wait_handle_2;
	// System.Boolean System.Threading.WaitHandle::disposed
	bool ___disposed_4;
};
struct WaitHandle_t1085_StaticFields{
	// System.IntPtr System.Threading.WaitHandle::InvalidHandle
	IntPtr_t ___InvalidHandle_3;
};

﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.IntPtr[]
struct IntPtrU5BU5D_t421;
// System.Exception
struct Exception_t152;
// System.String
struct String_t;
// System.Collections.IDictionary
struct IDictionary_t833;

#include "mscorlib_System_Object.h"

// System.Exception
struct  Exception_t152  : public Object_t
{
	// System.IntPtr[] System.Exception::trace_ips
	IntPtrU5BU5D_t421* ___trace_ips_0;
	// System.Exception System.Exception::inner_exception
	Exception_t152 * ___inner_exception_1;
	// System.String System.Exception::message
	String_t* ___message_2;
	// System.String System.Exception::help_link
	String_t* ___help_link_3;
	// System.String System.Exception::class_name
	String_t* ___class_name_4;
	// System.String System.Exception::stack_trace
	String_t* ___stack_trace_5;
	// System.String System.Exception::_remoteStackTraceString
	String_t* ____remoteStackTraceString_6;
	// System.Int32 System.Exception::remote_stack_index
	int32_t ___remote_stack_index_7;
	// System.Int32 System.Exception::hresult
	int32_t ___hresult_8;
	// System.String System.Exception::source
	String_t* ___source_9;
	// System.Collections.IDictionary System.Exception::_data
	Object_t * ____data_10;
};

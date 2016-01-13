#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Security.SecurityElement
struct SecurityElement_t1208;
// System.Collections.Stack
struct Stack_t849;

#include "mscorlib_Mono_Xml_SmallXmlParser.h"

// Mono.Xml.SecurityParser
struct  SecurityParser_t1206  : public SmallXmlParser_t1207
{
	// System.Security.SecurityElement Mono.Xml.SecurityParser::root
	SecurityElement_t1208 * ___root_13;
	// System.Security.SecurityElement Mono.Xml.SecurityParser::current
	SecurityElement_t1208 * ___current_14;
	// System.Collections.Stack Mono.Xml.SecurityParser::stack
	Stack_t849 * ___stack_15;
};

#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.String
struct String_t;
// System.String[]
struct StringU5BU5D_t163;

#include "mscorlib_System_Object.h"

// System.Runtime.Remoting.TypeInfo
struct  TypeInfo_t1522  : public Object_t
{
	// System.String System.Runtime.Remoting.TypeInfo::serverType
	String_t* ___serverType_0;
	// System.String[] System.Runtime.Remoting.TypeInfo::serverHierarchy
	StringU5BU5D_t163* ___serverHierarchy_1;
	// System.String[] System.Runtime.Remoting.TypeInfo::interfacesImplemented
	StringU5BU5D_t163* ___interfacesImplemented_2;
};

#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.Hashtable
struct Hashtable_t725;
// System.Collections.ArrayList
struct ArrayList_t734;
// System.String
struct String_t;
// System.Runtime.Serialization.IFormatterConverter
struct IFormatterConverter_t1558;

#include "mscorlib_System_Object.h"

// System.Runtime.Serialization.SerializationInfo
struct  SerializationInfo_t433  : public Object_t
{
	// System.Collections.Hashtable System.Runtime.Serialization.SerializationInfo::serialized
	Hashtable_t725 * ___serialized_0;
	// System.Collections.ArrayList System.Runtime.Serialization.SerializationInfo::values
	ArrayList_t734 * ___values_1;
	// System.String System.Runtime.Serialization.SerializationInfo::assemblyName
	String_t* ___assemblyName_2;
	// System.String System.Runtime.Serialization.SerializationInfo::fullTypeName
	String_t* ___fullTypeName_3;
	// System.Runtime.Serialization.IFormatterConverter System.Runtime.Serialization.SerializationInfo::converter
	Object_t * ___converter_4;
};

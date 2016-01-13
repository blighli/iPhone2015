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
// System.Collections.Generic.Dictionary`2<System.String,System.Boolean>
struct Dictionary_2_t769;
// System.Boolean[]
struct BooleanU5BU5D_t770;

#include "System_System_Collections_Specialized_NameValueCollection.h"

// System.Net.WebHeaderCollection
struct  WebHeaderCollection_t749  : public NameValueCollection_t737
{
	// System.Boolean System.Net.WebHeaderCollection::internallyCreated
	bool ___internallyCreated_15;
};
struct WebHeaderCollection_t749_StaticFields{
	// System.Collections.Hashtable System.Net.WebHeaderCollection::restricted
	Hashtable_t725 * ___restricted_12;
	// System.Collections.Hashtable System.Net.WebHeaderCollection::multiValue
	Hashtable_t725 * ___multiValue_13;
	// System.Collections.Generic.Dictionary`2<System.String,System.Boolean> System.Net.WebHeaderCollection::restricted_response
	Dictionary_2_t769 * ___restricted_response_14;
	// System.Boolean[] System.Net.WebHeaderCollection::allowed_chars
	BooleanU5BU5D_t770* ___allowed_chars_16;
};

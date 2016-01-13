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
// System.Collections.ArrayList
struct ArrayList_t734;
// System.Collections.Hashtable
struct Hashtable_t725;

#include "mscorlib_System_Object.h"

// System.Runtime.Remoting.ChannelData
struct  ChannelData_t1511  : public Object_t
{
	// System.String System.Runtime.Remoting.ChannelData::Ref
	String_t* ___Ref_0;
	// System.String System.Runtime.Remoting.ChannelData::Type
	String_t* ___Type_1;
	// System.String System.Runtime.Remoting.ChannelData::Id
	String_t* ___Id_2;
	// System.String System.Runtime.Remoting.ChannelData::DelayLoadAsClientChannel
	String_t* ___DelayLoadAsClientChannel_3;
	// System.Collections.ArrayList System.Runtime.Remoting.ChannelData::_serverProviders
	ArrayList_t734 * ____serverProviders_4;
	// System.Collections.ArrayList System.Runtime.Remoting.ChannelData::_clientProviders
	ArrayList_t734 * ____clientProviders_5;
	// System.Collections.Hashtable System.Runtime.Remoting.ChannelData::_customProperties
	Hashtable_t725 * ____customProperties_6;
};

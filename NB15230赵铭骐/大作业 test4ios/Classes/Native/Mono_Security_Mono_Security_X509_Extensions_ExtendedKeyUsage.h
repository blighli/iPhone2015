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
// System.Collections.Generic.Dictionary`2<System.String,System.Int32>
struct Dictionary_2_t327;

#include "Mono_Security_Mono_Security_X509_X509Extension.h"

// Mono.Security.X509.Extensions.ExtendedKeyUsageExtension
struct  ExtendedKeyUsageExtension_t1002  : public X509Extension_t906
{
	// System.Collections.ArrayList Mono.Security.X509.Extensions.ExtendedKeyUsageExtension::keyPurpose
	ArrayList_t734 * ___keyPurpose_3;
};
struct ExtendedKeyUsageExtension_t1002_StaticFields{
	// System.Collections.Generic.Dictionary`2<System.String,System.Int32> Mono.Security.X509.Extensions.ExtendedKeyUsageExtension::<>f__switch$map14
	Dictionary_2_t327 * ___U3CU3Ef__switchU24map14_4;
};

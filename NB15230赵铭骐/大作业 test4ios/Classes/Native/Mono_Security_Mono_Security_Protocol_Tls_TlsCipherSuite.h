﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Byte[]
struct ByteU5BU5D_t789;
// System.Object
struct Object_t;

#include "Mono_Security_Mono_Security_Protocol_Tls_CipherSuite.h"

// Mono.Security.Protocol.Tls.TlsCipherSuite
struct  TlsCipherSuite_t1057  : public CipherSuite_t1016
{
	// System.Byte[] Mono.Security.Protocol.Tls.TlsCipherSuite::header
	ByteU5BU5D_t789* ___header_21;
	// System.Object Mono.Security.Protocol.Tls.TlsCipherSuite::headerLock
	Object_t * ___headerLock_22;
};

#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// Mono.Security.Protocol.Tls.SslClientStream
struct SslClientStream_t1021;

#include "Mono_Security_Mono_Security_Protocol_Tls_Context.h"

// Mono.Security.Protocol.Tls.ClientContext
struct  ClientContext_t1020  : public Context_t1017
{
	// Mono.Security.Protocol.Tls.SslClientStream Mono.Security.Protocol.Tls.ClientContext::sslStream
	SslClientStream_t1021 * ___sslStream_30;
	// System.Int16 Mono.Security.Protocol.Tls.ClientContext::clientHelloProtocol
	int16_t ___clientHelloProtocol_31;
};

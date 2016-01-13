#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// Mono.Security.Protocol.Tls.Handshake.Client.TlsServerKeyExchange
struct TlsServerKeyExchange_t1072;
// Mono.Security.Protocol.Tls.Context
struct Context_t1017;
// System.Byte[]
struct ByteU5BU5D_t789;

#include "codegen/il2cpp-codegen.h"

// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsServerKeyExchange::.ctor(Mono.Security.Protocol.Tls.Context,System.Byte[])
extern "C" void TlsServerKeyExchange__ctor_m5652 (TlsServerKeyExchange_t1072 * __this, Context_t1017 * ___context, ByteU5BU5D_t789* ___buffer, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsServerKeyExchange::Update()
extern "C" void TlsServerKeyExchange_Update_m5653 (TlsServerKeyExchange_t1072 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsServerKeyExchange::ProcessAsSsl3()
extern "C" void TlsServerKeyExchange_ProcessAsSsl3_m5654 (TlsServerKeyExchange_t1072 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsServerKeyExchange::ProcessAsTls1()
extern "C" void TlsServerKeyExchange_ProcessAsTls1_m5655 (TlsServerKeyExchange_t1072 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsServerKeyExchange::verifySignature()
extern "C" void TlsServerKeyExchange_verifySignature_m5656 (TlsServerKeyExchange_t1072 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

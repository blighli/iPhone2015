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

// Mono.Security.Protocol.Tls.ClientRecordProtocol
struct ClientRecordProtocol_t1022;
// System.IO.Stream
struct Stream_t1039;
// Mono.Security.Protocol.Tls.ClientContext
struct ClientContext_t1020;
// Mono.Security.Protocol.Tls.Handshake.HandshakeMessage
struct HandshakeMessage_t1041;
// Mono.Security.Protocol.Tls.TlsStream
struct TlsStream_t1030;
// System.Byte[]
struct ByteU5BU5D_t789;

#include "codegen/il2cpp-codegen.h"
#include "Mono_Security_Mono_Security_Protocol_Tls_Handshake_Handshake.h"

// System.Void Mono.Security.Protocol.Tls.ClientRecordProtocol::.ctor(System.IO.Stream,Mono.Security.Protocol.Tls.ClientContext)
extern "C" void ClientRecordProtocol__ctor_m5258 (ClientRecordProtocol_t1022 * __this, Stream_t1039 * ___innerStream, ClientContext_t1020 * ___context, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.Handshake.HandshakeMessage Mono.Security.Protocol.Tls.ClientRecordProtocol::GetMessage(Mono.Security.Protocol.Tls.Handshake.HandshakeType)
extern "C" HandshakeMessage_t1041 * ClientRecordProtocol_GetMessage_m5259 (ClientRecordProtocol_t1022 * __this, uint8_t ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.ClientRecordProtocol::ProcessHandshakeMessage(Mono.Security.Protocol.Tls.TlsStream)
extern "C" void ClientRecordProtocol_ProcessHandshakeMessage_m5260 (ClientRecordProtocol_t1022 * __this, TlsStream_t1030 * ___handMsg, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.Handshake.HandshakeMessage Mono.Security.Protocol.Tls.ClientRecordProtocol::createClientHandshakeMessage(Mono.Security.Protocol.Tls.Handshake.HandshakeType)
extern "C" HandshakeMessage_t1041 * ClientRecordProtocol_createClientHandshakeMessage_m5261 (ClientRecordProtocol_t1022 * __this, uint8_t ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.Handshake.HandshakeMessage Mono.Security.Protocol.Tls.ClientRecordProtocol::createServerHandshakeMessage(Mono.Security.Protocol.Tls.Handshake.HandshakeType,System.Byte[])
extern "C" HandshakeMessage_t1041 * ClientRecordProtocol_createServerHandshakeMessage_m5262 (ClientRecordProtocol_t1022 * __this, uint8_t ___type, ByteU5BU5D_t789* ___buffer, const MethodInfo* method) IL2CPP_METHOD_ATTR;

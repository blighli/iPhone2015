﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// Mono.Security.Protocol.Tls.Handshake.Client.TlsClientHello
struct TlsClientHello_t1065;
// Mono.Security.Protocol.Tls.Context
struct Context_t1017;

#include "codegen/il2cpp-codegen.h"

// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsClientHello::.ctor(Mono.Security.Protocol.Tls.Context)
extern "C" void TlsClientHello__ctor_m5618 (TlsClientHello_t1065 * __this, Context_t1017 * ___context, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsClientHello::Update()
extern "C" void TlsClientHello_Update_m5619 (TlsClientHello_t1065 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsClientHello::ProcessAsSsl3()
extern "C" void TlsClientHello_ProcessAsSsl3_m5620 (TlsClientHello_t1065 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.Handshake.Client.TlsClientHello::ProcessAsTls1()
extern "C" void TlsClientHello_ProcessAsTls1_m5621 (TlsClientHello_t1065 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Object
struct Object_t;
// System.AsyncCallback
struct AsyncCallback_t222;
// System.Exception
struct Exception_t152;
// System.Threading.ManualResetEvent
struct ManualResetEvent_t1038;
// Mono.Security.Protocol.Tls.Handshake.HandshakeMessage
struct HandshakeMessage_t1041;

#include "mscorlib_System_Object.h"

// Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult
struct  SendRecordAsyncResult_t1040  : public Object_t
{
	// System.Object Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult::locker
	Object_t * ___locker_0;
	// System.AsyncCallback Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult::_userCallback
	AsyncCallback_t222 * ____userCallback_1;
	// System.Object Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult::_userState
	Object_t * ____userState_2;
	// System.Exception Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult::_asyncException
	Exception_t152 * ____asyncException_3;
	// System.Threading.ManualResetEvent Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult::handle
	ManualResetEvent_t1038 * ___handle_4;
	// Mono.Security.Protocol.Tls.Handshake.HandshakeMessage Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult::_message
	HandshakeMessage_t1041 * ____message_5;
	// System.Boolean Mono.Security.Protocol.Tls.RecordProtocol/SendRecordAsyncResult::completed
	bool ___completed_6;
};

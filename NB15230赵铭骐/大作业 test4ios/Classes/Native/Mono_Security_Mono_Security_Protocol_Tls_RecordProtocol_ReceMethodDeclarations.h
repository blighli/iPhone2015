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

// Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult
struct ReceiveRecordAsyncResult_t1037;
// System.AsyncCallback
struct AsyncCallback_t222;
// System.Object
struct Object_t;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.IO.Stream
struct Stream_t1039;
// System.Exception
struct Exception_t152;
// System.Threading.WaitHandle
struct WaitHandle_t1085;

#include "codegen/il2cpp-codegen.h"

// System.Void Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::.ctor(System.AsyncCallback,System.Object,System.Byte[],System.IO.Stream)
extern "C" void ReceiveRecordAsyncResult__ctor_m5348 (ReceiveRecordAsyncResult_t1037 * __this, AsyncCallback_t222 * ___userCallback, Object_t * ___userState, ByteU5BU5D_t789* ___initialBuffer, Stream_t1039 * ___record, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.IO.Stream Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_Record()
extern "C" Stream_t1039 * ReceiveRecordAsyncResult_get_Record_m5349 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_ResultingBuffer()
extern "C" ByteU5BU5D_t789* ReceiveRecordAsyncResult_get_ResultingBuffer_m5350 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_InitialBuffer()
extern "C" ByteU5BU5D_t789* ReceiveRecordAsyncResult_get_InitialBuffer_m5351 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_AsyncState()
extern "C" Object_t * ReceiveRecordAsyncResult_get_AsyncState_m5352 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Exception Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_AsyncException()
extern "C" Exception_t152 * ReceiveRecordAsyncResult_get_AsyncException_m5353 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_CompletedWithError()
extern "C" bool ReceiveRecordAsyncResult_get_CompletedWithError_m5354 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Threading.WaitHandle Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_AsyncWaitHandle()
extern "C" WaitHandle_t1085 * ReceiveRecordAsyncResult_get_AsyncWaitHandle_m5355 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::get_IsCompleted()
extern "C" bool ReceiveRecordAsyncResult_get_IsCompleted_m5356 (ReceiveRecordAsyncResult_t1037 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::SetComplete(System.Exception,System.Byte[])
extern "C" void ReceiveRecordAsyncResult_SetComplete_m5357 (ReceiveRecordAsyncResult_t1037 * __this, Exception_t152 * ___ex, ByteU5BU5D_t789* ___resultingBuffer, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::SetComplete(System.Exception)
extern "C" void ReceiveRecordAsyncResult_SetComplete_m5358 (ReceiveRecordAsyncResult_t1037 * __this, Exception_t152 * ___ex, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.RecordProtocol/ReceiveRecordAsyncResult::SetComplete(System.Byte[])
extern "C" void ReceiveRecordAsyncResult_SetComplete_m5359 (ReceiveRecordAsyncResult_t1037 * __this, ByteU5BU5D_t789* ___resultingBuffer, const MethodInfo* method) IL2CPP_METHOD_ATTR;

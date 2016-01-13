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

// Mono.Security.Protocol.Tls.TlsStream
struct TlsStream_t1030;
// System.Byte[]
struct ByteU5BU5D_t789;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_IO_SeekOrigin.h"

// System.Void Mono.Security.Protocol.Tls.TlsStream::.ctor()
extern "C" void TlsStream__ctor_m5563 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::.ctor(System.Byte[])
extern "C" void TlsStream__ctor_m5564 (TlsStream_t1030 * __this, ByteU5BU5D_t789* ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.TlsStream::get_EOF()
extern "C" bool TlsStream_get_EOF_m5565 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.TlsStream::get_CanWrite()
extern "C" bool TlsStream_get_CanWrite_m5566 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.TlsStream::get_CanRead()
extern "C" bool TlsStream_get_CanRead_m5567 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.TlsStream::get_CanSeek()
extern "C" bool TlsStream_get_CanSeek_m5568 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int64 Mono.Security.Protocol.Tls.TlsStream::get_Position()
extern "C" int64_t TlsStream_get_Position_m5569 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::set_Position(System.Int64)
extern "C" void TlsStream_set_Position_m5570 (TlsStream_t1030 * __this, int64_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int64 Mono.Security.Protocol.Tls.TlsStream::get_Length()
extern "C" int64_t TlsStream_get_Length_m5571 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.Protocol.Tls.TlsStream::ReadSmallValue(System.Int32)
extern "C" ByteU5BU5D_t789* TlsStream_ReadSmallValue_m5572 (TlsStream_t1030 * __this, int32_t ___length, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte Mono.Security.Protocol.Tls.TlsStream::ReadByte()
extern "C" uint8_t TlsStream_ReadByte_m5573 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int16 Mono.Security.Protocol.Tls.TlsStream::ReadInt16()
extern "C" int16_t TlsStream_ReadInt16_m5574 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.TlsStream::ReadInt24()
extern "C" int32_t TlsStream_ReadInt24_m5575 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.Protocol.Tls.TlsStream::ReadBytes(System.Int32)
extern "C" ByteU5BU5D_t789* TlsStream_ReadBytes_m5576 (TlsStream_t1030 * __this, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::Write(System.Byte)
extern "C" void TlsStream_Write_m5577 (TlsStream_t1030 * __this, uint8_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::Write(System.Int16)
extern "C" void TlsStream_Write_m5578 (TlsStream_t1030 * __this, int16_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::WriteInt24(System.Int32)
extern "C" void TlsStream_WriteInt24_m5579 (TlsStream_t1030 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::Write(System.Int32)
extern "C" void TlsStream_Write_m5580 (TlsStream_t1030 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::Write(System.Byte[])
extern "C" void TlsStream_Write_m5581 (TlsStream_t1030 * __this, ByteU5BU5D_t789* ___buffer, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::Reset()
extern "C" void TlsStream_Reset_m5582 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.Protocol.Tls.TlsStream::ToArray()
extern "C" ByteU5BU5D_t789* TlsStream_ToArray_m5583 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::Flush()
extern "C" void TlsStream_Flush_m5584 (TlsStream_t1030 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::SetLength(System.Int64)
extern "C" void TlsStream_SetLength_m5585 (TlsStream_t1030 * __this, int64_t ___length, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int64 Mono.Security.Protocol.Tls.TlsStream::Seek(System.Int64,System.IO.SeekOrigin)
extern "C" int64_t TlsStream_Seek_m5586 (TlsStream_t1030 * __this, int64_t ___offset, int32_t ___loc, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.TlsStream::Read(System.Byte[],System.Int32,System.Int32)
extern "C" int32_t TlsStream_Read_m5587 (TlsStream_t1030 * __this, ByteU5BU5D_t789* ___buffer, int32_t ___offset, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.TlsStream::Write(System.Byte[],System.Int32,System.Int32)
extern "C" void TlsStream_Write_m5588 (TlsStream_t1030 * __this, ByteU5BU5D_t789* ___buffer, int32_t ___offset, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;

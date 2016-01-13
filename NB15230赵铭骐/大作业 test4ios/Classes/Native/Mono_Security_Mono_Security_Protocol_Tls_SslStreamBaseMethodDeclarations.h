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

// Mono.Security.Protocol.Tls.SslStreamBase
struct SslStreamBase_t1050;
// System.IO.Stream
struct Stream_t1039;
// System.IAsyncResult
struct IAsyncResult_t221;
// System.Security.Cryptography.X509Certificates.X509Certificate
struct X509Certificate_t786;
// System.Security.Cryptography.X509Certificates.X509CertificateCollection
struct X509CertificateCollection_t760;
// System.String
struct String_t;
// System.Int32[]
struct Int32U5BU5D_t420;
// Mono.Security.Protocol.Tls.ValidationResult
struct ValidationResult_t1049;
// Mono.Security.X509.X509CertificateCollection
struct X509CertificateCollection_t933;
// System.Security.Cryptography.AsymmetricAlgorithm
struct AsymmetricAlgorithm_t776;
// Mono.Security.Protocol.Tls.SslStreamBase/InternalAsyncResult
struct InternalAsyncResult_t1055;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.AsyncCallback
struct AsyncCallback_t222;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "Mono_Security_Mono_Security_Protocol_Tls_CipherAlgorithmType.h"
#include "Mono_Security_Mono_Security_Protocol_Tls_HashAlgorithmType.h"
#include "Mono_Security_Mono_Security_Protocol_Tls_ExchangeAlgorithmTy.h"
#include "Mono_Security_Mono_Security_Protocol_Tls_SecurityProtocolTyp.h"
#include "mscorlib_System_IO_SeekOrigin.h"

// System.Void Mono.Security.Protocol.Tls.SslStreamBase::.ctor(System.IO.Stream,System.Boolean)
extern "C" void SslStreamBase__ctor_m5481 (SslStreamBase_t1050 * __this, Stream_t1039 * ___stream, bool ___ownsStream, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::.cctor()
extern "C" void SslStreamBase__cctor_m5482 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::AsyncHandshakeCallback(System.IAsyncResult)
extern "C" void SslStreamBase_AsyncHandshakeCallback_m5483 (SslStreamBase_t1050 * __this, Object_t * ___asyncResult, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.SslStreamBase::get_MightNeedHandshake()
extern "C" bool SslStreamBase_get_MightNeedHandshake_m5484 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::NegotiateHandshake()
extern "C" void SslStreamBase_NegotiateHandshake_m5485 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.X509Certificates.X509Certificate Mono.Security.Protocol.Tls.SslStreamBase::RaiseLocalCertificateSelection(System.Security.Cryptography.X509Certificates.X509CertificateCollection,System.Security.Cryptography.X509Certificates.X509Certificate,System.String,System.Security.Cryptography.X509Certificates.X509CertificateCollection)
extern "C" X509Certificate_t786 * SslStreamBase_RaiseLocalCertificateSelection_m5486 (SslStreamBase_t1050 * __this, X509CertificateCollection_t760 * ___certificates, X509Certificate_t786 * ___remoteCertificate, String_t* ___targetHost, X509CertificateCollection_t760 * ___requestedCertificates, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.SslStreamBase::RaiseRemoteCertificateValidation(System.Security.Cryptography.X509Certificates.X509Certificate,System.Int32[])
extern "C" bool SslStreamBase_RaiseRemoteCertificateValidation_m5487 (SslStreamBase_t1050 * __this, X509Certificate_t786 * ___certificate, Int32U5BU5D_t420* ___errors, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.ValidationResult Mono.Security.Protocol.Tls.SslStreamBase::RaiseRemoteCertificateValidation2(Mono.Security.X509.X509CertificateCollection)
extern "C" ValidationResult_t1049 * SslStreamBase_RaiseRemoteCertificateValidation2_m5488 (SslStreamBase_t1050 * __this, X509CertificateCollection_t933 * ___collection, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.AsymmetricAlgorithm Mono.Security.Protocol.Tls.SslStreamBase::RaiseLocalPrivateKeySelection(System.Security.Cryptography.X509Certificates.X509Certificate,System.String)
extern "C" AsymmetricAlgorithm_t776 * SslStreamBase_RaiseLocalPrivateKeySelection_m5489 (SslStreamBase_t1050 * __this, X509Certificate_t786 * ___certificate, String_t* ___targetHost, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.SslStreamBase::get_CheckCertRevocationStatus()
extern "C" bool SslStreamBase_get_CheckCertRevocationStatus_m5490 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::set_CheckCertRevocationStatus(System.Boolean)
extern "C" void SslStreamBase_set_CheckCertRevocationStatus_m5491 (SslStreamBase_t1050 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.CipherAlgorithmType Mono.Security.Protocol.Tls.SslStreamBase::get_CipherAlgorithm()
extern "C" int32_t SslStreamBase_get_CipherAlgorithm_m5492 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.SslStreamBase::get_CipherStrength()
extern "C" int32_t SslStreamBase_get_CipherStrength_m5493 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.HashAlgorithmType Mono.Security.Protocol.Tls.SslStreamBase::get_HashAlgorithm()
extern "C" int32_t SslStreamBase_get_HashAlgorithm_m5494 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.SslStreamBase::get_HashStrength()
extern "C" int32_t SslStreamBase_get_HashStrength_m5495 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.SslStreamBase::get_KeyExchangeStrength()
extern "C" int32_t SslStreamBase_get_KeyExchangeStrength_m5496 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.ExchangeAlgorithmType Mono.Security.Protocol.Tls.SslStreamBase::get_KeyExchangeAlgorithm()
extern "C" int32_t SslStreamBase_get_KeyExchangeAlgorithm_m5497 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.Protocol.Tls.SecurityProtocolType Mono.Security.Protocol.Tls.SslStreamBase::get_SecurityProtocol()
extern "C" int32_t SslStreamBase_get_SecurityProtocol_m5498 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.X509Certificates.X509Certificate Mono.Security.Protocol.Tls.SslStreamBase::get_ServerCertificate()
extern "C" X509Certificate_t786 * SslStreamBase_get_ServerCertificate_m5499 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.X509.X509CertificateCollection Mono.Security.Protocol.Tls.SslStreamBase::get_ServerCertificates()
extern "C" X509CertificateCollection_t933 * SslStreamBase_get_ServerCertificates_m5500 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.SslStreamBase::BeginNegotiateHandshake(Mono.Security.Protocol.Tls.SslStreamBase/InternalAsyncResult)
extern "C" bool SslStreamBase_BeginNegotiateHandshake_m5501 (SslStreamBase_t1050 * __this, InternalAsyncResult_t1055 * ___asyncResult, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::EndNegotiateHandshake(Mono.Security.Protocol.Tls.SslStreamBase/InternalAsyncResult)
extern "C" void SslStreamBase_EndNegotiateHandshake_m5502 (SslStreamBase_t1050 * __this, InternalAsyncResult_t1055 * ___asyncResult, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.IAsyncResult Mono.Security.Protocol.Tls.SslStreamBase::BeginRead(System.Byte[],System.Int32,System.Int32,System.AsyncCallback,System.Object)
extern "C" Object_t * SslStreamBase_BeginRead_m5503 (SslStreamBase_t1050 * __this, ByteU5BU5D_t789* ___buffer, int32_t ___offset, int32_t ___count, AsyncCallback_t222 * ___callback, Object_t * ___state, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::InternalBeginRead(Mono.Security.Protocol.Tls.SslStreamBase/InternalAsyncResult)
extern "C" void SslStreamBase_InternalBeginRead_m5504 (SslStreamBase_t1050 * __this, InternalAsyncResult_t1055 * ___asyncResult, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::InternalReadCallback(System.IAsyncResult)
extern "C" void SslStreamBase_InternalReadCallback_m5505 (SslStreamBase_t1050 * __this, Object_t * ___result, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::InternalBeginWrite(Mono.Security.Protocol.Tls.SslStreamBase/InternalAsyncResult)
extern "C" void SslStreamBase_InternalBeginWrite_m5506 (SslStreamBase_t1050 * __this, InternalAsyncResult_t1055 * ___asyncResult, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::InternalWriteCallback(System.IAsyncResult)
extern "C" void SslStreamBase_InternalWriteCallback_m5507 (SslStreamBase_t1050 * __this, Object_t * ___ar, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.IAsyncResult Mono.Security.Protocol.Tls.SslStreamBase::BeginWrite(System.Byte[],System.Int32,System.Int32,System.AsyncCallback,System.Object)
extern "C" Object_t * SslStreamBase_BeginWrite_m5508 (SslStreamBase_t1050 * __this, ByteU5BU5D_t789* ___buffer, int32_t ___offset, int32_t ___count, AsyncCallback_t222 * ___callback, Object_t * ___state, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.SslStreamBase::EndRead(System.IAsyncResult)
extern "C" int32_t SslStreamBase_EndRead_m5509 (SslStreamBase_t1050 * __this, Object_t * ___asyncResult, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::EndWrite(System.IAsyncResult)
extern "C" void SslStreamBase_EndWrite_m5510 (SslStreamBase_t1050 * __this, Object_t * ___asyncResult, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::Close()
extern "C" void SslStreamBase_Close_m5511 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::Flush()
extern "C" void SslStreamBase_Flush_m5512 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.SslStreamBase::Read(System.Byte[])
extern "C" int32_t SslStreamBase_Read_m5513 (SslStreamBase_t1050 * __this, ByteU5BU5D_t789* ___buffer, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.Protocol.Tls.SslStreamBase::Read(System.Byte[],System.Int32,System.Int32)
extern "C" int32_t SslStreamBase_Read_m5514 (SslStreamBase_t1050 * __this, ByteU5BU5D_t789* ___buffer, int32_t ___offset, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int64 Mono.Security.Protocol.Tls.SslStreamBase::Seek(System.Int64,System.IO.SeekOrigin)
extern "C" int64_t SslStreamBase_Seek_m5515 (SslStreamBase_t1050 * __this, int64_t ___offset, int32_t ___origin, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::SetLength(System.Int64)
extern "C" void SslStreamBase_SetLength_m5516 (SslStreamBase_t1050 * __this, int64_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::Write(System.Byte[])
extern "C" void SslStreamBase_Write_m5517 (SslStreamBase_t1050 * __this, ByteU5BU5D_t789* ___buffer, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::Write(System.Byte[],System.Int32,System.Int32)
extern "C" void SslStreamBase_Write_m5518 (SslStreamBase_t1050 * __this, ByteU5BU5D_t789* ___buffer, int32_t ___offset, int32_t ___count, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.SslStreamBase::get_CanRead()
extern "C" bool SslStreamBase_get_CanRead_m5519 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.SslStreamBase::get_CanSeek()
extern "C" bool SslStreamBase_get_CanSeek_m5520 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.Protocol.Tls.SslStreamBase::get_CanWrite()
extern "C" bool SslStreamBase_get_CanWrite_m5521 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int64 Mono.Security.Protocol.Tls.SslStreamBase::get_Length()
extern "C" int64_t SslStreamBase_get_Length_m5522 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int64 Mono.Security.Protocol.Tls.SslStreamBase::get_Position()
extern "C" int64_t SslStreamBase_get_Position_m5523 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::set_Position(System.Int64)
extern "C" void SslStreamBase_set_Position_m5524 (SslStreamBase_t1050 * __this, int64_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::Finalize()
extern "C" void SslStreamBase_Finalize_m5525 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::Dispose(System.Boolean)
extern "C" void SslStreamBase_Dispose_m5526 (SslStreamBase_t1050 * __this, bool ___disposing, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::resetBuffer()
extern "C" void SslStreamBase_resetBuffer_m5527 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.Protocol.Tls.SslStreamBase::checkDisposed()
extern "C" void SslStreamBase_checkDisposed_m5528 (SslStreamBase_t1050 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

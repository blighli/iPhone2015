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

// System.Security.Cryptography.X509Certificates.PublicKey
struct PublicKey_t775;
// Mono.Security.X509.X509Certificate
struct X509Certificate_t788;
// System.Security.Cryptography.AsnEncodedData
struct AsnEncodedData_t777;
// System.Security.Cryptography.AsymmetricAlgorithm
struct AsymmetricAlgorithm_t776;
// System.Security.Cryptography.Oid
struct Oid_t778;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.Security.Cryptography.DSA
struct DSA_t901;
// System.Security.Cryptography.RSA
struct RSA_t902;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Security.Cryptography.X509Certificates.PublicKey::.ctor(Mono.Security.X509.X509Certificate)
extern "C" void PublicKey__ctor_m3907 (PublicKey_t775 * __this, X509Certificate_t788 * ___certificate, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.AsnEncodedData System.Security.Cryptography.X509Certificates.PublicKey::get_EncodedKeyValue()
extern "C" AsnEncodedData_t777 * PublicKey_get_EncodedKeyValue_m3908 (PublicKey_t775 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.AsnEncodedData System.Security.Cryptography.X509Certificates.PublicKey::get_EncodedParameters()
extern "C" AsnEncodedData_t777 * PublicKey_get_EncodedParameters_m3909 (PublicKey_t775 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.AsymmetricAlgorithm System.Security.Cryptography.X509Certificates.PublicKey::get_Key()
extern "C" AsymmetricAlgorithm_t776 * PublicKey_get_Key_m3910 (PublicKey_t775 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.Oid System.Security.Cryptography.X509Certificates.PublicKey::get_Oid()
extern "C" Oid_t778 * PublicKey_get_Oid_m3911 (PublicKey_t775 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] System.Security.Cryptography.X509Certificates.PublicKey::GetUnsignedBigInteger(System.Byte[])
extern "C" ByteU5BU5D_t789* PublicKey_GetUnsignedBigInteger_m3912 (Object_t * __this /* static, unused */, ByteU5BU5D_t789* ___integer, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.DSA System.Security.Cryptography.X509Certificates.PublicKey::DecodeDSA(System.Byte[],System.Byte[])
extern "C" DSA_t901 * PublicKey_DecodeDSA_m3913 (Object_t * __this /* static, unused */, ByteU5BU5D_t789* ___rawPublicKey, ByteU5BU5D_t789* ___rawParameters, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.RSA System.Security.Cryptography.X509Certificates.PublicKey::DecodeRSA(System.Byte[])
extern "C" RSA_t902 * PublicKey_DecodeRSA_m3914 (Object_t * __this /* static, unused */, ByteU5BU5D_t789* ___rawPublicKey, const MethodInfo* method) IL2CPP_METHOD_ATTR;

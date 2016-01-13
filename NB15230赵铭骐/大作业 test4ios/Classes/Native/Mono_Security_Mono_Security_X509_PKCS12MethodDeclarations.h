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

// Mono.Security.X509.PKCS12
struct PKCS12_t932;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.String
struct String_t;
// System.Collections.ArrayList
struct ArrayList_t734;
// Mono.Security.X509.X509CertificateCollection
struct X509CertificateCollection_t933;
// System.Security.Cryptography.RandomNumberGenerator
struct RandomNumberGenerator_t949;
// System.Security.Cryptography.SymmetricAlgorithm
struct SymmetricAlgorithm_t951;
// Mono.Security.PKCS7/EncryptedData
struct EncryptedData_t981;
// Mono.Security.Cryptography.PKCS8/PrivateKeyInfo
struct PrivateKeyInfo_t991;
// Mono.Security.ASN1
struct ASN1_t903;
// Mono.Security.X509.X509Certificate
struct X509Certificate_t788;
// System.Collections.IDictionary
struct IDictionary_t833;
// Mono.Security.PKCS7/ContentInfo
struct ContentInfo_t980;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Security_Cryptography_DSAParameters.h"

// System.Void Mono.Security.X509.PKCS12::.ctor()
extern "C" void PKCS12__ctor_m5028 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::.ctor(System.Byte[])
extern "C" void PKCS12__ctor_m4691 (PKCS12_t932 * __this, ByteU5BU5D_t789* ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::.ctor(System.Byte[],System.String)
extern "C" void PKCS12__ctor_m4692 (PKCS12_t932 * __this, ByteU5BU5D_t789* ___data, String_t* ___password, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::.cctor()
extern "C" void PKCS12__cctor_m5029 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::Decode(System.Byte[])
extern "C" void PKCS12_Decode_m5030 (PKCS12_t932 * __this, ByteU5BU5D_t789* ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::Finalize()
extern "C" void PKCS12_Finalize_m5031 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::set_Password(System.String)
extern "C" void PKCS12_set_Password_m5032 (PKCS12_t932 * __this, String_t* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.X509.PKCS12::get_IterationCount()
extern "C" int32_t PKCS12_get_IterationCount_m5033 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::set_IterationCount(System.Int32)
extern "C" void PKCS12_set_IterationCount_m5034 (PKCS12_t932 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Collections.ArrayList Mono.Security.X509.PKCS12::get_Keys()
extern "C" ArrayList_t734 * PKCS12_get_Keys_m4695 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.X509.X509CertificateCollection Mono.Security.X509.PKCS12::get_Certificates()
extern "C" X509CertificateCollection_t933 * PKCS12_get_Certificates_m4693 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.RandomNumberGenerator Mono.Security.X509.PKCS12::get_RNG()
extern "C" RandomNumberGenerator_t949 * PKCS12_get_RNG_m5035 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean Mono.Security.X509.PKCS12::Compare(System.Byte[],System.Byte[])
extern "C" bool PKCS12_Compare_m5036 (PKCS12_t932 * __this, ByteU5BU5D_t789* ___expected, ByteU5BU5D_t789* ___actual, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.SymmetricAlgorithm Mono.Security.X509.PKCS12::GetSymmetricAlgorithm(System.String,System.Byte[],System.Int32)
extern "C" SymmetricAlgorithm_t951 * PKCS12_GetSymmetricAlgorithm_m5037 (PKCS12_t932 * __this, String_t* ___algorithmOid, ByteU5BU5D_t789* ___salt, int32_t ___iterationCount, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.X509.PKCS12::Decrypt(System.String,System.Byte[],System.Int32,System.Byte[])
extern "C" ByteU5BU5D_t789* PKCS12_Decrypt_m5038 (PKCS12_t932 * __this, String_t* ___algorithmOid, ByteU5BU5D_t789* ___salt, int32_t ___iterationCount, ByteU5BU5D_t789* ___encryptedData, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.X509.PKCS12::Decrypt(Mono.Security.PKCS7/EncryptedData)
extern "C" ByteU5BU5D_t789* PKCS12_Decrypt_m5039 (PKCS12_t932 * __this, EncryptedData_t981 * ___ed, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.X509.PKCS12::Encrypt(System.String,System.Byte[],System.Int32,System.Byte[])
extern "C" ByteU5BU5D_t789* PKCS12_Encrypt_m5040 (PKCS12_t932 * __this, String_t* ___algorithmOid, ByteU5BU5D_t789* ___salt, int32_t ___iterationCount, ByteU5BU5D_t789* ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.DSAParameters Mono.Security.X509.PKCS12::GetExistingParameters(System.Boolean&)
extern "C" DSAParameters_t928  PKCS12_GetExistingParameters_m5041 (PKCS12_t932 * __this, bool* ___found, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::AddPrivateKey(Mono.Security.Cryptography.PKCS8/PrivateKeyInfo)
extern "C" void PKCS12_AddPrivateKey_m5042 (PKCS12_t932 * __this, PrivateKeyInfo_t991 * ___pki, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::ReadSafeBag(Mono.Security.ASN1)
extern "C" void PKCS12_ReadSafeBag_m5043 (PKCS12_t932 * __this, ASN1_t903 * ___safeBag, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.ASN1 Mono.Security.X509.PKCS12::CertificateSafeBag(Mono.Security.X509.X509Certificate,System.Collections.IDictionary)
extern "C" ASN1_t903 * PKCS12_CertificateSafeBag_m5044 (PKCS12_t932 * __this, X509Certificate_t788 * ___x509, Object_t * ___attributes, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.X509.PKCS12::MAC(System.Byte[],System.Byte[],System.Int32,System.Byte[])
extern "C" ByteU5BU5D_t789* PKCS12_MAC_m5045 (PKCS12_t932 * __this, ByteU5BU5D_t789* ___password, ByteU5BU5D_t789* ___salt, int32_t ___iterations, ByteU5BU5D_t789* ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.X509.PKCS12::GetBytes()
extern "C" ByteU5BU5D_t789* PKCS12_GetBytes_m5046 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.PKCS7/ContentInfo Mono.Security.X509.PKCS12::EncryptedContentInfo(Mono.Security.ASN1,System.String)
extern "C" ContentInfo_t980 * PKCS12_EncryptedContentInfo_m5047 (PKCS12_t932 * __this, ASN1_t903 * ___safeBags, String_t* ___algorithmOid, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::AddCertificate(Mono.Security.X509.X509Certificate)
extern "C" void PKCS12_AddCertificate_m5048 (PKCS12_t932 * __this, X509Certificate_t788 * ___cert, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::AddCertificate(Mono.Security.X509.X509Certificate,System.Collections.IDictionary)
extern "C" void PKCS12_AddCertificate_m5049 (PKCS12_t932 * __this, X509Certificate_t788 * ___cert, Object_t * ___attributes, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::RemoveCertificate(Mono.Security.X509.X509Certificate)
extern "C" void PKCS12_RemoveCertificate_m5050 (PKCS12_t932 * __this, X509Certificate_t788 * ___cert, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.PKCS12::RemoveCertificate(Mono.Security.X509.X509Certificate,System.Collections.IDictionary)
extern "C" void PKCS12_RemoveCertificate_m5051 (PKCS12_t932 * __this, X509Certificate_t788 * ___cert, Object_t * ___attrs, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object Mono.Security.X509.PKCS12::Clone()
extern "C" Object_t * PKCS12_Clone_m5052 (PKCS12_t932 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 Mono.Security.X509.PKCS12::get_MaximumPasswordLength()
extern "C" int32_t PKCS12_get_MaximumPasswordLength_m5053 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;

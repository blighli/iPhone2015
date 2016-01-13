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

// Mono.Security.PKCS7/EncryptedData
struct EncryptedData_t981;
// Mono.Security.ASN1
struct ASN1_t903;
// Mono.Security.PKCS7/ContentInfo
struct ContentInfo_t980;
// System.Byte[]
struct ByteU5BU5D_t789;

#include "codegen/il2cpp-codegen.h"

// System.Void Mono.Security.PKCS7/EncryptedData::.ctor()
extern "C" void EncryptedData__ctor_m4938 (EncryptedData_t981 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.PKCS7/EncryptedData::.ctor(Mono.Security.ASN1)
extern "C" void EncryptedData__ctor_m4939 (EncryptedData_t981 * __this, ASN1_t903 * ___asn1, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.PKCS7/ContentInfo Mono.Security.PKCS7/EncryptedData::get_EncryptionAlgorithm()
extern "C" ContentInfo_t980 * EncryptedData_get_EncryptionAlgorithm_m4940 (EncryptedData_t981 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.PKCS7/EncryptedData::get_EncryptedContent()
extern "C" ByteU5BU5D_t789* EncryptedData_get_EncryptedContent_m4941 (EncryptedData_t981 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

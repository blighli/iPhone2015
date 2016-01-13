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

// Mono.Security.PKCS7/ContentInfo
struct ContentInfo_t1202;
// System.String
struct String_t;
// System.Byte[]
struct ByteU5BU5D_t789;
// Mono.Security.ASN1
struct ASN1_t1191;

#include "codegen/il2cpp-codegen.h"

// System.Void Mono.Security.PKCS7/ContentInfo::.ctor()
extern "C" void ContentInfo__ctor_m7072 (ContentInfo_t1202 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.PKCS7/ContentInfo::.ctor(System.String)
extern "C" void ContentInfo__ctor_m7073 (ContentInfo_t1202 * __this, String_t* ___oid, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.PKCS7/ContentInfo::.ctor(System.Byte[])
extern "C" void ContentInfo__ctor_m7074 (ContentInfo_t1202 * __this, ByteU5BU5D_t789* ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.PKCS7/ContentInfo::.ctor(Mono.Security.ASN1)
extern "C" void ContentInfo__ctor_m7075 (ContentInfo_t1202 * __this, ASN1_t1191 * ___asn1, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.ASN1 Mono.Security.PKCS7/ContentInfo::get_ASN1()
extern "C" ASN1_t1191 * ContentInfo_get_ASN1_m7076 (ContentInfo_t1202 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.ASN1 Mono.Security.PKCS7/ContentInfo::get_Content()
extern "C" ASN1_t1191 * ContentInfo_get_Content_m7077 (ContentInfo_t1202 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.PKCS7/ContentInfo::set_Content(Mono.Security.ASN1)
extern "C" void ContentInfo_set_Content_m7078 (ContentInfo_t1202 * __this, ASN1_t1191 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String Mono.Security.PKCS7/ContentInfo::get_ContentType()
extern "C" String_t* ContentInfo_get_ContentType_m7079 (ContentInfo_t1202 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.PKCS7/ContentInfo::set_ContentType(System.String)
extern "C" void ContentInfo_set_ContentType_m7080 (ContentInfo_t1202 * __this, String_t* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Security.ASN1 Mono.Security.PKCS7/ContentInfo::GetASN1()
extern "C" ASN1_t1191 * ContentInfo_GetASN1_m7081 (ContentInfo_t1202 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

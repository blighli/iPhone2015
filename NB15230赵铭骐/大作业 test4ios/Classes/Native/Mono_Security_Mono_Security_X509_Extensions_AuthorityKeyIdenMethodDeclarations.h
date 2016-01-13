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

// Mono.Security.X509.Extensions.AuthorityKeyIdentifierExtension
struct AuthorityKeyIdentifierExtension_t937;
// Mono.Security.X509.X509Extension
struct X509Extension_t906;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"

// System.Void Mono.Security.X509.Extensions.AuthorityKeyIdentifierExtension::.ctor(Mono.Security.X509.X509Extension)
extern "C" void AuthorityKeyIdentifierExtension__ctor_m4718 (AuthorityKeyIdentifierExtension_t937 * __this, X509Extension_t906 * ___extension, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Security.X509.Extensions.AuthorityKeyIdentifierExtension::Decode()
extern "C" void AuthorityKeyIdentifierExtension_Decode_m5140 (AuthorityKeyIdentifierExtension_t937 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] Mono.Security.X509.Extensions.AuthorityKeyIdentifierExtension::get_Identifier()
extern "C" ByteU5BU5D_t789* AuthorityKeyIdentifierExtension_get_Identifier_m4719 (AuthorityKeyIdentifierExtension_t937 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String Mono.Security.X509.Extensions.AuthorityKeyIdentifierExtension::ToString()
extern "C" String_t* AuthorityKeyIdentifierExtension_ToString_m5141 (AuthorityKeyIdentifierExtension_t937 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

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

// System.Security.Cryptography.DSA
struct DSA_t901;
// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Security_Cryptography_DSAParameters.h"

// System.Void System.Security.Cryptography.DSA::.ctor()
extern "C" void DSA__ctor_m9281 (DSA_t901 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.DSA System.Security.Cryptography.DSA::Create()
extern "C" DSA_t901 * DSA_Create_m4658 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.DSA System.Security.Cryptography.DSA::Create(System.String)
extern "C" DSA_t901 * DSA_Create_m9282 (Object_t * __this /* static, unused */, String_t* ___algName, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSA::ZeroizePrivateKey(System.Security.Cryptography.DSAParameters)
extern "C" void DSA_ZeroizePrivateKey_m9283 (DSA_t901 * __this, DSAParameters_t928  ___parameters, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSA::FromXmlString(System.String)
extern "C" void DSA_FromXmlString_m9284 (DSA_t901 * __this, String_t* ___xmlString, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.Security.Cryptography.DSA::ToXmlString(System.Boolean)
extern "C" String_t* DSA_ToXmlString_m9285 (DSA_t901 * __this, bool ___includePrivateParameters, const MethodInfo* method) IL2CPP_METHOD_ATTR;

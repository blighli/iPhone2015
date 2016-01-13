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

// System.Security.Cryptography.DSACryptoServiceProvider
struct DSACryptoServiceProvider_t927;
// System.Security.Cryptography.CspParameters
struct CspParameters_t1087;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.Object
struct Object_t;
// System.EventArgs
struct EventArgs_t995;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Security_Cryptography_DSAParameters.h"

// System.Void System.Security.Cryptography.DSACryptoServiceProvider::.ctor()
extern "C" void DSACryptoServiceProvider__ctor_m9286 (DSACryptoServiceProvider_t927 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSACryptoServiceProvider::.ctor(System.Int32)
extern "C" void DSACryptoServiceProvider__ctor_m4667 (DSACryptoServiceProvider_t927 * __this, int32_t ___dwKeySize, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSACryptoServiceProvider::.ctor(System.Int32,System.Security.Cryptography.CspParameters)
extern "C" void DSACryptoServiceProvider__ctor_m9287 (DSACryptoServiceProvider_t927 * __this, int32_t ___dwKeySize, CspParameters_t1087 * ___parameters, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSACryptoServiceProvider::.cctor()
extern "C" void DSACryptoServiceProvider__cctor_m9288 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSACryptoServiceProvider::Finalize()
extern "C" void DSACryptoServiceProvider_Finalize_m9289 (DSACryptoServiceProvider_t927 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Security.Cryptography.DSACryptoServiceProvider::get_KeySize()
extern "C" int32_t DSACryptoServiceProvider_get_KeySize_m9290 (DSACryptoServiceProvider_t927 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Security.Cryptography.DSACryptoServiceProvider::get_PublicOnly()
extern "C" bool DSACryptoServiceProvider_get_PublicOnly_m4657 (DSACryptoServiceProvider_t927 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.DSAParameters System.Security.Cryptography.DSACryptoServiceProvider::ExportParameters(System.Boolean)
extern "C" DSAParameters_t928  DSACryptoServiceProvider_ExportParameters_m9291 (DSACryptoServiceProvider_t927 * __this, bool ___includePrivateParameters, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSACryptoServiceProvider::ImportParameters(System.Security.Cryptography.DSAParameters)
extern "C" void DSACryptoServiceProvider_ImportParameters_m9292 (DSACryptoServiceProvider_t927 * __this, DSAParameters_t928  ___parameters, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] System.Security.Cryptography.DSACryptoServiceProvider::CreateSignature(System.Byte[])
extern "C" ByteU5BU5D_t789* DSACryptoServiceProvider_CreateSignature_m9293 (DSACryptoServiceProvider_t927 * __this, ByteU5BU5D_t789* ___rgbHash, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Security.Cryptography.DSACryptoServiceProvider::VerifySignature(System.Byte[],System.Byte[])
extern "C" bool DSACryptoServiceProvider_VerifySignature_m9294 (DSACryptoServiceProvider_t927 * __this, ByteU5BU5D_t789* ___rgbHash, ByteU5BU5D_t789* ___rgbSignature, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSACryptoServiceProvider::Dispose(System.Boolean)
extern "C" void DSACryptoServiceProvider_Dispose_m9295 (DSACryptoServiceProvider_t927 * __this, bool ___disposing, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.DSACryptoServiceProvider::OnKeyGenerated(System.Object,System.EventArgs)
extern "C" void DSACryptoServiceProvider_OnKeyGenerated_m9296 (DSACryptoServiceProvider_t927 * __this, Object_t * ___sender, EventArgs_t995 * ___e, const MethodInfo* method) IL2CPP_METHOD_ATTR;

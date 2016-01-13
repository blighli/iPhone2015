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

// System.Security.Cryptography.RijndaelTransform
struct RijndaelTransform_t1583;
// System.Security.Cryptography.Rijndael
struct Rijndael_t1099;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.UInt32[]
struct UInt32U5BU5D_t957;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Security.Cryptography.RijndaelTransform::.ctor(System.Security.Cryptography.Rijndael,System.Boolean,System.Byte[],System.Byte[])
extern "C" void RijndaelTransform__ctor_m9453 (RijndaelTransform_t1583 * __this, Rijndael_t1099 * ___algo, bool ___encryption, ByteU5BU5D_t789* ___key, ByteU5BU5D_t789* ___iv, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::.cctor()
extern "C" void RijndaelTransform__cctor_m9454 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::Clear()
extern "C" void RijndaelTransform_Clear_m9455 (RijndaelTransform_t1583 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::ECB(System.Byte[],System.Byte[])
extern "C" void RijndaelTransform_ECB_m9456 (RijndaelTransform_t1583 * __this, ByteU5BU5D_t789* ___input, ByteU5BU5D_t789* ___output, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.UInt32 System.Security.Cryptography.RijndaelTransform::SubByte(System.UInt32)
extern "C" uint32_t RijndaelTransform_SubByte_m9457 (RijndaelTransform_t1583 * __this, uint32_t ___a, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::Encrypt128(System.Byte[],System.Byte[],System.UInt32[])
extern "C" void RijndaelTransform_Encrypt128_m9458 (RijndaelTransform_t1583 * __this, ByteU5BU5D_t789* ___indata, ByteU5BU5D_t789* ___outdata, UInt32U5BU5D_t957* ___ekey, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::Encrypt192(System.Byte[],System.Byte[],System.UInt32[])
extern "C" void RijndaelTransform_Encrypt192_m9459 (RijndaelTransform_t1583 * __this, ByteU5BU5D_t789* ___indata, ByteU5BU5D_t789* ___outdata, UInt32U5BU5D_t957* ___ekey, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::Encrypt256(System.Byte[],System.Byte[],System.UInt32[])
extern "C" void RijndaelTransform_Encrypt256_m9460 (RijndaelTransform_t1583 * __this, ByteU5BU5D_t789* ___indata, ByteU5BU5D_t789* ___outdata, UInt32U5BU5D_t957* ___ekey, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::Decrypt128(System.Byte[],System.Byte[],System.UInt32[])
extern "C" void RijndaelTransform_Decrypt128_m9461 (RijndaelTransform_t1583 * __this, ByteU5BU5D_t789* ___indata, ByteU5BU5D_t789* ___outdata, UInt32U5BU5D_t957* ___ekey, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::Decrypt192(System.Byte[],System.Byte[],System.UInt32[])
extern "C" void RijndaelTransform_Decrypt192_m9462 (RijndaelTransform_t1583 * __this, ByteU5BU5D_t789* ___indata, ByteU5BU5D_t789* ___outdata, UInt32U5BU5D_t957* ___ekey, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelTransform::Decrypt256(System.Byte[],System.Byte[],System.UInt32[])
extern "C" void RijndaelTransform_Decrypt256_m9463 (RijndaelTransform_t1583 * __this, ByteU5BU5D_t789* ___indata, ByteU5BU5D_t789* ___outdata, UInt32U5BU5D_t957* ___ekey, const MethodInfo* method) IL2CPP_METHOD_ATTR;

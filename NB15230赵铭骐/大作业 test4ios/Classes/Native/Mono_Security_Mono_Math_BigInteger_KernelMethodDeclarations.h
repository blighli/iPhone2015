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

// Mono.Math.BigInteger
struct BigInteger_t972;
// Mono.Math.BigInteger[]
struct BigIntegerU5BU5D_t1084;
// System.UInt32[]
struct UInt32U5BU5D_t957;

#include "codegen/il2cpp-codegen.h"
#include "Mono_Security_Mono_Math_BigInteger_Sign.h"

// Mono.Math.BigInteger Mono.Math.BigInteger/Kernel::AddSameSign(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" BigInteger_t972 * Kernel_AddSameSign_m4847 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi1, BigInteger_t972 * ___bi2, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/Kernel::Subtract(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" BigInteger_t972 * Kernel_Subtract_m4848 (Object_t * __this /* static, unused */, BigInteger_t972 * ___big, BigInteger_t972 * ___small, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Math.BigInteger/Kernel::MinusEq(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" void Kernel_MinusEq_m4849 (Object_t * __this /* static, unused */, BigInteger_t972 * ___big, BigInteger_t972 * ___small, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Math.BigInteger/Kernel::PlusEq(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" void Kernel_PlusEq_m4850 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi1, BigInteger_t972 * ___bi2, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger/Sign Mono.Math.BigInteger/Kernel::Compare(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" int32_t Kernel_Compare_m4851 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi1, BigInteger_t972 * ___bi2, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.UInt32 Mono.Math.BigInteger/Kernel::SingleByteDivideInPlace(Mono.Math.BigInteger,System.UInt32)
extern "C" uint32_t Kernel_SingleByteDivideInPlace_m4852 (Object_t * __this /* static, unused */, BigInteger_t972 * ___n, uint32_t ___d, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.UInt32 Mono.Math.BigInteger/Kernel::DwordMod(Mono.Math.BigInteger,System.UInt32)
extern "C" uint32_t Kernel_DwordMod_m4853 (Object_t * __this /* static, unused */, BigInteger_t972 * ___n, uint32_t ___d, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger[] Mono.Math.BigInteger/Kernel::DwordDivMod(Mono.Math.BigInteger,System.UInt32)
extern "C" BigIntegerU5BU5D_t1084* Kernel_DwordDivMod_m4854 (Object_t * __this /* static, unused */, BigInteger_t972 * ___n, uint32_t ___d, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger[] Mono.Math.BigInteger/Kernel::multiByteDivide(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" BigIntegerU5BU5D_t1084* Kernel_multiByteDivide_m4855 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi1, BigInteger_t972 * ___bi2, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/Kernel::LeftShift(Mono.Math.BigInteger,System.Int32)
extern "C" BigInteger_t972 * Kernel_LeftShift_m4856 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi, int32_t ___n, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/Kernel::RightShift(Mono.Math.BigInteger,System.Int32)
extern "C" BigInteger_t972 * Kernel_RightShift_m4857 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi, int32_t ___n, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Math.BigInteger/Kernel::Multiply(System.UInt32[],System.UInt32,System.UInt32,System.UInt32[],System.UInt32,System.UInt32,System.UInt32[],System.UInt32)
extern "C" void Kernel_Multiply_m4858 (Object_t * __this /* static, unused */, UInt32U5BU5D_t957* ___x, uint32_t ___xOffset, uint32_t ___xLen, UInt32U5BU5D_t957* ___y, uint32_t ___yOffset, uint32_t ___yLen, UInt32U5BU5D_t957* ___d, uint32_t ___dOffset, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Math.BigInteger/Kernel::MultiplyMod2p32pmod(System.UInt32[],System.Int32,System.Int32,System.UInt32[],System.Int32,System.Int32,System.UInt32[],System.Int32,System.Int32)
extern "C" void Kernel_MultiplyMod2p32pmod_m4859 (Object_t * __this /* static, unused */, UInt32U5BU5D_t957* ___x, int32_t ___xOffset, int32_t ___xLen, UInt32U5BU5D_t957* ___y, int32_t ___yOffest, int32_t ___yLen, UInt32U5BU5D_t957* ___d, int32_t ___dOffset, int32_t ___mod, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.UInt32 Mono.Math.BigInteger/Kernel::modInverse(Mono.Math.BigInteger,System.UInt32)
extern "C" uint32_t Kernel_modInverse_m4860 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi, uint32_t ___modulus, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/Kernel::modInverse(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" BigInteger_t972 * Kernel_modInverse_m4861 (Object_t * __this /* static, unused */, BigInteger_t972 * ___bi, BigInteger_t972 * ___modulus, const MethodInfo* method) IL2CPP_METHOD_ATTR;

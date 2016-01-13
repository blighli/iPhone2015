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

// Mono.Math.BigInteger/ModulusRing
struct ModulusRing_t971;
// Mono.Math.BigInteger
struct BigInteger_t972;

#include "codegen/il2cpp-codegen.h"

// System.Void Mono.Math.BigInteger/ModulusRing::.ctor(Mono.Math.BigInteger)
extern "C" void ModulusRing__ctor_m4841 (ModulusRing_t971 * __this, BigInteger_t972 * ___modulus, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void Mono.Math.BigInteger/ModulusRing::BarrettReduction(Mono.Math.BigInteger)
extern "C" void ModulusRing_BarrettReduction_m4842 (ModulusRing_t971 * __this, BigInteger_t972 * ___x, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/ModulusRing::Multiply(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" BigInteger_t972 * ModulusRing_Multiply_m4843 (ModulusRing_t971 * __this, BigInteger_t972 * ___a, BigInteger_t972 * ___b, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/ModulusRing::Difference(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" BigInteger_t972 * ModulusRing_Difference_m4844 (ModulusRing_t971 * __this, BigInteger_t972 * ___a, BigInteger_t972 * ___b, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/ModulusRing::Pow(Mono.Math.BigInteger,Mono.Math.BigInteger)
extern "C" BigInteger_t972 * ModulusRing_Pow_m4845 (ModulusRing_t971 * __this, BigInteger_t972 * ___a, BigInteger_t972 * ___k, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// Mono.Math.BigInteger Mono.Math.BigInteger/ModulusRing::Pow(System.UInt32,Mono.Math.BigInteger)
extern "C" BigInteger_t972 * ModulusRing_Pow_m4846 (ModulusRing_t971 * __this, uint32_t ___b, BigInteger_t972 * ___exp, const MethodInfo* method) IL2CPP_METHOD_ATTR;

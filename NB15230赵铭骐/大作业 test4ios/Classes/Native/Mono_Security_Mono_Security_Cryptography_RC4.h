#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Security.Cryptography.KeySizes[]
struct KeySizesU5BU5D_t966;

#include "mscorlib_System_Security_Cryptography_SymmetricAlgorithm.h"

// Mono.Security.Cryptography.RC4
struct  RC4_t984  : public SymmetricAlgorithm_t951
{
};
struct RC4_t984_StaticFields{
	// System.Security.Cryptography.KeySizes[] Mono.Security.Cryptography.RC4::s_legalBlockSizes
	KeySizesU5BU5D_t966* ___s_legalBlockSizes_10;
	// System.Security.Cryptography.KeySizes[] Mono.Security.Cryptography.RC4::s_legalKeySizes
	KeySizesU5BU5D_t966* ___s_legalKeySizes_11;
};

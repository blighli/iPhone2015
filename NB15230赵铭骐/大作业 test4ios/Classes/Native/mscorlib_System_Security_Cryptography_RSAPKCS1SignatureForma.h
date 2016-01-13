#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Security.Cryptography.RSA
struct RSA_t902;
// System.Security.Cryptography.HashAlgorithm
struct HashAlgorithm_t988;

#include "mscorlib_System_Security_Cryptography_AsymmetricSignatureFor.h"

// System.Security.Cryptography.RSAPKCS1SignatureFormatter
struct  RSAPKCS1SignatureFormatter_t1581  : public AsymmetricSignatureFormatter_t1045
{
	// System.Security.Cryptography.RSA System.Security.Cryptography.RSAPKCS1SignatureFormatter::rsa
	RSA_t902 * ___rsa_0;
	// System.Security.Cryptography.HashAlgorithm System.Security.Cryptography.RSAPKCS1SignatureFormatter::hash
	HashAlgorithm_t988 * ___hash_1;
};

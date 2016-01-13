﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Security.Cryptography.X509Certificates.X509ExtensionCollection
struct X509ExtensionCollection_t787;
// System.String
struct String_t;
// System.Security.Cryptography.X509Certificates.PublicKey
struct PublicKey_t775;
// System.Security.Cryptography.X509Certificates.X500DistinguishedName
struct X500DistinguishedName_t781;
// System.Security.Cryptography.Oid
struct Oid_t778;
// Mono.Security.X509.X509Certificate
struct X509Certificate_t788;
// System.Byte[]
struct ByteU5BU5D_t789;

#include "mscorlib_System_Security_Cryptography_X509Certificates_X509C.h"

// System.Security.Cryptography.X509Certificates.X509Certificate2
struct  X509Certificate2_t785  : public X509Certificate_t786
{
	// System.Boolean System.Security.Cryptography.X509Certificates.X509Certificate2::_archived
	bool ____archived_5;
	// System.Security.Cryptography.X509Certificates.X509ExtensionCollection System.Security.Cryptography.X509Certificates.X509Certificate2::_extensions
	X509ExtensionCollection_t787 * ____extensions_6;
	// System.String System.Security.Cryptography.X509Certificates.X509Certificate2::_name
	String_t* ____name_7;
	// System.String System.Security.Cryptography.X509Certificates.X509Certificate2::_serial
	String_t* ____serial_8;
	// System.Security.Cryptography.X509Certificates.PublicKey System.Security.Cryptography.X509Certificates.X509Certificate2::_publicKey
	PublicKey_t775 * ____publicKey_9;
	// System.Security.Cryptography.X509Certificates.X500DistinguishedName System.Security.Cryptography.X509Certificates.X509Certificate2::issuer_name
	X500DistinguishedName_t781 * ___issuer_name_10;
	// System.Security.Cryptography.X509Certificates.X500DistinguishedName System.Security.Cryptography.X509Certificates.X509Certificate2::subject_name
	X500DistinguishedName_t781 * ___subject_name_11;
	// System.Security.Cryptography.Oid System.Security.Cryptography.X509Certificates.X509Certificate2::signature_algorithm
	Oid_t778 * ___signature_algorithm_12;
	// Mono.Security.X509.X509Certificate System.Security.Cryptography.X509Certificates.X509Certificate2::_cert
	X509Certificate_t788 * ____cert_13;
};
struct X509Certificate2_t785_StaticFields{
	// System.String System.Security.Cryptography.X509Certificates.X509Certificate2::empty_error
	String_t* ___empty_error_14;
	// System.Byte[] System.Security.Cryptography.X509Certificates.X509Certificate2::commonName
	ByteU5BU5D_t789* ___commonName_15;
	// System.Byte[] System.Security.Cryptography.X509Certificates.X509Certificate2::email
	ByteU5BU5D_t789* ___email_16;
	// System.Byte[] System.Security.Cryptography.X509Certificates.X509Certificate2::signedData
	ByteU5BU5D_t789* ___signedData_17;
};

﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// Mono.Security.ASN1
struct ASN1_t1191;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.String
struct String_t;
// System.Security.Cryptography.DSA
struct DSA_t901;
// Mono.Security.X509.X509ExtensionCollection
struct X509ExtensionCollection_t1197;

#include "mscorlib_System_Object.h"
#include "mscorlib_System_DateTime.h"

// Mono.Security.X509.X509Certificate
struct  X509Certificate_t1196  : public Object_t
{
	// Mono.Security.ASN1 Mono.Security.X509.X509Certificate::decoder
	ASN1_t1191 * ___decoder_0;
	// System.Byte[] Mono.Security.X509.X509Certificate::m_encodedcert
	ByteU5BU5D_t789* ___m_encodedcert_1;
	// System.DateTime Mono.Security.X509.X509Certificate::m_from
	DateTime_t365  ___m_from_2;
	// System.DateTime Mono.Security.X509.X509Certificate::m_until
	DateTime_t365  ___m_until_3;
	// Mono.Security.ASN1 Mono.Security.X509.X509Certificate::issuer
	ASN1_t1191 * ___issuer_4;
	// System.String Mono.Security.X509.X509Certificate::m_issuername
	String_t* ___m_issuername_5;
	// System.String Mono.Security.X509.X509Certificate::m_keyalgo
	String_t* ___m_keyalgo_6;
	// System.Byte[] Mono.Security.X509.X509Certificate::m_keyalgoparams
	ByteU5BU5D_t789* ___m_keyalgoparams_7;
	// Mono.Security.ASN1 Mono.Security.X509.X509Certificate::subject
	ASN1_t1191 * ___subject_8;
	// System.String Mono.Security.X509.X509Certificate::m_subject
	String_t* ___m_subject_9;
	// System.Byte[] Mono.Security.X509.X509Certificate::m_publickey
	ByteU5BU5D_t789* ___m_publickey_10;
	// System.Byte[] Mono.Security.X509.X509Certificate::signature
	ByteU5BU5D_t789* ___signature_11;
	// System.String Mono.Security.X509.X509Certificate::m_signaturealgo
	String_t* ___m_signaturealgo_12;
	// System.Byte[] Mono.Security.X509.X509Certificate::m_signaturealgoparams
	ByteU5BU5D_t789* ___m_signaturealgoparams_13;
	// System.Security.Cryptography.DSA Mono.Security.X509.X509Certificate::_dsa
	DSA_t901 * ____dsa_14;
	// System.Int32 Mono.Security.X509.X509Certificate::version
	int32_t ___version_15;
	// System.Byte[] Mono.Security.X509.X509Certificate::serialnumber
	ByteU5BU5D_t789* ___serialnumber_16;
	// System.Byte[] Mono.Security.X509.X509Certificate::issuerUniqueID
	ByteU5BU5D_t789* ___issuerUniqueID_17;
	// System.Byte[] Mono.Security.X509.X509Certificate::subjectUniqueID
	ByteU5BU5D_t789* ___subjectUniqueID_18;
	// Mono.Security.X509.X509ExtensionCollection Mono.Security.X509.X509Certificate::extensions
	X509ExtensionCollection_t1197 * ___extensions_19;
};
struct X509Certificate_t1196_StaticFields{
	// System.String Mono.Security.X509.X509Certificate::encoding_error
	String_t* ___encoding_error_20;
};

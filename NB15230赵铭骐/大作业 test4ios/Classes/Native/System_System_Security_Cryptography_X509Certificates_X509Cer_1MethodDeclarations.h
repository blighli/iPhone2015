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

// System.Security.Cryptography.X509Certificates.X509CertificateCollection
struct X509CertificateCollection_t760;
// System.Security.Cryptography.X509Certificates.X509Certificate[]
struct X509CertificateU5BU5D_t904;
// System.Security.Cryptography.X509Certificates.X509Certificate
struct X509Certificate_t786;
// System.Security.Cryptography.X509Certificates.X509CertificateCollection/X509CertificateEnumerator
struct X509CertificateEnumerator_t792;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Security.Cryptography.X509Certificates.X509CertificateCollection::.ctor()
extern "C" void X509CertificateCollection__ctor_m3977 (X509CertificateCollection_t760 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.X509Certificates.X509CertificateCollection::.ctor(System.Security.Cryptography.X509Certificates.X509Certificate[])
extern "C" void X509CertificateCollection__ctor_m3978 (X509CertificateCollection_t760 * __this, X509CertificateU5BU5D_t904* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.X509Certificates.X509Certificate System.Security.Cryptography.X509Certificates.X509CertificateCollection::get_Item(System.Int32)
extern "C" X509Certificate_t786 * X509CertificateCollection_get_Item_m3979 (X509CertificateCollection_t760 * __this, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.X509Certificates.X509CertificateCollection::AddRange(System.Security.Cryptography.X509Certificates.X509Certificate[])
extern "C" void X509CertificateCollection_AddRange_m3980 (X509CertificateCollection_t760 * __this, X509CertificateU5BU5D_t904* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.X509Certificates.X509CertificateCollection/X509CertificateEnumerator System.Security.Cryptography.X509Certificates.X509CertificateCollection::GetEnumerator()
extern "C" X509CertificateEnumerator_t792 * X509CertificateCollection_GetEnumerator_m3981 (X509CertificateCollection_t760 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Security.Cryptography.X509Certificates.X509CertificateCollection::GetHashCode()
extern "C" int32_t X509CertificateCollection_GetHashCode_m3982 (X509CertificateCollection_t760 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

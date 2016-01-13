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

// System.Security.Cryptography.RijndaelManagedTransform
struct RijndaelManagedTransform_t1584;
// System.Security.Cryptography.Rijndael
struct Rijndael_t1099;
// System.Byte[]
struct ByteU5BU5D_t789;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Security.Cryptography.RijndaelManagedTransform::.ctor(System.Security.Cryptography.Rijndael,System.Boolean,System.Byte[],System.Byte[])
extern "C" void RijndaelManagedTransform__ctor_m9464 (RijndaelManagedTransform_t1584 * __this, Rijndael_t1099 * ___algo, bool ___encryption, ByteU5BU5D_t789* ___key, ByteU5BU5D_t789* ___iv, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.RijndaelManagedTransform::System.IDisposable.Dispose()
extern "C" void RijndaelManagedTransform_System_IDisposable_Dispose_m9465 (RijndaelManagedTransform_t1584 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Security.Cryptography.RijndaelManagedTransform::get_CanReuseTransform()
extern "C" bool RijndaelManagedTransform_get_CanReuseTransform_m9466 (RijndaelManagedTransform_t1584 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Security.Cryptography.RijndaelManagedTransform::TransformBlock(System.Byte[],System.Int32,System.Int32,System.Byte[],System.Int32)
extern "C" int32_t RijndaelManagedTransform_TransformBlock_m9467 (RijndaelManagedTransform_t1584 * __this, ByteU5BU5D_t789* ___inputBuffer, int32_t ___inputOffset, int32_t ___inputCount, ByteU5BU5D_t789* ___outputBuffer, int32_t ___outputOffset, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] System.Security.Cryptography.RijndaelManagedTransform::TransformFinalBlock(System.Byte[],System.Int32,System.Int32)
extern "C" ByteU5BU5D_t789* RijndaelManagedTransform_TransformFinalBlock_m9468 (RijndaelManagedTransform_t1584 * __this, ByteU5BU5D_t789* ___inputBuffer, int32_t ___inputOffset, int32_t ___inputCount, const MethodInfo* method) IL2CPP_METHOD_ATTR;

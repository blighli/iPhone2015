﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// System.Security.Cryptography.TripleDES
struct TripleDES_t1098;
// System.Byte[]
struct ByteU5BU5D_t789;
// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Security.Cryptography.TripleDES::.ctor()
extern "C" void TripleDES__ctor_m9559 (TripleDES_t1098 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte[] System.Security.Cryptography.TripleDES::get_Key()
extern "C" ByteU5BU5D_t789* TripleDES_get_Key_m9560 (TripleDES_t1098 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Security.Cryptography.TripleDES::set_Key(System.Byte[])
extern "C" void TripleDES_set_Key_m9561 (TripleDES_t1098 * __this, ByteU5BU5D_t789* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Security.Cryptography.TripleDES::IsWeakKey(System.Byte[])
extern "C" bool TripleDES_IsWeakKey_m9562 (Object_t * __this /* static, unused */, ByteU5BU5D_t789* ___rgbKey, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.TripleDES System.Security.Cryptography.TripleDES::Create()
extern "C" TripleDES_t1098 * TripleDES_Create_m5727 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Security.Cryptography.TripleDES System.Security.Cryptography.TripleDES::Create(System.String)
extern "C" TripleDES_t1098 * TripleDES_Create_m9563 (Object_t * __this /* static, unused */, String_t* ___str, const MethodInfo* method) IL2CPP_METHOD_ATTR;

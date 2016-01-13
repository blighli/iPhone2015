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

// System.Collections.BitArray
struct BitArray_t882;
// System.Object
struct Object_t;
// System.Array
struct Array_t;
// System.Collections.IEnumerator
struct IEnumerator_t133;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Collections.BitArray::.ctor(System.Collections.BitArray)
extern "C" void BitArray__ctor_m7262 (BitArray_t882 * __this, BitArray_t882 * ___bits, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Collections.BitArray::.ctor(System.Int32)
extern "C" void BitArray__ctor_m4766 (BitArray_t882 * __this, int32_t ___length, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Byte System.Collections.BitArray::getByte(System.Int32)
extern "C" uint8_t BitArray_getByte_m7263 (BitArray_t882 * __this, int32_t ___byteIndex, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Collections.BitArray::get_Count()
extern "C" int32_t BitArray_get_Count_m7264 (BitArray_t882 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Collections.BitArray::get_IsSynchronized()
extern "C" bool BitArray_get_IsSynchronized_m7265 (BitArray_t882 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Collections.BitArray::get_Item(System.Int32)
extern "C" bool BitArray_get_Item_m4759 (BitArray_t882 * __this, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Collections.BitArray::set_Item(System.Int32,System.Boolean)
extern "C" void BitArray_set_Item_m4767 (BitArray_t882 * __this, int32_t ___index, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Collections.BitArray::get_Length()
extern "C" int32_t BitArray_get_Length_m4758 (BitArray_t882 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Collections.BitArray::get_SyncRoot()
extern "C" Object_t * BitArray_get_SyncRoot_m7266 (BitArray_t882 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Collections.BitArray::Clone()
extern "C" Object_t * BitArray_Clone_m7267 (BitArray_t882 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Collections.BitArray::CopyTo(System.Array,System.Int32)
extern "C" void BitArray_CopyTo_m7268 (BitArray_t882 * __this, Array_t * ___array, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Collections.BitArray::Get(System.Int32)
extern "C" bool BitArray_Get_m7269 (BitArray_t882 * __this, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Collections.BitArray::Set(System.Int32,System.Boolean)
extern "C" void BitArray_Set_m7270 (BitArray_t882 * __this, int32_t ___index, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Collections.IEnumerator System.Collections.BitArray::GetEnumerator()
extern "C" Object_t * BitArray_GetEnumerator_m7271 (BitArray_t882 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

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

// System.CultureAwareComparer
struct CultureAwareComparer_t1730;
// System.Globalization.CultureInfo
struct CultureInfo_t453;
// System.String
struct String_t;

#include "codegen/il2cpp-codegen.h"

// System.Void System.CultureAwareComparer::.ctor(System.Globalization.CultureInfo,System.Boolean)
extern "C" void CultureAwareComparer__ctor_m10730 (CultureAwareComparer_t1730 * __this, CultureInfo_t453 * ___ci, bool ___ignore_case, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.CultureAwareComparer::Compare(System.String,System.String)
extern "C" int32_t CultureAwareComparer_Compare_m10731 (CultureAwareComparer_t1730 * __this, String_t* ___x, String_t* ___y, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.CultureAwareComparer::Equals(System.String,System.String)
extern "C" bool CultureAwareComparer_Equals_m10732 (CultureAwareComparer_t1730 * __this, String_t* ___x, String_t* ___y, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.CultureAwareComparer::GetHashCode(System.String)
extern "C" int32_t CultureAwareComparer_GetHashCode_m10733 (CultureAwareComparer_t1730 * __this, String_t* ___s, const MethodInfo* method) IL2CPP_METHOD_ATTR;

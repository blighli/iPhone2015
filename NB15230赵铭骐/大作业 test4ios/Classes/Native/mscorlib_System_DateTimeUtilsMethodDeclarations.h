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

// System.String
struct String_t;
// System.Text.StringBuilder
struct StringBuilder_t457;
// System.Globalization.DateTimeFormatInfo
struct DateTimeFormatInfo_t1251;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_DateTime.h"
#include "mscorlib_System_Nullable_1_gen.h"

// System.Int32 System.DateTimeUtils::CountRepeat(System.String,System.Int32,System.Char)
extern "C" int32_t DateTimeUtils_CountRepeat_m10401 (Object_t * __this /* static, unused */, String_t* ___fmt, int32_t ___p, uint16_t ___c, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.DateTimeUtils::ZeroPad(System.Text.StringBuilder,System.Int32,System.Int32)
extern "C" void DateTimeUtils_ZeroPad_m10402 (Object_t * __this /* static, unused */, StringBuilder_t457 * ___output, int32_t ___digits, int32_t ___len, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.DateTimeUtils::ParseQuotedString(System.String,System.Int32,System.Text.StringBuilder)
extern "C" int32_t DateTimeUtils_ParseQuotedString_m10403 (Object_t * __this /* static, unused */, String_t* ___fmt, int32_t ___pos, StringBuilder_t457 * ___output, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.DateTimeUtils::GetStandardPattern(System.Char,System.Globalization.DateTimeFormatInfo,System.Boolean&,System.Boolean&)
extern "C" String_t* DateTimeUtils_GetStandardPattern_m10404 (Object_t * __this /* static, unused */, uint16_t ___format, DateTimeFormatInfo_t1251 * ___dfi, bool* ___useutc, bool* ___use_invariant, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.DateTimeUtils::GetStandardPattern(System.Char,System.Globalization.DateTimeFormatInfo,System.Boolean&,System.Boolean&,System.Boolean)
extern "C" String_t* DateTimeUtils_GetStandardPattern_m10405 (Object_t * __this /* static, unused */, uint16_t ___format, DateTimeFormatInfo_t1251 * ___dfi, bool* ___useutc, bool* ___use_invariant, bool ___date_time_offset, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.DateTimeUtils::ToString(System.DateTime,System.String,System.Globalization.DateTimeFormatInfo)
extern "C" String_t* DateTimeUtils_ToString_m10406 (Object_t * __this /* static, unused */, DateTime_t365  ___dt, String_t* ___format, DateTimeFormatInfo_t1251 * ___dfi, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.DateTimeUtils::ToString(System.DateTime,System.Nullable`1<System.TimeSpan>,System.String,System.Globalization.DateTimeFormatInfo)
extern "C" String_t* DateTimeUtils_ToString_m10407 (Object_t * __this /* static, unused */, DateTime_t365  ___dt, Nullable_1_t1790  ___utc_offset, String_t* ___format, DateTimeFormatInfo_t1251 * ___dfi, const MethodInfo* method) IL2CPP_METHOD_ATTR;

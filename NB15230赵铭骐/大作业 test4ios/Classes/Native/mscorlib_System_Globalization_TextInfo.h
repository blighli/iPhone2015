﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.String
struct String_t;
// System.Globalization.CultureInfo
struct CultureInfo_t453;

#include "mscorlib_System_Object.h"
#include "mscorlib_System_Globalization_TextInfo_Data.h"

// System.Globalization.TextInfo
struct  TextInfo_t1163  : public Object_t
{
	// System.String System.Globalization.TextInfo::m_listSeparator
	String_t* ___m_listSeparator_0;
	// System.Boolean System.Globalization.TextInfo::m_isReadOnly
	bool ___m_isReadOnly_1;
	// System.String System.Globalization.TextInfo::customCultureName
	String_t* ___customCultureName_2;
	// System.Int32 System.Globalization.TextInfo::m_nDataItem
	int32_t ___m_nDataItem_3;
	// System.Boolean System.Globalization.TextInfo::m_useUserOverride
	bool ___m_useUserOverride_4;
	// System.Int32 System.Globalization.TextInfo::m_win32LangID
	int32_t ___m_win32LangID_5;
	// System.Globalization.CultureInfo System.Globalization.TextInfo::ci
	CultureInfo_t453 * ___ci_6;
	// System.Boolean System.Globalization.TextInfo::handleDotI
	bool ___handleDotI_7;
	// System.Globalization.TextInfo/Data System.Globalization.TextInfo::data
	Data_t1259  ___data_8;
};

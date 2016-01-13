#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// Mono.Globalization.Unicode.SimpleCollator
struct SimpleCollator_t1162;
// System.Globalization.TextInfo
struct TextInfo_t1163;
// Mono.Globalization.Unicode.CodePointIndexer
struct CodePointIndexer_t1148;
// Mono.Globalization.Unicode.Contraction[]
struct ContractionU5BU5D_t1164;
// Mono.Globalization.Unicode.Level2Map[]
struct Level2MapU5BU5D_t1165;
// System.Byte[]
struct ByteU5BU5D_t789;

#include "mscorlib_System_Object.h"

// Mono.Globalization.Unicode.SimpleCollator
struct  SimpleCollator_t1162  : public Object_t
{
	// System.Globalization.TextInfo Mono.Globalization.Unicode.SimpleCollator::textInfo
	TextInfo_t1163 * ___textInfo_2;
	// System.Boolean Mono.Globalization.Unicode.SimpleCollator::frenchSort
	bool ___frenchSort_3;
	// System.Byte* Mono.Globalization.Unicode.SimpleCollator::cjkCatTable
	uint8_t* ___cjkCatTable_4;
	// System.Byte* Mono.Globalization.Unicode.SimpleCollator::cjkLv1Table
	uint8_t* ___cjkLv1Table_5;
	// Mono.Globalization.Unicode.CodePointIndexer Mono.Globalization.Unicode.SimpleCollator::cjkIndexer
	CodePointIndexer_t1148 * ___cjkIndexer_6;
	// System.Byte* Mono.Globalization.Unicode.SimpleCollator::cjkLv2Table
	uint8_t* ___cjkLv2Table_7;
	// Mono.Globalization.Unicode.CodePointIndexer Mono.Globalization.Unicode.SimpleCollator::cjkLv2Indexer
	CodePointIndexer_t1148 * ___cjkLv2Indexer_8;
	// System.Int32 Mono.Globalization.Unicode.SimpleCollator::lcid
	int32_t ___lcid_9;
	// Mono.Globalization.Unicode.Contraction[] Mono.Globalization.Unicode.SimpleCollator::contractions
	ContractionU5BU5D_t1164* ___contractions_10;
	// Mono.Globalization.Unicode.Level2Map[] Mono.Globalization.Unicode.SimpleCollator::level2Maps
	Level2MapU5BU5D_t1165* ___level2Maps_11;
	// System.Byte[] Mono.Globalization.Unicode.SimpleCollator::unsafeFlags
	ByteU5BU5D_t789* ___unsafeFlags_12;
};
struct SimpleCollator_t1162_StaticFields{
	// System.Boolean Mono.Globalization.Unicode.SimpleCollator::QuickCheckDisabled
	bool ___QuickCheckDisabled_0;
	// Mono.Globalization.Unicode.SimpleCollator Mono.Globalization.Unicode.SimpleCollator::invariant
	SimpleCollator_t1162 * ___invariant_1;
};

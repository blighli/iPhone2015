﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.IO.BinaryReader
struct BinaryReader_t1262;
// System.Object
struct Object_t;
// System.Runtime.Serialization.IFormatter
struct IFormatter_t1395;
// System.String[]
struct StringU5BU5D_t163;
// System.Int32[]
struct Int32U5BU5D_t420;
// System.Resources.ResourceReader/ResourceInfo[]
struct ResourceInfoU5BU5D_t1393;
// System.Resources.ResourceReader/ResourceCacheItem[]
struct ResourceCacheItemU5BU5D_t1394;

#include "mscorlib_System_Object.h"

// System.Resources.ResourceReader
struct  ResourceReader_t1392  : public Object_t
{
	// System.IO.BinaryReader System.Resources.ResourceReader::reader
	BinaryReader_t1262 * ___reader_0;
	// System.Object System.Resources.ResourceReader::readerLock
	Object_t * ___readerLock_1;
	// System.Runtime.Serialization.IFormatter System.Resources.ResourceReader::formatter
	Object_t * ___formatter_2;
	// System.Int32 System.Resources.ResourceReader::resourceCount
	int32_t ___resourceCount_3;
	// System.Int32 System.Resources.ResourceReader::typeCount
	int32_t ___typeCount_4;
	// System.String[] System.Resources.ResourceReader::typeNames
	StringU5BU5D_t163* ___typeNames_5;
	// System.Int32[] System.Resources.ResourceReader::hashes
	Int32U5BU5D_t420* ___hashes_6;
	// System.Resources.ResourceReader/ResourceInfo[] System.Resources.ResourceReader::infos
	ResourceInfoU5BU5D_t1393* ___infos_7;
	// System.Int32 System.Resources.ResourceReader::dataSectionOffset
	int32_t ___dataSectionOffset_8;
	// System.Int64 System.Resources.ResourceReader::nameSectionOffset
	int64_t ___nameSectionOffset_9;
	// System.Int32 System.Resources.ResourceReader::resource_ver
	int32_t ___resource_ver_10;
	// System.Resources.ResourceReader/ResourceCacheItem[] System.Resources.ResourceReader::cache
	ResourceCacheItemU5BU5D_t1394* ___cache_11;
	// System.Object System.Resources.ResourceReader::cache_lock
	Object_t * ___cache_lock_12;
};

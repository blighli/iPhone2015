#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.AssetBundle
struct AssetBundle_t184;
// System.String
struct String_t;
// System.Type
struct Type_t;

#include "UnityEngine_UnityEngine_AsyncOperation.h"

// UnityEngine.AssetBundleRequest
struct  AssetBundleRequest_t183  : public AsyncOperation_t182
{
	// UnityEngine.AssetBundle UnityEngine.AssetBundleRequest::m_AssetBundle
	AssetBundle_t184 * ___m_AssetBundle_1;
	// System.String UnityEngine.AssetBundleRequest::m_Path
	String_t* ___m_Path_2;
	// System.Type UnityEngine.AssetBundleRequest::m_Type
	Type_t * ___m_Type_3;
};

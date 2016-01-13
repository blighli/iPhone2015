#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Action`1<UnityEngine.Font>
struct Action_1_t311;
// UnityEngine.Font/FontTextureRebuildCallback
struct FontTextureRebuildCallback_t309;

#include "UnityEngine_UnityEngine_Object.h"

// UnityEngine.Font
struct  Font_t310  : public Object_t76
{
	// UnityEngine.Font/FontTextureRebuildCallback UnityEngine.Font::m_FontTextureRebuildCallback
	FontTextureRebuildCallback_t309 * ___m_FontTextureRebuildCallback_3;
};
struct Font_t310_StaticFields{
	// System.Action`1<UnityEngine.Font> UnityEngine.Font::textureRebuilt
	Action_1_t311 * ___textureRebuilt_2;
};

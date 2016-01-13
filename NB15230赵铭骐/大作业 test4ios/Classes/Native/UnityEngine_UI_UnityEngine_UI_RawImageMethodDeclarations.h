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

// UnityEngine.UI.RawImage
struct RawImage_t592;
// UnityEngine.Texture
struct Texture_t214;
// UnityEngine.UI.VertexHelper
struct VertexHelper_t562;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Rect.h"

// System.Void UnityEngine.UI.RawImage::.ctor()
extern "C" void RawImage__ctor_m2849 (RawImage_t592 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Texture UnityEngine.UI.RawImage::get_mainTexture()
extern "C" Texture_t214 * RawImage_get_mainTexture_m2850 (RawImage_t592 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Texture UnityEngine.UI.RawImage::get_texture()
extern "C" Texture_t214 * RawImage_get_texture_m2851 (RawImage_t592 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.RawImage::set_texture(UnityEngine.Texture)
extern "C" void RawImage_set_texture_m2852 (RawImage_t592 * __this, Texture_t214 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Rect UnityEngine.UI.RawImage::get_uvRect()
extern "C" Rect_t232  RawImage_get_uvRect_m2853 (RawImage_t592 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.RawImage::set_uvRect(UnityEngine.Rect)
extern "C" void RawImage_set_uvRect_m2854 (RawImage_t592 * __this, Rect_t232  ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.RawImage::SetNativeSize()
extern "C" void RawImage_SetNativeSize_m2855 (RawImage_t592 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.RawImage::OnPopulateMesh(UnityEngine.UI.VertexHelper)
extern "C" void RawImage_OnPopulateMesh_m2856 (RawImage_t592 * __this, VertexHelper_t562 * ___vh, const MethodInfo* method) IL2CPP_METHOD_ATTR;

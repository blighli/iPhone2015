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

// UnityEngine.Renderer
struct Renderer_t142;
// UnityEngine.Material[]
struct MaterialU5BU5D_t159;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Bounds.h"

// UnityEngine.Material[] UnityEngine.Renderer::get_materials()
extern "C" MaterialU5BU5D_t159* Renderer_get_materials_m627 (Renderer_t142 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Renderer::set_materials(UnityEngine.Material[])
extern "C" void Renderer_set_materials_m632 (Renderer_t142 * __this, MaterialU5BU5D_t159* ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Material[] UnityEngine.Renderer::get_sharedMaterials()
extern "C" MaterialU5BU5D_t159* Renderer_get_sharedMaterials_m625 (Renderer_t142 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Bounds UnityEngine.Renderer::get_bounds()
extern "C" Bounds_t141  Renderer_get_bounds_m505 (Renderer_t142 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Renderer::INTERNAL_get_bounds(UnityEngine.Bounds&)
extern "C" void Renderer_INTERNAL_get_bounds_m886 (Renderer_t142 * __this, Bounds_t141 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.Renderer::get_sortingLayerID()
extern "C" int32_t Renderer_get_sortingLayerID_m887 (Renderer_t142 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.Renderer::get_sortingOrder()
extern "C" int32_t Renderer_get_sortingOrder_m888 (Renderer_t142 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

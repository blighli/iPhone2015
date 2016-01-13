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

// UnityEngine.CanvasRenderer
struct CanvasRenderer_t324;
// UnityEngine.Material
struct Material_t160;
// UnityEngine.Texture
struct Texture_t214;
// UnityEngine.Mesh
struct Mesh_t208;
// System.Collections.Generic.List`1<UnityEngine.UIVertex>
struct List_1_t316;
// System.Collections.Generic.List`1<UnityEngine.Vector3>
struct List_1_t412;
// System.Collections.Generic.List`1<UnityEngine.Color32>
struct List_1_t418;
// System.Collections.Generic.List`1<UnityEngine.Vector2>
struct List_1_t416;
// System.Collections.Generic.List`1<UnityEngine.Vector4>
struct List_1_t414;
// System.Collections.Generic.List`1<System.Int32>
struct List_1_t419;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Color.h"
#include "UnityEngine_UnityEngine_Rect.h"

// System.Void UnityEngine.CanvasRenderer::SetColor(UnityEngine.Color)
extern "C" void CanvasRenderer_SetColor_m1726 (CanvasRenderer_t324 * __this, Color_t139  ___color, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::INTERNAL_CALL_SetColor(UnityEngine.CanvasRenderer,UnityEngine.Color&)
extern "C" void CanvasRenderer_INTERNAL_CALL_SetColor_m1727 (Object_t * __this /* static, unused */, CanvasRenderer_t324 * ___self, Color_t139 * ___color, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Color UnityEngine.CanvasRenderer::GetColor()
extern "C" Color_t139  CanvasRenderer_GetColor_m1728 (CanvasRenderer_t324 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::EnableRectClipping(UnityEngine.Rect)
extern "C" void CanvasRenderer_EnableRectClipping_m1729 (CanvasRenderer_t324 * __this, Rect_t232  ___rect, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::INTERNAL_CALL_EnableRectClipping(UnityEngine.CanvasRenderer,UnityEngine.Rect&)
extern "C" void CanvasRenderer_INTERNAL_CALL_EnableRectClipping_m1730 (Object_t * __this /* static, unused */, CanvasRenderer_t324 * ___self, Rect_t232 * ___rect, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::DisableRectClipping()
extern "C" void CanvasRenderer_DisableRectClipping_m1731 (CanvasRenderer_t324 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::set_hasPopInstruction(System.Boolean)
extern "C" void CanvasRenderer_set_hasPopInstruction_m1732 (CanvasRenderer_t324 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.CanvasRenderer::get_materialCount()
extern "C" int32_t CanvasRenderer_get_materialCount_m1733 (CanvasRenderer_t324 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::set_materialCount(System.Int32)
extern "C" void CanvasRenderer_set_materialCount_m1734 (CanvasRenderer_t324 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SetMaterial(UnityEngine.Material,System.Int32)
extern "C" void CanvasRenderer_SetMaterial_m1735 (CanvasRenderer_t324 * __this, Material_t160 * ___material, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SetMaterial(UnityEngine.Material,UnityEngine.Texture)
extern "C" void CanvasRenderer_SetMaterial_m1736 (CanvasRenderer_t324 * __this, Material_t160 * ___material, Texture_t214 * ___texture, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::set_popMaterialCount(System.Int32)
extern "C" void CanvasRenderer_set_popMaterialCount_m1737 (CanvasRenderer_t324 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SetPopMaterial(UnityEngine.Material,System.Int32)
extern "C" void CanvasRenderer_SetPopMaterial_m1738 (CanvasRenderer_t324 * __this, Material_t160 * ___material, int32_t ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SetTexture(UnityEngine.Texture)
extern "C" void CanvasRenderer_SetTexture_m1739 (CanvasRenderer_t324 * __this, Texture_t214 * ___texture, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SetMesh(UnityEngine.Mesh)
extern "C" void CanvasRenderer_SetMesh_m1740 (CanvasRenderer_t324 * __this, Mesh_t208 * ___mesh, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::Clear()
extern "C" void CanvasRenderer_Clear_m1741 (CanvasRenderer_t324 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SplitUIVertexStreams(System.Collections.Generic.List`1<UnityEngine.UIVertex>,System.Collections.Generic.List`1<UnityEngine.Vector3>,System.Collections.Generic.List`1<UnityEngine.Color32>,System.Collections.Generic.List`1<UnityEngine.Vector2>,System.Collections.Generic.List`1<UnityEngine.Vector2>,System.Collections.Generic.List`1<UnityEngine.Vector3>,System.Collections.Generic.List`1<UnityEngine.Vector4>,System.Collections.Generic.List`1<System.Int32>)
extern "C" void CanvasRenderer_SplitUIVertexStreams_m1742 (Object_t * __this /* static, unused */, List_1_t316 * ___verts, List_1_t412 * ___positions, List_1_t418 * ___colors, List_1_t416 * ___uv0S, List_1_t416 * ___uv1S, List_1_t412 * ___normals, List_1_t414 * ___tangents, List_1_t419 * ___indicies, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SplitUIVertexStreamsInternal(System.Object,System.Object,System.Object,System.Object,System.Object,System.Object,System.Object)
extern "C" void CanvasRenderer_SplitUIVertexStreamsInternal_m1743 (Object_t * __this /* static, unused */, Object_t * ___verts, Object_t * ___positions, Object_t * ___colors, Object_t * ___uv0S, Object_t * ___uv1S, Object_t * ___normals, Object_t * ___tangents, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::SplitIndiciesStreamsInternal(System.Object,System.Object)
extern "C" void CanvasRenderer_SplitIndiciesStreamsInternal_m1744 (Object_t * __this /* static, unused */, Object_t * ___verts, Object_t * ___indicies, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::CreateUIVertexStream(System.Collections.Generic.List`1<UnityEngine.UIVertex>,System.Collections.Generic.List`1<UnityEngine.Vector3>,System.Collections.Generic.List`1<UnityEngine.Color32>,System.Collections.Generic.List`1<UnityEngine.Vector2>,System.Collections.Generic.List`1<UnityEngine.Vector2>,System.Collections.Generic.List`1<UnityEngine.Vector3>,System.Collections.Generic.List`1<UnityEngine.Vector4>,System.Collections.Generic.List`1<System.Int32>)
extern "C" void CanvasRenderer_CreateUIVertexStream_m1745 (Object_t * __this /* static, unused */, List_1_t316 * ___verts, List_1_t412 * ___positions, List_1_t418 * ___colors, List_1_t416 * ___uv0S, List_1_t416 * ___uv1S, List_1_t412 * ___normals, List_1_t414 * ___tangents, List_1_t419 * ___indicies, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::CreateUIVertexStreamInternal(System.Object,System.Object,System.Object,System.Object,System.Object,System.Object,System.Object,System.Object)
extern "C" void CanvasRenderer_CreateUIVertexStreamInternal_m1746 (Object_t * __this /* static, unused */, Object_t * ___verts, Object_t * ___positions, Object_t * ___colors, Object_t * ___uv0S, Object_t * ___uv1S, Object_t * ___normals, Object_t * ___tangents, Object_t * ___indicies, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.CanvasRenderer::get_cull()
extern "C" bool CanvasRenderer_get_cull_m1747 (CanvasRenderer_t324 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.CanvasRenderer::set_cull(System.Boolean)
extern "C" void CanvasRenderer_set_cull_m1748 (CanvasRenderer_t324 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.CanvasRenderer::get_absoluteDepth()
extern "C" int32_t CanvasRenderer_get_absoluteDepth_m1749 (CanvasRenderer_t324 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.CanvasRenderer::get_hasMoved()
extern "C" bool CanvasRenderer_get_hasMoved_m1750 (CanvasRenderer_t324 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

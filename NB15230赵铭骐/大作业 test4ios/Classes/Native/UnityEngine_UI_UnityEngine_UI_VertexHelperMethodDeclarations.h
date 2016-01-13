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

// UnityEngine.UI.VertexHelper
struct VertexHelper_t562;
// UnityEngine.Mesh
struct Mesh_t208;
// UnityEngine.UIVertex[]
struct UIVertexU5BU5D_t425;
// System.Collections.Generic.List`1<UnityEngine.UIVertex>
struct List_1_t316;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_UIVertex.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "UnityEngine_UnityEngine_Color32.h"
#include "UnityEngine_UnityEngine_Vector2.h"
#include "UnityEngine_UnityEngine_Vector4.h"

// System.Void UnityEngine.UI.VertexHelper::.ctor()
extern "C" void VertexHelper__ctor_m3407 (VertexHelper_t562 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::.ctor(UnityEngine.Mesh)
extern "C" void VertexHelper__ctor_m3408 (VertexHelper_t562 * __this, Mesh_t208 * ___m, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::.cctor()
extern "C" void VertexHelper__cctor_m3409 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::Clear()
extern "C" void VertexHelper_Clear_m3410 (VertexHelper_t562 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.UI.VertexHelper::get_currentVertCount()
extern "C" int32_t VertexHelper_get_currentVertCount_m3411 (VertexHelper_t562 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::PopulateUIVertex(UnityEngine.UIVertex&,System.Int32)
extern "C" void VertexHelper_PopulateUIVertex_m3412 (VertexHelper_t562 * __this, UIVertex_t323 * ___vertex, int32_t ___i, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::SetUIVertex(UnityEngine.UIVertex,System.Int32)
extern "C" void VertexHelper_SetUIVertex_m3413 (VertexHelper_t562 * __this, UIVertex_t323  ___vertex, int32_t ___i, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::FillMesh(UnityEngine.Mesh)
extern "C" void VertexHelper_FillMesh_m3414 (VertexHelper_t562 * __this, Mesh_t208 * ___mesh, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::Dispose()
extern "C" void VertexHelper_Dispose_m3415 (VertexHelper_t562 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::AddVert(UnityEngine.Vector3,UnityEngine.Color32,UnityEngine.Vector2,UnityEngine.Vector2,UnityEngine.Vector3,UnityEngine.Vector4)
extern "C" void VertexHelper_AddVert_m3416 (VertexHelper_t562 * __this, Vector3_t4  ___position, Color32_t231  ___color, Vector2_t6  ___uv0, Vector2_t6  ___uv1, Vector3_t4  ___normal, Vector4_t234  ___tangent, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::AddVert(UnityEngine.Vector3,UnityEngine.Color32,UnityEngine.Vector2)
extern "C" void VertexHelper_AddVert_m3417 (VertexHelper_t562 * __this, Vector3_t4  ___position, Color32_t231  ___color, Vector2_t6  ___uv0, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::AddVert(UnityEngine.UIVertex)
extern "C" void VertexHelper_AddVert_m3418 (VertexHelper_t562 * __this, UIVertex_t323  ___v, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::AddTriangle(System.Int32,System.Int32,System.Int32)
extern "C" void VertexHelper_AddTriangle_m3419 (VertexHelper_t562 * __this, int32_t ___idx0, int32_t ___idx1, int32_t ___idx2, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::AddUIVertexQuad(UnityEngine.UIVertex[])
extern "C" void VertexHelper_AddUIVertexQuad_m3420 (VertexHelper_t562 * __this, UIVertexU5BU5D_t425* ___verts, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::AddUIVertexTriangleStream(System.Collections.Generic.List`1<UnityEngine.UIVertex>)
extern "C" void VertexHelper_AddUIVertexTriangleStream_m3421 (VertexHelper_t562 * __this, List_1_t316 * ___verts, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.VertexHelper::GetUIVertexStream(System.Collections.Generic.List`1<UnityEngine.UIVertex>)
extern "C" void VertexHelper_GetUIVertexStream_m3422 (VertexHelper_t562 * __this, List_1_t316 * ___stream, const MethodInfo* method) IL2CPP_METHOD_ATTR;

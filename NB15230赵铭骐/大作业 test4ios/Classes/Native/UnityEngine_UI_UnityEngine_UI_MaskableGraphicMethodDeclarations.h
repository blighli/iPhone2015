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

// UnityEngine.UI.MaskableGraphic
struct MaskableGraphic_t571;
// UnityEngine.UI.MaskableGraphic/CullStateChangedEvent
struct CullStateChangedEvent_t585;
// UnityEngine.Material
struct Material_t160;
// UnityEngine.RectTransform
struct RectTransform_t242;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Rect.h"

// System.Void UnityEngine.UI.MaskableGraphic::.ctor()
extern "C" void MaskableGraphic__ctor_m2813 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.UI.MaskableGraphic/CullStateChangedEvent UnityEngine.UI.MaskableGraphic::get_onCullStateChanged()
extern "C" CullStateChangedEvent_t585 * MaskableGraphic_get_onCullStateChanged_m2814 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::set_onCullStateChanged(UnityEngine.UI.MaskableGraphic/CullStateChangedEvent)
extern "C" void MaskableGraphic_set_onCullStateChanged_m2815 (MaskableGraphic_t571 * __this, CullStateChangedEvent_t585 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.UI.MaskableGraphic::get_maskable()
extern "C" bool MaskableGraphic_get_maskable_m2816 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::set_maskable(System.Boolean)
extern "C" void MaskableGraphic_set_maskable_m2817 (MaskableGraphic_t571 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Material UnityEngine.UI.MaskableGraphic::GetModifiedMaterial(UnityEngine.Material)
extern "C" Material_t160 * MaskableGraphic_GetModifiedMaterial_m2818 (MaskableGraphic_t571 * __this, Material_t160 * ___baseMaterial, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::Cull(UnityEngine.Rect,System.Boolean)
extern "C" void MaskableGraphic_Cull_m2819 (MaskableGraphic_t571 * __this, Rect_t232  ___clipRect, bool ___validRect, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::SetClipRect(UnityEngine.Rect,System.Boolean)
extern "C" void MaskableGraphic_SetClipRect_m2820 (MaskableGraphic_t571 * __this, Rect_t232  ___clipRect, bool ___validRect, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::OnEnable()
extern "C" void MaskableGraphic_OnEnable_m2821 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::OnDisable()
extern "C" void MaskableGraphic_OnDisable_m2822 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::OnTransformParentChanged()
extern "C" void MaskableGraphic_OnTransformParentChanged_m2823 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::ParentMaskStateChanged()
extern "C" void MaskableGraphic_ParentMaskStateChanged_m2824 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::OnCanvasHierarchyChanged()
extern "C" void MaskableGraphic_OnCanvasHierarchyChanged_m2825 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Rect UnityEngine.UI.MaskableGraphic::get_canvasRect()
extern "C" Rect_t232  MaskableGraphic_get_canvasRect_m2826 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::UpdateClipParent()
extern "C" void MaskableGraphic_UpdateClipParent_m2827 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::RecalculateClipping()
extern "C" void MaskableGraphic_RecalculateClipping_m2828 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.MaskableGraphic::RecalculateMasking()
extern "C" void MaskableGraphic_RecalculateMasking_m2829 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.RectTransform UnityEngine.UI.MaskableGraphic::UnityEngine.UI.IClippable.get_rectTransform()
extern "C" RectTransform_t242 * MaskableGraphic_UnityEngine_UI_IClippable_get_rectTransform_m2830 (MaskableGraphic_t571 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

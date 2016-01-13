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

// UnityEngine.RectTransform
struct RectTransform_t242;
// UnityEngine.Camera
struct Camera_t28;
// UnityEngine.Transform
struct Transform_t3;
// UnityEngine.Canvas
struct Canvas_t321;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector2.h"
#include "UnityEngine_UnityEngine_Rect.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "UnityEngine_UnityEngine_Ray.h"

// System.Void UnityEngine.RectTransformUtility::.cctor()
extern "C" void RectTransformUtility__cctor_m1751 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.RectTransformUtility::RectangleContainsScreenPoint(UnityEngine.RectTransform,UnityEngine.Vector2,UnityEngine.Camera)
extern "C" bool RectTransformUtility_RectangleContainsScreenPoint_m1752 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, Vector2_t6  ___screenPoint, Camera_t28 * ___cam, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.RectTransformUtility::INTERNAL_CALL_RectangleContainsScreenPoint(UnityEngine.RectTransform,UnityEngine.Vector2&,UnityEngine.Camera)
extern "C" bool RectTransformUtility_INTERNAL_CALL_RectangleContainsScreenPoint_m1753 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, Vector2_t6 * ___screenPoint, Camera_t28 * ___cam, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector2 UnityEngine.RectTransformUtility::PixelAdjustPoint(UnityEngine.Vector2,UnityEngine.Transform,UnityEngine.Canvas)
extern "C" Vector2_t6  RectTransformUtility_PixelAdjustPoint_m1754 (Object_t * __this /* static, unused */, Vector2_t6  ___point, Transform_t3 * ___elementTransform, Canvas_t321 * ___canvas, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.RectTransformUtility::PixelAdjustPoint(UnityEngine.Vector2,UnityEngine.Transform,UnityEngine.Canvas,UnityEngine.Vector2&)
extern "C" void RectTransformUtility_PixelAdjustPoint_m1755 (Object_t * __this /* static, unused */, Vector2_t6  ___point, Transform_t3 * ___elementTransform, Canvas_t321 * ___canvas, Vector2_t6 * ___output, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.RectTransformUtility::INTERNAL_CALL_PixelAdjustPoint(UnityEngine.Vector2&,UnityEngine.Transform,UnityEngine.Canvas,UnityEngine.Vector2&)
extern "C" void RectTransformUtility_INTERNAL_CALL_PixelAdjustPoint_m1756 (Object_t * __this /* static, unused */, Vector2_t6 * ___point, Transform_t3 * ___elementTransform, Canvas_t321 * ___canvas, Vector2_t6 * ___output, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Rect UnityEngine.RectTransformUtility::PixelAdjustRect(UnityEngine.RectTransform,UnityEngine.Canvas)
extern "C" Rect_t232  RectTransformUtility_PixelAdjustRect_m1757 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rectTransform, Canvas_t321 * ___canvas, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.RectTransformUtility::ScreenPointToWorldPointInRectangle(UnityEngine.RectTransform,UnityEngine.Vector2,UnityEngine.Camera,UnityEngine.Vector3&)
extern "C" bool RectTransformUtility_ScreenPointToWorldPointInRectangle_m1758 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, Vector2_t6  ___screenPoint, Camera_t28 * ___cam, Vector3_t4 * ___worldPoint, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.RectTransformUtility::ScreenPointToLocalPointInRectangle(UnityEngine.RectTransform,UnityEngine.Vector2,UnityEngine.Camera,UnityEngine.Vector2&)
extern "C" bool RectTransformUtility_ScreenPointToLocalPointInRectangle_m1759 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, Vector2_t6  ___screenPoint, Camera_t28 * ___cam, Vector2_t6 * ___localPoint, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Ray UnityEngine.RectTransformUtility::ScreenPointToRay(UnityEngine.Camera,UnityEngine.Vector2)
extern "C" Ray_t24  RectTransformUtility_ScreenPointToRay_m1760 (Object_t * __this /* static, unused */, Camera_t28 * ___cam, Vector2_t6  ___screenPos, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.RectTransformUtility::FlipLayoutOnAxis(UnityEngine.RectTransform,System.Int32,System.Boolean,System.Boolean)
extern "C" void RectTransformUtility_FlipLayoutOnAxis_m1761 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, int32_t ___axis, bool ___keepPositioning, bool ___recursive, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.RectTransformUtility::FlipLayoutAxes(UnityEngine.RectTransform,System.Boolean,System.Boolean)
extern "C" void RectTransformUtility_FlipLayoutAxes_m1762 (Object_t * __this /* static, unused */, RectTransform_t242 * ___rect, bool ___keepPositioning, bool ___recursive, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector2 UnityEngine.RectTransformUtility::GetTransposed(UnityEngine.Vector2)
extern "C" Vector2_t6  RectTransformUtility_GetTransposed_m1763 (Object_t * __this /* static, unused */, Vector2_t6  ___input, const MethodInfo* method) IL2CPP_METHOD_ATTR;

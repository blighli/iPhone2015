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

// UnityEngine.UI.GraphicRaycaster
struct GraphicRaycaster_t564;
// UnityEngine.Canvas
struct Canvas_t321;
// UnityEngine.EventSystems.PointerEventData
struct PointerEventData_t131;
// System.Collections.Generic.List`1<UnityEngine.EventSystems.RaycastResult>
struct List_1_t514;
// UnityEngine.Camera
struct Camera_t28;
// System.Collections.Generic.List`1<UnityEngine.UI.Graphic>
struct List_1_t565;
// UnityEngine.UI.Graphic
struct Graphic_t560;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UI_UnityEngine_UI_GraphicRaycaster_BlockingObjec.h"
#include "UnityEngine_UnityEngine_Vector2.h"

// System.Void UnityEngine.UI.GraphicRaycaster::.ctor()
extern "C" void GraphicRaycaster__ctor_m2586 (GraphicRaycaster_t564 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.GraphicRaycaster::.cctor()
extern "C" void GraphicRaycaster__cctor_m2587 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.UI.GraphicRaycaster::get_sortOrderPriority()
extern "C" int32_t GraphicRaycaster_get_sortOrderPriority_m2588 (GraphicRaycaster_t564 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.UI.GraphicRaycaster::get_renderOrderPriority()
extern "C" int32_t GraphicRaycaster_get_renderOrderPriority_m2589 (GraphicRaycaster_t564 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.UI.GraphicRaycaster::get_ignoreReversedGraphics()
extern "C" bool GraphicRaycaster_get_ignoreReversedGraphics_m2590 (GraphicRaycaster_t564 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.GraphicRaycaster::set_ignoreReversedGraphics(System.Boolean)
extern "C" void GraphicRaycaster_set_ignoreReversedGraphics_m2591 (GraphicRaycaster_t564 * __this, bool ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.UI.GraphicRaycaster/BlockingObjects UnityEngine.UI.GraphicRaycaster::get_blockingObjects()
extern "C" int32_t GraphicRaycaster_get_blockingObjects_m2592 (GraphicRaycaster_t564 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.GraphicRaycaster::set_blockingObjects(UnityEngine.UI.GraphicRaycaster/BlockingObjects)
extern "C" void GraphicRaycaster_set_blockingObjects_m2593 (GraphicRaycaster_t564 * __this, int32_t ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Canvas UnityEngine.UI.GraphicRaycaster::get_canvas()
extern "C" Canvas_t321 * GraphicRaycaster_get_canvas_m2594 (GraphicRaycaster_t564 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.GraphicRaycaster::Raycast(UnityEngine.EventSystems.PointerEventData,System.Collections.Generic.List`1<UnityEngine.EventSystems.RaycastResult>)
extern "C" void GraphicRaycaster_Raycast_m2595 (GraphicRaycaster_t564 * __this, PointerEventData_t131 * ___eventData, List_1_t514 * ___resultAppendList, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Camera UnityEngine.UI.GraphicRaycaster::get_eventCamera()
extern "C" Camera_t28 * GraphicRaycaster_get_eventCamera_m2596 (GraphicRaycaster_t564 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.UI.GraphicRaycaster::Raycast(UnityEngine.Canvas,UnityEngine.Camera,UnityEngine.Vector2,System.Collections.Generic.List`1<UnityEngine.UI.Graphic>)
extern "C" void GraphicRaycaster_Raycast_m2597 (Object_t * __this /* static, unused */, Canvas_t321 * ___canvas, Camera_t28 * ___eventCamera, Vector2_t6  ___pointerPosition, List_1_t565 * ___results, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.UI.GraphicRaycaster::<Raycast>m__3(UnityEngine.UI.Graphic,UnityEngine.UI.Graphic)
extern "C" int32_t GraphicRaycaster_U3CRaycastU3Em__3_m2598 (Object_t * __this /* static, unused */, Graphic_t560 * ___g1, Graphic_t560 * ___g2, const MethodInfo* method) IL2CPP_METHOD_ATTR;

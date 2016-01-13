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

// UnityEngine.EventSystems.PointerInputModule
struct PointerInputModule_t519;
// UnityEngine.EventSystems.PointerEventData
struct PointerEventData_t131;
// UnityEngine.EventSystems.PointerInputModule/MouseState
struct MouseState_t517;
// System.String
struct String_t;
// UnityEngine.GameObject
struct GameObject_t77;
// UnityEngine.EventSystems.BaseEventData
struct BaseEventData_t477;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Touch.h"
#include "UnityEngine_UI_UnityEngine_EventSystems_PointerEventData_Fra.h"
#include "UnityEngine_UnityEngine_Vector2.h"

// System.Void UnityEngine.EventSystems.PointerInputModule::.ctor()
extern "C" void PointerInputModule__ctor_m2282 (PointerInputModule_t519 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.EventSystems.PointerInputModule::GetPointerData(System.Int32,UnityEngine.EventSystems.PointerEventData&,System.Boolean)
extern "C" bool PointerInputModule_GetPointerData_m2283 (PointerInputModule_t519 * __this, int32_t ___id, PointerEventData_t131 ** ___data, bool ___create, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.EventSystems.PointerInputModule::RemovePointerData(UnityEngine.EventSystems.PointerEventData)
extern "C" void PointerInputModule_RemovePointerData_m2284 (PointerInputModule_t519 * __this, PointerEventData_t131 * ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.EventSystems.PointerEventData UnityEngine.EventSystems.PointerInputModule::GetTouchPointerEventData(UnityEngine.Touch,System.Boolean&,System.Boolean&)
extern "C" PointerEventData_t131 * PointerInputModule_GetTouchPointerEventData_m2285 (PointerInputModule_t519 * __this, Touch_t155  ___input, bool* ___pressed, bool* ___released, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.EventSystems.PointerInputModule::CopyFromTo(UnityEngine.EventSystems.PointerEventData,UnityEngine.EventSystems.PointerEventData)
extern "C" void PointerInputModule_CopyFromTo_m2286 (PointerInputModule_t519 * __this, PointerEventData_t131 * ___from, PointerEventData_t131 * ___to, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.EventSystems.PointerEventData/FramePressState UnityEngine.EventSystems.PointerInputModule::StateForMouseButton(System.Int32)
extern "C" int32_t PointerInputModule_StateForMouseButton_m2287 (Object_t * __this /* static, unused */, int32_t ___buttonId, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.EventSystems.PointerInputModule/MouseState UnityEngine.EventSystems.PointerInputModule::GetMousePointerEventData()
extern "C" MouseState_t517 * PointerInputModule_GetMousePointerEventData_m2288 (PointerInputModule_t519 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.EventSystems.PointerInputModule/MouseState UnityEngine.EventSystems.PointerInputModule::GetMousePointerEventData(System.Int32)
extern "C" MouseState_t517 * PointerInputModule_GetMousePointerEventData_m2289 (PointerInputModule_t519 * __this, int32_t ___id, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.EventSystems.PointerEventData UnityEngine.EventSystems.PointerInputModule::GetLastPointerEventData(System.Int32)
extern "C" PointerEventData_t131 * PointerInputModule_GetLastPointerEventData_m2290 (PointerInputModule_t519 * __this, int32_t ___id, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.EventSystems.PointerInputModule::ShouldStartDrag(UnityEngine.Vector2,UnityEngine.Vector2,System.Single,System.Boolean)
extern "C" bool PointerInputModule_ShouldStartDrag_m2291 (Object_t * __this /* static, unused */, Vector2_t6  ___pressPos, Vector2_t6  ___currentPos, float ___threshold, bool ___useDragThreshold, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.EventSystems.PointerInputModule::ProcessMove(UnityEngine.EventSystems.PointerEventData)
extern "C" void PointerInputModule_ProcessMove_m2292 (PointerInputModule_t519 * __this, PointerEventData_t131 * ___pointerEvent, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.EventSystems.PointerInputModule::ProcessDrag(UnityEngine.EventSystems.PointerEventData)
extern "C" void PointerInputModule_ProcessDrag_m2293 (PointerInputModule_t519 * __this, PointerEventData_t131 * ___pointerEvent, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.EventSystems.PointerInputModule::IsPointerOverGameObject(System.Int32)
extern "C" bool PointerInputModule_IsPointerOverGameObject_m2294 (PointerInputModule_t519 * __this, int32_t ___pointerId, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.EventSystems.PointerInputModule::ClearSelection()
extern "C" void PointerInputModule_ClearSelection_m2295 (PointerInputModule_t519 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String UnityEngine.EventSystems.PointerInputModule::ToString()
extern "C" String_t* PointerInputModule_ToString_m2296 (PointerInputModule_t519 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.EventSystems.PointerInputModule::DeselectIfSelectionChanged(UnityEngine.GameObject,UnityEngine.EventSystems.BaseEventData)
extern "C" void PointerInputModule_DeselectIfSelectionChanged_m2297 (PointerInputModule_t519 * __this, GameObject_t77 * ___currentOverGo, BaseEventData_t477 * ___pointerEvent, const MethodInfo* method) IL2CPP_METHOD_ATTR;

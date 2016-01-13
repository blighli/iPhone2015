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

// UnityEngine.EventSystems.PointerInputModule/MouseState
struct MouseState_t517;
// UnityEngine.EventSystems.PointerInputModule/ButtonState
struct ButtonState_t515;
// UnityEngine.EventSystems.PointerEventData
struct PointerEventData_t131;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UI_UnityEngine_EventSystems_PointerEventData_Inp.h"
#include "UnityEngine_UI_UnityEngine_EventSystems_PointerEventData_Fra.h"

// System.Void UnityEngine.EventSystems.PointerInputModule/MouseState::.ctor()
extern "C" void MouseState__ctor_m2276 (MouseState_t517 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.EventSystems.PointerInputModule/ButtonState UnityEngine.EventSystems.PointerInputModule/MouseState::GetButtonState(UnityEngine.EventSystems.PointerEventData/InputButton)
extern "C" ButtonState_t515 * MouseState_GetButtonState_m2277 (MouseState_t517 * __this, int32_t ___button, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.EventSystems.PointerInputModule/MouseState::SetButtonState(UnityEngine.EventSystems.PointerEventData/InputButton,UnityEngine.EventSystems.PointerEventData/FramePressState,UnityEngine.EventSystems.PointerEventData)
extern "C" void MouseState_SetButtonState_m2278 (MouseState_t517 * __this, int32_t ___button, int32_t ___stateForMouseButton, PointerEventData_t131 * ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;

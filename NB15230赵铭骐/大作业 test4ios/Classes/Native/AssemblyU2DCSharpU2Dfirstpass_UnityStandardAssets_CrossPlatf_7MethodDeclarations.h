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

// UnityStandardAssets.CrossPlatformInput.Joystick
struct Joystick_t59;
// UnityEngine.EventSystems.PointerEventData
struct PointerEventData_t131;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::.ctor()
extern "C" void Joystick__ctor_m184 (Joystick_t59 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::OnEnable()
extern "C" void Joystick_OnEnable_m185 (Joystick_t59 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::UpdateVirtualAxes(UnityEngine.Vector3)
extern "C" void Joystick_UpdateVirtualAxes_m186 (Joystick_t59 * __this, Vector3_t4  ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::CreateVirtualAxes()
extern "C" void Joystick_CreateVirtualAxes_m187 (Joystick_t59 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::OnDrag(UnityEngine.EventSystems.PointerEventData)
extern "C" void Joystick_OnDrag_m188 (Joystick_t59 * __this, PointerEventData_t131 * ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::OnPointerUp(UnityEngine.EventSystems.PointerEventData)
extern "C" void Joystick_OnPointerUp_m189 (Joystick_t59 * __this, PointerEventData_t131 * ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::OnPointerDown(UnityEngine.EventSystems.PointerEventData)
extern "C" void Joystick_OnPointerDown_m190 (Joystick_t59 * __this, PointerEventData_t131 * ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.CrossPlatformInput.Joystick::OnDisable()
extern "C" void Joystick_OnDisable_m191 (Joystick_t59 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

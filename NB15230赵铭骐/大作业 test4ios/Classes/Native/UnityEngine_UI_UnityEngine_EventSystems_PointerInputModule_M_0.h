#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.EventSystems.PointerEventData
struct PointerEventData_t131;

#include "mscorlib_System_Object.h"
#include "UnityEngine_UI_UnityEngine_EventSystems_PointerEventData_Fra.h"

// UnityEngine.EventSystems.PointerInputModule/MouseButtonEventData
struct  MouseButtonEventData_t516  : public Object_t
{
	// UnityEngine.EventSystems.PointerEventData/FramePressState UnityEngine.EventSystems.PointerInputModule/MouseButtonEventData::buttonState
	int32_t ___buttonState_0;
	// UnityEngine.EventSystems.PointerEventData UnityEngine.EventSystems.PointerInputModule/MouseButtonEventData::buttonData
	PointerEventData_t131 * ___buttonData_1;
};

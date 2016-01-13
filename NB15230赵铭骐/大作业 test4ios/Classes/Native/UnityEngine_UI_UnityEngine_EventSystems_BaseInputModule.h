#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// System.Collections.Generic.List`1<UnityEngine.EventSystems.RaycastResult>
struct List_1_t514;
// UnityEngine.EventSystems.AxisEventData
struct AxisEventData_t510;
// UnityEngine.EventSystems.EventSystem
struct EventSystem_t473;
// UnityEngine.EventSystems.BaseEventData
struct BaseEventData_t477;

#include "UnityEngine_UI_UnityEngine_EventSystems_UIBehaviour.h"

// UnityEngine.EventSystems.BaseInputModule
struct  BaseInputModule_t476  : public UIBehaviour_t474
{
	// System.Collections.Generic.List`1<UnityEngine.EventSystems.RaycastResult> UnityEngine.EventSystems.BaseInputModule::m_RaycastResultCache
	List_1_t514 * ___m_RaycastResultCache_2;
	// UnityEngine.EventSystems.AxisEventData UnityEngine.EventSystems.BaseInputModule::m_AxisEventData
	AxisEventData_t510 * ___m_AxisEventData_3;
	// UnityEngine.EventSystems.EventSystem UnityEngine.EventSystems.BaseInputModule::m_EventSystem
	EventSystem_t473 * ___m_EventSystem_4;
	// UnityEngine.EventSystems.BaseEventData UnityEngine.EventSystems.BaseInputModule::m_BaseEventData
	BaseEventData_t477 * ___m_BaseEventData_5;
};

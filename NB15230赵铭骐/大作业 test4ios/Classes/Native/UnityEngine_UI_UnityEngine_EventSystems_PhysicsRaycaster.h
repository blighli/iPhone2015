#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.Camera
struct Camera_t28;
// System.Comparison`1<UnityEngine.RaycastHit>
struct Comparison_1_t526;

#include "UnityEngine_UI_UnityEngine_EventSystems_BaseRaycaster.h"
#include "UnityEngine_UnityEngine_LayerMask.h"

// UnityEngine.EventSystems.PhysicsRaycaster
struct  PhysicsRaycaster_t525  : public BaseRaycaster_t509
{
	// UnityEngine.Camera UnityEngine.EventSystems.PhysicsRaycaster::m_EventCamera
	Camera_t28 * ___m_EventCamera_3;
	// UnityEngine.LayerMask UnityEngine.EventSystems.PhysicsRaycaster::m_EventMask
	LayerMask_t9  ___m_EventMask_4;
};
struct PhysicsRaycaster_t525_StaticFields{
	// System.Comparison`1<UnityEngine.RaycastHit> UnityEngine.EventSystems.PhysicsRaycaster::<>f__am$cache2
	Comparison_1_t526 * ___U3CU3Ef__amU24cache2_5;
};

#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.UI.Graphic
struct Graphic_t560;
// UnityEngine.UI.ToggleGroup
struct ToggleGroup_t621;
// UnityEngine.UI.Toggle/ToggleEvent
struct ToggleEvent_t620;

#include "UnityEngine_UI_UnityEngine_UI_Selectable.h"
#include "UnityEngine_UI_UnityEngine_UI_Toggle_ToggleTransition.h"

// UnityEngine.UI.Toggle
struct  Toggle_t546  : public Selectable_t538
{
	// UnityEngine.UI.Toggle/ToggleTransition UnityEngine.UI.Toggle::toggleTransition
	int32_t ___toggleTransition_16;
	// UnityEngine.UI.Graphic UnityEngine.UI.Toggle::graphic
	Graphic_t560 * ___graphic_17;
	// UnityEngine.UI.ToggleGroup UnityEngine.UI.Toggle::m_Group
	ToggleGroup_t621 * ___m_Group_18;
	// UnityEngine.UI.Toggle/ToggleEvent UnityEngine.UI.Toggle::onValueChanged
	ToggleEvent_t620 * ___onValueChanged_19;
	// System.Boolean UnityEngine.UI.Toggle::m_IsOn
	bool ___m_IsOn_20;
};

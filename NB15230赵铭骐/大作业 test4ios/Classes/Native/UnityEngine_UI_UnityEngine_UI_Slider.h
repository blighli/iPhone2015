#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.RectTransform
struct RectTransform_t242;
// UnityEngine.UI.Slider/SliderEvent
struct SliderEvent_t613;
// UnityEngine.UI.Image
struct Image_t70;
// UnityEngine.Transform
struct Transform_t3;

#include "UnityEngine_UI_UnityEngine_UI_Selectable.h"
#include "UnityEngine_UI_UnityEngine_UI_Slider_Direction.h"
#include "UnityEngine_UnityEngine_Vector2.h"
#include "UnityEngine_UnityEngine_DrivenRectTransformTracker.h"

// UnityEngine.UI.Slider
struct  Slider_t615  : public Selectable_t538
{
	// UnityEngine.RectTransform UnityEngine.UI.Slider::m_FillRect
	RectTransform_t242 * ___m_FillRect_16;
	// UnityEngine.RectTransform UnityEngine.UI.Slider::m_HandleRect
	RectTransform_t242 * ___m_HandleRect_17;
	// UnityEngine.UI.Slider/Direction UnityEngine.UI.Slider::m_Direction
	int32_t ___m_Direction_18;
	// System.Single UnityEngine.UI.Slider::m_MinValue
	float ___m_MinValue_19;
	// System.Single UnityEngine.UI.Slider::m_MaxValue
	float ___m_MaxValue_20;
	// System.Boolean UnityEngine.UI.Slider::m_WholeNumbers
	bool ___m_WholeNumbers_21;
	// System.Single UnityEngine.UI.Slider::m_Value
	float ___m_Value_22;
	// UnityEngine.UI.Slider/SliderEvent UnityEngine.UI.Slider::m_OnValueChanged
	SliderEvent_t613 * ___m_OnValueChanged_23;
	// UnityEngine.UI.Image UnityEngine.UI.Slider::m_FillImage
	Image_t70 * ___m_FillImage_24;
	// UnityEngine.Transform UnityEngine.UI.Slider::m_FillTransform
	Transform_t3 * ___m_FillTransform_25;
	// UnityEngine.RectTransform UnityEngine.UI.Slider::m_FillContainerRect
	RectTransform_t242 * ___m_FillContainerRect_26;
	// UnityEngine.Transform UnityEngine.UI.Slider::m_HandleTransform
	Transform_t3 * ___m_HandleTransform_27;
	// UnityEngine.RectTransform UnityEngine.UI.Slider::m_HandleContainerRect
	RectTransform_t242 * ___m_HandleContainerRect_28;
	// UnityEngine.Vector2 UnityEngine.UI.Slider::m_Offset
	Vector2_t6  ___m_Offset_29;
	// UnityEngine.DrivenRectTransformTracker UnityEngine.UI.Slider::m_Tracker
	DrivenRectTransformTracker_t238  ___m_Tracker_30;
};

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
// UnityEngine.UI.Text
struct Text_t545;
// UnityEngine.UI.Image
struct Image_t70;
// UnityEngine.UI.Dropdown/OptionDataList
struct OptionDataList_t548;
// UnityEngine.UI.Dropdown/DropdownEvent
struct DropdownEvent_t550;
// UnityEngine.GameObject
struct GameObject_t77;
// System.Collections.Generic.List`1<UnityEngine.UI.Dropdown/DropdownItem>
struct List_1_t555;
// UnityEngine.UI.CoroutineTween.TweenRunner`1<UnityEngine.UI.CoroutineTween.FloatTween>
struct TweenRunner_1_t556;

#include "UnityEngine_UI_UnityEngine_UI_Selectable.h"

// UnityEngine.UI.Dropdown
struct  Dropdown_t553  : public Selectable_t538
{
	// UnityEngine.RectTransform UnityEngine.UI.Dropdown::m_Template
	RectTransform_t242 * ___m_Template_16;
	// UnityEngine.UI.Text UnityEngine.UI.Dropdown::m_CaptionText
	Text_t545 * ___m_CaptionText_17;
	// UnityEngine.UI.Image UnityEngine.UI.Dropdown::m_CaptionImage
	Image_t70 * ___m_CaptionImage_18;
	// UnityEngine.UI.Text UnityEngine.UI.Dropdown::m_ItemText
	Text_t545 * ___m_ItemText_19;
	// UnityEngine.UI.Image UnityEngine.UI.Dropdown::m_ItemImage
	Image_t70 * ___m_ItemImage_20;
	// System.Int32 UnityEngine.UI.Dropdown::m_Value
	int32_t ___m_Value_21;
	// UnityEngine.UI.Dropdown/OptionDataList UnityEngine.UI.Dropdown::m_Options
	OptionDataList_t548 * ___m_Options_22;
	// UnityEngine.UI.Dropdown/DropdownEvent UnityEngine.UI.Dropdown::m_OnValueChanged
	DropdownEvent_t550 * ___m_OnValueChanged_23;
	// UnityEngine.GameObject UnityEngine.UI.Dropdown::m_Dropdown
	GameObject_t77 * ___m_Dropdown_24;
	// UnityEngine.GameObject UnityEngine.UI.Dropdown::m_Blocker
	GameObject_t77 * ___m_Blocker_25;
	// System.Collections.Generic.List`1<UnityEngine.UI.Dropdown/DropdownItem> UnityEngine.UI.Dropdown::m_Items
	List_1_t555 * ___m_Items_26;
	// UnityEngine.UI.CoroutineTween.TweenRunner`1<UnityEngine.UI.CoroutineTween.FloatTween> UnityEngine.UI.Dropdown::m_AlphaTweenRunner
	TweenRunner_1_t556 * ___m_AlphaTweenRunner_27;
	// System.Boolean UnityEngine.UI.Dropdown::validTemplate
	bool ___validTemplate_28;
};

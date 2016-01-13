#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.UI.CanvasUpdateRegistry
struct CanvasUpdateRegistry_t540;
// UnityEngine.UI.Collections.IndexedSet`1<UnityEngine.UI.ICanvasElement>
struct IndexedSet_1_t541;
// System.Comparison`1<UnityEngine.UI.ICanvasElement>
struct Comparison_1_t542;

#include "mscorlib_System_Object.h"

// UnityEngine.UI.CanvasUpdateRegistry
struct  CanvasUpdateRegistry_t540  : public Object_t
{
	// System.Boolean UnityEngine.UI.CanvasUpdateRegistry::m_PerformingLayoutUpdate
	bool ___m_PerformingLayoutUpdate_1;
	// System.Boolean UnityEngine.UI.CanvasUpdateRegistry::m_PerformingGraphicUpdate
	bool ___m_PerformingGraphicUpdate_2;
	// UnityEngine.UI.Collections.IndexedSet`1<UnityEngine.UI.ICanvasElement> UnityEngine.UI.CanvasUpdateRegistry::m_LayoutRebuildQueue
	IndexedSet_1_t541 * ___m_LayoutRebuildQueue_3;
	// UnityEngine.UI.Collections.IndexedSet`1<UnityEngine.UI.ICanvasElement> UnityEngine.UI.CanvasUpdateRegistry::m_GraphicRebuildQueue
	IndexedSet_1_t541 * ___m_GraphicRebuildQueue_4;
};
struct CanvasUpdateRegistry_t540_StaticFields{
	// UnityEngine.UI.CanvasUpdateRegistry UnityEngine.UI.CanvasUpdateRegistry::s_Instance
	CanvasUpdateRegistry_t540 * ___s_Instance_0;
	// System.Comparison`1<UnityEngine.UI.ICanvasElement> UnityEngine.UI.CanvasUpdateRegistry::s_SortLayoutFunction
	Comparison_1_t542 * ___s_SortLayoutFunction_5;
};

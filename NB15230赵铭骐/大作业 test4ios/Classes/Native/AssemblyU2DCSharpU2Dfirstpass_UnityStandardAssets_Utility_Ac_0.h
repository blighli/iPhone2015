#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.Object
struct Object_t76;
struct Object_t76_marshaled;
// UnityEngine.GameObject
struct GameObject_t77;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Utility_Ac.h"

// UnityStandardAssets.Utility.ActivateTrigger
struct  ActivateTrigger_t75  : public MonoBehaviour_t2
{
	// UnityStandardAssets.Utility.ActivateTrigger/Mode UnityStandardAssets.Utility.ActivateTrigger::action
	int32_t ___action_2;
	// UnityEngine.Object UnityStandardAssets.Utility.ActivateTrigger::target
	Object_t76 * ___target_3;
	// UnityEngine.GameObject UnityStandardAssets.Utility.ActivateTrigger::source
	GameObject_t77 * ___source_4;
	// System.Int32 UnityStandardAssets.Utility.ActivateTrigger::triggerCount
	int32_t ___triggerCount_5;
	// System.Boolean UnityStandardAssets.Utility.ActivateTrigger::repeatTrigger
	bool ___repeatTrigger_6;
};

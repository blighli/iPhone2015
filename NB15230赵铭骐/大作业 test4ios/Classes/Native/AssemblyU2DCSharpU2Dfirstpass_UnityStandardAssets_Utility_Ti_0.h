#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.GameObject
struct GameObject_t77;

#include "mscorlib_System_Object.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Utility_Ti.h"

// UnityStandardAssets.Utility.TimedObjectActivator/Entry
struct  Entry_t114  : public Object_t
{
	// UnityEngine.GameObject UnityStandardAssets.Utility.TimedObjectActivator/Entry::target
	GameObject_t77 * ___target_0;
	// UnityStandardAssets.Utility.TimedObjectActivator/Action UnityStandardAssets.Utility.TimedObjectActivator/Entry::action
	int32_t ___action_1;
	// System.Single UnityStandardAssets.Utility.TimedObjectActivator/Entry::delay
	float ___delay_2;
};

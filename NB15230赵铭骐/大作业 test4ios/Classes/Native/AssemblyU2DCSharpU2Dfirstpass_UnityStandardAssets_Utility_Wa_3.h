#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityStandardAssets.Utility.WaypointCircuit
struct WaypointCircuit_t123;
// UnityEngine.Transform
struct Transform_t3;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Utility_Wa_2.h"
#include "UnityEngine_UnityEngine_Vector3.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_Utility_Wa_0.h"

// UnityStandardAssets.Utility.WaypointProgressTracker
struct  WaypointProgressTracker_t128  : public MonoBehaviour_t2
{
	// UnityStandardAssets.Utility.WaypointCircuit UnityStandardAssets.Utility.WaypointProgressTracker::circuit
	WaypointCircuit_t123 * ___circuit_2;
	// System.Single UnityStandardAssets.Utility.WaypointProgressTracker::lookAheadForTargetOffset
	float ___lookAheadForTargetOffset_3;
	// System.Single UnityStandardAssets.Utility.WaypointProgressTracker::lookAheadForTargetFactor
	float ___lookAheadForTargetFactor_4;
	// System.Single UnityStandardAssets.Utility.WaypointProgressTracker::lookAheadForSpeedOffset
	float ___lookAheadForSpeedOffset_5;
	// System.Single UnityStandardAssets.Utility.WaypointProgressTracker::lookAheadForSpeedFactor
	float ___lookAheadForSpeedFactor_6;
	// UnityStandardAssets.Utility.WaypointProgressTracker/ProgressStyle UnityStandardAssets.Utility.WaypointProgressTracker::progressStyle
	int32_t ___progressStyle_7;
	// System.Single UnityStandardAssets.Utility.WaypointProgressTracker::pointToPointThreshold
	float ___pointToPointThreshold_8;
	// UnityEngine.Transform UnityStandardAssets.Utility.WaypointProgressTracker::target
	Transform_t3 * ___target_9;
	// System.Single UnityStandardAssets.Utility.WaypointProgressTracker::progressDistance
	float ___progressDistance_10;
	// System.Int32 UnityStandardAssets.Utility.WaypointProgressTracker::progressNum
	int32_t ___progressNum_11;
	// UnityEngine.Vector3 UnityStandardAssets.Utility.WaypointProgressTracker::lastPosition
	Vector3_t4  ___lastPosition_12;
	// System.Single UnityStandardAssets.Utility.WaypointProgressTracker::speed
	float ___speed_13;
	// UnityStandardAssets.Utility.WaypointCircuit/RoutePoint UnityStandardAssets.Utility.WaypointProgressTracker::<targetPoint>k__BackingField
	RoutePoint_t124  ___U3CtargetPointU3Ek__BackingField_14;
	// UnityStandardAssets.Utility.WaypointCircuit/RoutePoint UnityStandardAssets.Utility.WaypointProgressTracker::<speedPoint>k__BackingField
	RoutePoint_t124  ___U3CspeedPointU3Ek__BackingField_15;
	// UnityStandardAssets.Utility.WaypointCircuit/RoutePoint UnityStandardAssets.Utility.WaypointProgressTracker::<progressPoint>k__BackingField
	RoutePoint_t124  ___U3CprogressPointU3Ek__BackingField_16;
};

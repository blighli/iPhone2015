#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityStandardAssets.Utility.WaypointCircuit/WaypointList
struct WaypointList_t122;
// UnityEngine.Vector3[]
struct Vector3U5BU5D_t125;
// System.Single[]
struct SingleU5BU5D_t126;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityStandardAssets.Utility.WaypointCircuit
struct  WaypointCircuit_t123  : public MonoBehaviour_t2
{
	// UnityStandardAssets.Utility.WaypointCircuit/WaypointList UnityStandardAssets.Utility.WaypointCircuit::waypointList
	WaypointList_t122 * ___waypointList_2;
	// System.Boolean UnityStandardAssets.Utility.WaypointCircuit::smoothRoute
	bool ___smoothRoute_3;
	// System.Int32 UnityStandardAssets.Utility.WaypointCircuit::numPoints
	int32_t ___numPoints_4;
	// UnityEngine.Vector3[] UnityStandardAssets.Utility.WaypointCircuit::points
	Vector3U5BU5D_t125* ___points_5;
	// System.Single[] UnityStandardAssets.Utility.WaypointCircuit::distances
	SingleU5BU5D_t126* ___distances_6;
	// System.Single UnityStandardAssets.Utility.WaypointCircuit::editorVisualisationSubsteps
	float ___editorVisualisationSubsteps_7;
	// System.Int32 UnityStandardAssets.Utility.WaypointCircuit::p0n
	int32_t ___p0n_8;
	// System.Int32 UnityStandardAssets.Utility.WaypointCircuit::p1n
	int32_t ___p1n_9;
	// System.Int32 UnityStandardAssets.Utility.WaypointCircuit::p2n
	int32_t ___p2n_10;
	// System.Int32 UnityStandardAssets.Utility.WaypointCircuit::p3n
	int32_t ___p3n_11;
	// System.Single UnityStandardAssets.Utility.WaypointCircuit::i
	float ___i_12;
	// UnityEngine.Vector3 UnityStandardAssets.Utility.WaypointCircuit::P0
	Vector3_t4  ___P0_13;
	// UnityEngine.Vector3 UnityStandardAssets.Utility.WaypointCircuit::P1
	Vector3_t4  ___P1_14;
	// UnityEngine.Vector3 UnityStandardAssets.Utility.WaypointCircuit::P2
	Vector3_t4  ___P2_15;
	// UnityEngine.Vector3 UnityStandardAssets.Utility.WaypointCircuit::P3
	Vector3_t4  ___P3_16;
	// System.Single UnityStandardAssets.Utility.WaypointCircuit::<Length>k__BackingField
	float ___U3CLengthU3Ek__BackingField_17;
};

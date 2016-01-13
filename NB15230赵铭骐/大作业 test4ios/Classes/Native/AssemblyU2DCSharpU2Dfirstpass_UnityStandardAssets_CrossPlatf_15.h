#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityStandardAssets.CrossPlatformInput.TiltInput/AxisMapping
struct AxisMapping_t65;
// UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis
struct VirtualAxis_t51;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "AssemblyU2DCSharpU2Dfirstpass_UnityStandardAssets_CrossPlatf_12.h"

// UnityStandardAssets.CrossPlatformInput.TiltInput
struct  TiltInput_t66  : public MonoBehaviour_t2
{
	// UnityStandardAssets.CrossPlatformInput.TiltInput/AxisMapping UnityStandardAssets.CrossPlatformInput.TiltInput::mapping
	AxisMapping_t65 * ___mapping_2;
	// UnityStandardAssets.CrossPlatformInput.TiltInput/AxisOptions UnityStandardAssets.CrossPlatformInput.TiltInput::tiltAroundAxis
	int32_t ___tiltAroundAxis_3;
	// System.Single UnityStandardAssets.CrossPlatformInput.TiltInput::fullTiltAngle
	float ___fullTiltAngle_4;
	// System.Single UnityStandardAssets.CrossPlatformInput.TiltInput::centreAngleOffset
	float ___centreAngleOffset_5;
	// UnityStandardAssets.CrossPlatformInput.CrossPlatformInputManager/VirtualAxis UnityStandardAssets.CrossPlatformInput.TiltInput::m_SteerAxis
	VirtualAxis_t51 * ___m_SteerAxis_6;
};

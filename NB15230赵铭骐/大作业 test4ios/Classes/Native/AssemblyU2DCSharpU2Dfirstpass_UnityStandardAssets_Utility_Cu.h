#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.AnimationCurve
struct AnimationCurve_t41;
struct AnimationCurve_t41_marshaled;

#include "mscorlib_System_Object.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityStandardAssets.Utility.CurveControlledBob
struct  CurveControlledBob_t32  : public Object_t
{
	// System.Single UnityStandardAssets.Utility.CurveControlledBob::HorizontalBobRange
	float ___HorizontalBobRange_0;
	// System.Single UnityStandardAssets.Utility.CurveControlledBob::VerticalBobRange
	float ___VerticalBobRange_1;
	// UnityEngine.AnimationCurve UnityStandardAssets.Utility.CurveControlledBob::Bobcurve
	AnimationCurve_t41 * ___Bobcurve_2;
	// System.Single UnityStandardAssets.Utility.CurveControlledBob::VerticaltoHorizontalRatio
	float ___VerticaltoHorizontalRatio_3;
	// System.Single UnityStandardAssets.Utility.CurveControlledBob::m_CyclePositionX
	float ___m_CyclePositionX_4;
	// System.Single UnityStandardAssets.Utility.CurveControlledBob::m_CyclePositionY
	float ___m_CyclePositionY_5;
	// System.Single UnityStandardAssets.Utility.CurveControlledBob::m_BobBaseInterval
	float ___m_BobBaseInterval_6;
	// UnityEngine.Vector3 UnityStandardAssets.Utility.CurveControlledBob::m_OriginalCameraPosition
	Vector3_t4  ___m_OriginalCameraPosition_7;
	// System.Single UnityStandardAssets.Utility.CurveControlledBob::m_Time
	float ___m_Time_8;
};

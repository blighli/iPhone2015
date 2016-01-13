﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>


#include "mscorlib_System_ValueType.h"
#include "UnityEngine_UnityEngine_Vector2.h"
#include "UnityEngine_UnityEngine_TouchPhase.h"

// UnityEngine.Touch
struct  Touch_t155 
{
	// System.Int32 UnityEngine.Touch::m_FingerId
	int32_t ___m_FingerId_0;
	// UnityEngine.Vector2 UnityEngine.Touch::m_Position
	Vector2_t6  ___m_Position_1;
	// UnityEngine.Vector2 UnityEngine.Touch::m_RawPosition
	Vector2_t6  ___m_RawPosition_2;
	// UnityEngine.Vector2 UnityEngine.Touch::m_PositionDelta
	Vector2_t6  ___m_PositionDelta_3;
	// System.Single UnityEngine.Touch::m_TimeDelta
	float ___m_TimeDelta_4;
	// System.Int32 UnityEngine.Touch::m_TapCount
	int32_t ___m_TapCount_5;
	// UnityEngine.TouchPhase UnityEngine.Touch::m_Phase
	int32_t ___m_Phase_6;
};
// Native definition for marshalling of: UnityEngine.Touch
struct Touch_t155_marshaled
{
	int32_t ___m_FingerId_0;
	Vector2_t6  ___m_Position_1;
	Vector2_t6  ___m_RawPosition_2;
	Vector2_t6  ___m_PositionDelta_3;
	float ___m_TimeDelta_4;
	int32_t ___m_TapCount_5;
	int32_t ___m_Phase_6;
};

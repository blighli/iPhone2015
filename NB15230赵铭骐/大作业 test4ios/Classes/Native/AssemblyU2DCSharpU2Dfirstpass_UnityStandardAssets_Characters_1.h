#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>


#include "mscorlib_System_Object.h"
#include "UnityEngine_UnityEngine_Quaternion.h"

// UnityStandardAssets.Characters.FirstPerson.MouseLook
struct  MouseLook_t30  : public Object_t
{
	// System.Single UnityStandardAssets.Characters.FirstPerson.MouseLook::XSensitivity
	float ___XSensitivity_0;
	// System.Single UnityStandardAssets.Characters.FirstPerson.MouseLook::YSensitivity
	float ___YSensitivity_1;
	// System.Boolean UnityStandardAssets.Characters.FirstPerson.MouseLook::clampVerticalRotation
	bool ___clampVerticalRotation_2;
	// System.Single UnityStandardAssets.Characters.FirstPerson.MouseLook::MinimumX
	float ___MinimumX_3;
	// System.Single UnityStandardAssets.Characters.FirstPerson.MouseLook::MaximumX
	float ___MaximumX_4;
	// System.Boolean UnityStandardAssets.Characters.FirstPerson.MouseLook::smooth
	bool ___smooth_5;
	// System.Single UnityStandardAssets.Characters.FirstPerson.MouseLook::smoothTime
	float ___smoothTime_6;
	// UnityEngine.Quaternion UnityStandardAssets.Characters.FirstPerson.MouseLook::m_CharacterTargetRot
	Quaternion_t19  ___m_CharacterTargetRot_7;
	// UnityEngine.Quaternion UnityStandardAssets.Characters.FirstPerson.MouseLook::m_CameraTargetRot
	Quaternion_t19  ___m_CameraTargetRot_8;
};

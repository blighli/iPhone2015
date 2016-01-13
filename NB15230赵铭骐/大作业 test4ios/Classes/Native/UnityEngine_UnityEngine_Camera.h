#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityEngine.Camera/CameraCallback
struct CameraCallback_t257;

#include "UnityEngine_UnityEngine_Behaviour.h"

// UnityEngine.Camera
struct  Camera_t28  : public Behaviour_t156
{
};
struct Camera_t28_StaticFields{
	// UnityEngine.Camera/CameraCallback UnityEngine.Camera::onPreCull
	CameraCallback_t257 * ___onPreCull_2;
	// UnityEngine.Camera/CameraCallback UnityEngine.Camera::onPreRender
	CameraCallback_t257 * ___onPreRender_3;
	// UnityEngine.Camera/CameraCallback UnityEngine.Camera::onPostRender
	CameraCallback_t257 * ___onPostRender_4;
};

#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>

// UnityStandardAssets.Vehicles.Ball.Ball
struct Ball_t44;
// UnityEngine.Transform
struct Transform_t3;

#include "UnityEngine_UnityEngine_MonoBehaviour.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityStandardAssets.Vehicles.Ball.BallUserControl
struct  BallUserControl_t45  : public MonoBehaviour_t2
{
	// UnityStandardAssets.Vehicles.Ball.Ball UnityStandardAssets.Vehicles.Ball.BallUserControl::ball
	Ball_t44 * ___ball_2;
	// UnityEngine.Vector3 UnityStandardAssets.Vehicles.Ball.BallUserControl::move
	Vector3_t4  ___move_3;
	// UnityEngine.Transform UnityStandardAssets.Vehicles.Ball.BallUserControl::cam
	Transform_t3 * ___cam_4;
	// UnityEngine.Vector3 UnityStandardAssets.Vehicles.Ball.BallUserControl::camForward
	Vector3_t4  ___camForward_5;
	// System.Boolean UnityStandardAssets.Vehicles.Ball.BallUserControl::jump
	bool ___jump_6;
};

#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// UnityStandardAssets.Utility.CurveControlledBob
struct CurveControlledBob_t32;
// UnityEngine.Camera
struct Camera_t28;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// System.Void UnityStandardAssets.Utility.CurveControlledBob::.ctor()
extern "C" void CurveControlledBob__ctor_m264 (CurveControlledBob_t32 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.CurveControlledBob::Setup(UnityEngine.Camera,System.Single)
extern "C" void CurveControlledBob_Setup_m265 (CurveControlledBob_t32 * __this, Camera_t28 * ___camera, float ___bobBaseInterval, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// UnityEngine.Vector3 UnityStandardAssets.Utility.CurveControlledBob::DoHeadBob(System.Single)
extern "C" Vector3_t4  CurveControlledBob_DoHeadBob_m266 (CurveControlledBob_t32 * __this, float ___speed, const MethodInfo* method) IL2CPP_METHOD_ATTR;

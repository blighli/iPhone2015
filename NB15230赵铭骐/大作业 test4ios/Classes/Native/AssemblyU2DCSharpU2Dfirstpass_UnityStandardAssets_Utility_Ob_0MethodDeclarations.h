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

// UnityStandardAssets.Utility.ObjectResetter
struct ObjectResetter_t100;
// System.Collections.IEnumerator
struct IEnumerator_t133;

#include "codegen/il2cpp-codegen.h"

// System.Void UnityStandardAssets.Utility.ObjectResetter::.ctor()
extern "C" void ObjectResetter__ctor_m320 (ObjectResetter_t100 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.ObjectResetter::Start()
extern "C" void ObjectResetter_Start_m321 (ObjectResetter_t100 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityStandardAssets.Utility.ObjectResetter::DelayedReset(System.Single)
extern "C" void ObjectResetter_DelayedReset_m322 (ObjectResetter_t100 * __this, float ___delay, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Collections.IEnumerator UnityStandardAssets.Utility.ObjectResetter::ResetCoroutine(System.Single)
extern "C" Object_t * ObjectResetter_ResetCoroutine_m323 (ObjectResetter_t100 * __this, float ___delay, const MethodInfo* method) IL2CPP_METHOD_ATTR;

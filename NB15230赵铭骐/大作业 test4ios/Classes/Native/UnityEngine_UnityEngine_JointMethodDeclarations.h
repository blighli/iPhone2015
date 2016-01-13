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

// UnityEngine.Joint
struct Joint_t281;
// UnityEngine.Rigidbody
struct Rigidbody_t15;

#include "codegen/il2cpp-codegen.h"
#include "UnityEngine_UnityEngine_Vector3.h"

// UnityEngine.Rigidbody UnityEngine.Joint::get_connectedBody()
extern "C" Rigidbody_t15 * Joint_get_connectedBody_m641 (Joint_t281 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Joint::set_connectedBody(UnityEngine.Rigidbody)
extern "C" void Joint_set_connectedBody_m648 (Joint_t281 * __this, Rigidbody_t15 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Joint::set_anchor(UnityEngine.Vector3)
extern "C" void Joint_set_anchor_m658 (Joint_t281 * __this, Vector3_t4  ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.Joint::INTERNAL_set_anchor(UnityEngine.Vector3&)
extern "C" void Joint_INTERNAL_set_anchor_m1478 (Joint_t281 * __this, Vector3_t4 * ___value, const MethodInfo* method) IL2CPP_METHOD_ATTR;

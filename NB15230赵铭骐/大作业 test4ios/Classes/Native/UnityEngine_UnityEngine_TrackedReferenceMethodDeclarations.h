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

// UnityEngine.TrackedReference
struct TrackedReference_t299;
struct TrackedReference_t299_marshaled;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"

// System.Boolean UnityEngine.TrackedReference::Equals(System.Object)
extern "C" bool TrackedReference_Equals_m1926 (TrackedReference_t299 * __this, Object_t * ___o, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 UnityEngine.TrackedReference::GetHashCode()
extern "C" int32_t TrackedReference_GetHashCode_m1927 (TrackedReference_t299 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean UnityEngine.TrackedReference::op_Equality(UnityEngine.TrackedReference,UnityEngine.TrackedReference)
extern "C" bool TrackedReference_op_Equality_m1928 (Object_t * __this /* static, unused */, TrackedReference_t299 * ___x, TrackedReference_t299 * ___y, const MethodInfo* method) IL2CPP_METHOD_ATTR;
extern "C" void TrackedReference_t299_marshal(const TrackedReference_t299& unmarshaled, TrackedReference_t299_marshaled& marshaled);
extern "C" void TrackedReference_t299_marshal_back(const TrackedReference_t299_marshaled& marshaled, TrackedReference_t299& unmarshaled);
extern "C" void TrackedReference_t299_marshal_cleanup(TrackedReference_t299_marshaled& marshaled);

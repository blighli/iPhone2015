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

// UnityEngine.AsyncOperation
struct AsyncOperation_t182;
struct AsyncOperation_t182_marshaled;

#include "codegen/il2cpp-codegen.h"

// System.Void UnityEngine.AsyncOperation::.ctor()
extern "C" void AsyncOperation__ctor_m1228 (AsyncOperation_t182 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AsyncOperation::InternalDestroy()
extern "C" void AsyncOperation_InternalDestroy_m1229 (AsyncOperation_t182 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void UnityEngine.AsyncOperation::Finalize()
extern "C" void AsyncOperation_Finalize_m1230 (AsyncOperation_t182 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
extern "C" void AsyncOperation_t182_marshal(const AsyncOperation_t182& unmarshaled, AsyncOperation_t182_marshaled& marshaled);
extern "C" void AsyncOperation_t182_marshal_back(const AsyncOperation_t182_marshaled& marshaled, AsyncOperation_t182& unmarshaled);
extern "C" void AsyncOperation_t182_marshal_cleanup(AsyncOperation_t182_marshaled& marshaled);

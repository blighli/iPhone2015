﻿#pragma once

#include "il2cpp-config.h"

#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif

#include <stdint.h>
#include <assert.h>
#include <exception>

// System.Reflection.PropertyInfo
struct PropertyInfo_t;
// System.Object
struct Object_t;
// System.Object[]
struct ObjectU5BU5D_t162;
// System.Type[]
struct TypeU5BU5D_t431;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Reflection_MemberTypes.h"

// System.Void System.Reflection.PropertyInfo::.ctor()
extern "C" void PropertyInfo__ctor_m8547 (PropertyInfo_t * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.MemberTypes System.Reflection.PropertyInfo::get_MemberType()
extern "C" int32_t PropertyInfo_get_MemberType_m8548 (PropertyInfo_t * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Reflection.PropertyInfo::GetValue(System.Object,System.Object[])
extern "C" Object_t * PropertyInfo_GetValue_m8549 (PropertyInfo_t * __this, Object_t * ___obj, ObjectU5BU5D_t162* ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Reflection.PropertyInfo::SetValue(System.Object,System.Object,System.Object[])
extern "C" void PropertyInfo_SetValue_m8550 (PropertyInfo_t * __this, Object_t * ___obj, Object_t * ___value, ObjectU5BU5D_t162* ___index, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Type[] System.Reflection.PropertyInfo::GetOptionalCustomModifiers()
extern "C" TypeU5BU5D_t431* PropertyInfo_GetOptionalCustomModifiers_m8551 (PropertyInfo_t * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Type[] System.Reflection.PropertyInfo::GetRequiredCustomModifiers()
extern "C" TypeU5BU5D_t431* PropertyInfo_GetRequiredCustomModifiers_m8552 (PropertyInfo_t * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

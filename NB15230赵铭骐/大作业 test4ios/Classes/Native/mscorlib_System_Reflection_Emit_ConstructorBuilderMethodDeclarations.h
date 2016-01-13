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

// System.Reflection.Emit.ConstructorBuilder
struct ConstructorBuilder_t1302;
// System.Reflection.Emit.TypeBuilder
struct TypeBuilder_t1304;
// System.Type[]
struct TypeU5BU5D_t431;
// System.Type[][]
struct TypeU5BU5DU5BU5D_t1306;
// System.Reflection.ParameterInfo[]
struct ParameterInfoU5BU5D_t461;
// System.Object
struct Object_t;
// System.Reflection.Binder
struct Binder_t451;
// System.Object[]
struct ObjectU5BU5D_t162;
// System.Globalization.CultureInfo
struct CultureInfo_t453;
// System.Type
struct Type_t;
// System.String
struct String_t;
// System.Reflection.Emit.ILGenerator
struct ILGenerator_t1303;
// System.Reflection.Module
struct Module_t1318;
// System.Exception
struct Exception_t152;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Reflection_MethodAttributes.h"
#include "mscorlib_System_Reflection_CallingConventions.h"
#include "mscorlib_System_Reflection_BindingFlags.h"
#include "mscorlib_System_RuntimeMethodHandle.h"
#include "mscorlib_System_Reflection_Emit_MethodToken.h"

// System.Void System.Reflection.Emit.ConstructorBuilder::.ctor(System.Reflection.Emit.TypeBuilder,System.Reflection.MethodAttributes,System.Reflection.CallingConventions,System.Type[],System.Type[][],System.Type[][])
extern "C" void ConstructorBuilder__ctor_m8001 (ConstructorBuilder_t1302 * __this, TypeBuilder_t1304 * ___tb, int32_t ___attributes, int32_t ___callingConvention, TypeU5BU5D_t431* ___parameterTypes, TypeU5BU5DU5BU5D_t1306* ___paramModReq, TypeU5BU5DU5BU5D_t1306* ___paramModOpt, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.CallingConventions System.Reflection.Emit.ConstructorBuilder::get_CallingConvention()
extern "C" int32_t ConstructorBuilder_get_CallingConvention_m8002 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.Emit.TypeBuilder System.Reflection.Emit.ConstructorBuilder::get_TypeBuilder()
extern "C" TypeBuilder_t1304 * ConstructorBuilder_get_TypeBuilder_m8003 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.ParameterInfo[] System.Reflection.Emit.ConstructorBuilder::GetParameters()
extern "C" ParameterInfoU5BU5D_t461* ConstructorBuilder_GetParameters_m8004 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.ParameterInfo[] System.Reflection.Emit.ConstructorBuilder::GetParametersInternal()
extern "C" ParameterInfoU5BU5D_t461* ConstructorBuilder_GetParametersInternal_m8005 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Reflection.Emit.ConstructorBuilder::GetParameterCount()
extern "C" int32_t ConstructorBuilder_GetParameterCount_m8006 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Reflection.Emit.ConstructorBuilder::Invoke(System.Object,System.Reflection.BindingFlags,System.Reflection.Binder,System.Object[],System.Globalization.CultureInfo)
extern "C" Object_t * ConstructorBuilder_Invoke_m8007 (ConstructorBuilder_t1302 * __this, Object_t * ___obj, int32_t ___invokeAttr, Binder_t451 * ___binder, ObjectU5BU5D_t162* ___parameters, CultureInfo_t453 * ___culture, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Reflection.Emit.ConstructorBuilder::Invoke(System.Reflection.BindingFlags,System.Reflection.Binder,System.Object[],System.Globalization.CultureInfo)
extern "C" Object_t * ConstructorBuilder_Invoke_m8008 (ConstructorBuilder_t1302 * __this, int32_t ___invokeAttr, Binder_t451 * ___binder, ObjectU5BU5D_t162* ___parameters, CultureInfo_t453 * ___culture, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.RuntimeMethodHandle System.Reflection.Emit.ConstructorBuilder::get_MethodHandle()
extern "C" RuntimeMethodHandle_t1729  ConstructorBuilder_get_MethodHandle_m8009 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.MethodAttributes System.Reflection.Emit.ConstructorBuilder::get_Attributes()
extern "C" int32_t ConstructorBuilder_get_Attributes_m8010 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Type System.Reflection.Emit.ConstructorBuilder::get_ReflectedType()
extern "C" Type_t * ConstructorBuilder_get_ReflectedType_m8011 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Type System.Reflection.Emit.ConstructorBuilder::get_DeclaringType()
extern "C" Type_t * ConstructorBuilder_get_DeclaringType_m8012 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.Reflection.Emit.ConstructorBuilder::get_Name()
extern "C" String_t* ConstructorBuilder_get_Name_m8013 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Reflection.Emit.ConstructorBuilder::IsDefined(System.Type,System.Boolean)
extern "C" bool ConstructorBuilder_IsDefined_m8014 (ConstructorBuilder_t1302 * __this, Type_t * ___attributeType, bool ___inherit, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object[] System.Reflection.Emit.ConstructorBuilder::GetCustomAttributes(System.Boolean)
extern "C" ObjectU5BU5D_t162* ConstructorBuilder_GetCustomAttributes_m8015 (ConstructorBuilder_t1302 * __this, bool ___inherit, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object[] System.Reflection.Emit.ConstructorBuilder::GetCustomAttributes(System.Type,System.Boolean)
extern "C" ObjectU5BU5D_t162* ConstructorBuilder_GetCustomAttributes_m8016 (ConstructorBuilder_t1302 * __this, Type_t * ___attributeType, bool ___inherit, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.Emit.ILGenerator System.Reflection.Emit.ConstructorBuilder::GetILGenerator()
extern "C" ILGenerator_t1303 * ConstructorBuilder_GetILGenerator_m8017 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.Emit.ILGenerator System.Reflection.Emit.ConstructorBuilder::GetILGenerator(System.Int32)
extern "C" ILGenerator_t1303 * ConstructorBuilder_GetILGenerator_m8018 (ConstructorBuilder_t1302 * __this, int32_t ___streamSize, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.Emit.MethodToken System.Reflection.Emit.ConstructorBuilder::GetToken()
extern "C" MethodToken_t1321  ConstructorBuilder_GetToken_m8019 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Reflection.Module System.Reflection.Emit.ConstructorBuilder::get_Module()
extern "C" Module_t1318 * ConstructorBuilder_get_Module_m8020 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.Reflection.Emit.ConstructorBuilder::ToString()
extern "C" String_t* ConstructorBuilder_ToString_m8021 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Reflection.Emit.ConstructorBuilder::fixup()
extern "C" void ConstructorBuilder_fixup_m8022 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Reflection.Emit.ConstructorBuilder::get_next_table_index(System.Object,System.Int32,System.Boolean)
extern "C" int32_t ConstructorBuilder_get_next_table_index_m8023 (ConstructorBuilder_t1302 * __this, Object_t * ___obj, int32_t ___table, bool ___inc, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Reflection.Emit.ConstructorBuilder::get_IsCompilerContext()
extern "C" bool ConstructorBuilder_get_IsCompilerContext_m8024 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Exception System.Reflection.Emit.ConstructorBuilder::not_supported()
extern "C" Exception_t152 * ConstructorBuilder_not_supported_m8025 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Exception System.Reflection.Emit.ConstructorBuilder::not_created()
extern "C" Exception_t152 * ConstructorBuilder_not_created_m8026 (ConstructorBuilder_t1302 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;

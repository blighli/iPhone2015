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

// System.Object
struct Object_t;
// System.Type
struct Type_t;
// System.Object[]
struct ObjectU5BU5D_t162;
// System.Reflection.Binder
struct Binder_t451;
// System.Globalization.CultureInfo
struct CultureInfo_t453;

#include "codegen/il2cpp-codegen.h"
#include "mscorlib_System_Reflection_BindingFlags.h"

// System.Object System.Activator::CreateInstance(System.Type)
extern "C" Object_t * Activator_CreateInstance_m10025 (Object_t * __this /* static, unused */, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Activator::CreateInstance(System.Type,System.Object[])
extern "C" Object_t * Activator_CreateInstance_m10026 (Object_t * __this /* static, unused */, Type_t * ___type, ObjectU5BU5D_t162* ___args, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Activator::CreateInstance(System.Type,System.Object[],System.Object[])
extern "C" Object_t * Activator_CreateInstance_m10027 (Object_t * __this /* static, unused */, Type_t * ___type, ObjectU5BU5D_t162* ___args, ObjectU5BU5D_t162* ___activationAttributes, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Activator::CreateInstance(System.Type,System.Reflection.BindingFlags,System.Reflection.Binder,System.Object[],System.Globalization.CultureInfo,System.Object[])
extern "C" Object_t * Activator_CreateInstance_m10028 (Object_t * __this /* static, unused */, Type_t * ___type, int32_t ___bindingAttr, Binder_t451 * ___binder, ObjectU5BU5D_t162* ___args, CultureInfo_t453 * ___culture, ObjectU5BU5D_t162* ___activationAttributes, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Activator::CreateInstance(System.Type,System.Boolean)
extern "C" Object_t * Activator_CreateInstance_m4652 (Object_t * __this /* static, unused */, Type_t * ___type, bool ___nonPublic, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Activator::CheckType(System.Type)
extern "C" void Activator_CheckType_m10029 (Object_t * __this /* static, unused */, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Activator::CheckAbstractType(System.Type)
extern "C" void Activator_CheckAbstractType_m10030 (Object_t * __this /* static, unused */, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Activator::CreateInstanceInternal(System.Type)
extern "C" Object_t * Activator_CreateInstanceInternal_m10031 (Object_t * __this /* static, unused */, Type_t * ___type, const MethodInfo* method) IL2CPP_METHOD_ATTR;

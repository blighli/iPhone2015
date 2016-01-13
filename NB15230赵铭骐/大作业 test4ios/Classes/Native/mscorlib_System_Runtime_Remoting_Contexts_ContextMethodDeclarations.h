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

// System.Runtime.Remoting.Contexts.Context
struct Context_t1442;
// System.Runtime.Remoting.Contexts.IContextProperty[]
struct IContextPropertyU5BU5D_t1785;
// System.Runtime.Remoting.Contexts.IDynamicProperty
struct IDynamicProperty_t1447;
// System.ContextBoundObject
struct ContextBoundObject_t1449;
// System.String
struct String_t;
// System.Runtime.Remoting.Contexts.DynamicPropertyCollection
struct DynamicPropertyCollection_t1443;
// System.Runtime.Remoting.Messaging.IMessage
struct IMessage_t1465;
// System.Runtime.Remoting.Contexts.IContextProperty
struct IContextProperty_t1786;
// System.Runtime.Remoting.Messaging.IMessageSink
struct IMessageSink_t1445;
// System.MarshalByRefObject
struct MarshalByRefObject_t773;
// System.Runtime.Remoting.Activation.IConstructionCallMessage
struct IConstructionCallMessage_t1782;
// System.Runtime.Remoting.Contexts.CrossContextDelegate
struct CrossContextDelegate_t1743;
// System.LocalDataStoreSlot
struct LocalDataStoreSlot_t1709;
// System.Object
struct Object_t;

#include "codegen/il2cpp-codegen.h"

// System.Void System.Runtime.Remoting.Contexts.Context::.ctor()
extern "C" void Context__ctor_m8691 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::.cctor()
extern "C" void Context__cctor_m8692 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::Finalize()
extern "C" void Context_Finalize_m8693 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Contexts.Context System.Runtime.Remoting.Contexts.Context::get_DefaultContext()
extern "C" Context_t1442 * Context_get_DefaultContext_m8694 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Int32 System.Runtime.Remoting.Contexts.Context::get_ContextID()
extern "C" int32_t Context_get_ContextID_m8695 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Contexts.IContextProperty[] System.Runtime.Remoting.Contexts.Context::get_ContextProperties()
extern "C" IContextPropertyU5BU5D_t1785* Context_get_ContextProperties_m8696 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Remoting.Contexts.Context::get_IsDefaultContext()
extern "C" bool Context_get_IsDefaultContext_m8697 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Remoting.Contexts.Context::get_NeedsContextSink()
extern "C" bool Context_get_NeedsContextSink_m8698 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Remoting.Contexts.Context::RegisterDynamicProperty(System.Runtime.Remoting.Contexts.IDynamicProperty,System.ContextBoundObject,System.Runtime.Remoting.Contexts.Context)
extern "C" bool Context_RegisterDynamicProperty_m8699 (Object_t * __this /* static, unused */, Object_t * ___prop, ContextBoundObject_t1449 * ___obj, Context_t1442 * ___ctx, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Remoting.Contexts.Context::UnregisterDynamicProperty(System.String,System.ContextBoundObject,System.Runtime.Remoting.Contexts.Context)
extern "C" bool Context_UnregisterDynamicProperty_m8700 (Object_t * __this /* static, unused */, String_t* ___name, ContextBoundObject_t1449 * ___obj, Context_t1442 * ___ctx, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Contexts.DynamicPropertyCollection System.Runtime.Remoting.Contexts.Context::GetDynamicPropertyCollection(System.ContextBoundObject,System.Runtime.Remoting.Contexts.Context)
extern "C" DynamicPropertyCollection_t1443 * Context_GetDynamicPropertyCollection_m8701 (Object_t * __this /* static, unused */, ContextBoundObject_t1449 * ___obj, Context_t1442 * ___ctx, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::NotifyGlobalDynamicSinks(System.Boolean,System.Runtime.Remoting.Messaging.IMessage,System.Boolean,System.Boolean)
extern "C" void Context_NotifyGlobalDynamicSinks_m8702 (Object_t * __this /* static, unused */, bool ___start, Object_t * ___req_msg, bool ___client_site, bool ___async, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Remoting.Contexts.Context::get_HasGlobalDynamicSinks()
extern "C" bool Context_get_HasGlobalDynamicSinks_m8703 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::NotifyDynamicSinks(System.Boolean,System.Runtime.Remoting.Messaging.IMessage,System.Boolean,System.Boolean)
extern "C" void Context_NotifyDynamicSinks_m8704 (Context_t1442 * __this, bool ___start, Object_t * ___req_msg, bool ___client_site, bool ___async, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Remoting.Contexts.Context::get_HasDynamicSinks()
extern "C" bool Context_get_HasDynamicSinks_m8705 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Boolean System.Runtime.Remoting.Contexts.Context::get_HasExitSinks()
extern "C" bool Context_get_HasExitSinks_m8706 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Contexts.IContextProperty System.Runtime.Remoting.Contexts.Context::GetProperty(System.String)
extern "C" Object_t * Context_GetProperty_m8707 (Context_t1442 * __this, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::SetProperty(System.Runtime.Remoting.Contexts.IContextProperty)
extern "C" void Context_SetProperty_m8708 (Context_t1442 * __this, Object_t * ___prop, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::Freeze()
extern "C" void Context_Freeze_m8709 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.String System.Runtime.Remoting.Contexts.Context::ToString()
extern "C" String_t* Context_ToString_m8710 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Messaging.IMessageSink System.Runtime.Remoting.Contexts.Context::GetServerContextSinkChain()
extern "C" Object_t * Context_GetServerContextSinkChain_m8711 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Messaging.IMessageSink System.Runtime.Remoting.Contexts.Context::GetClientContextSinkChain()
extern "C" Object_t * Context_GetClientContextSinkChain_m8712 (Context_t1442 * __this, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Messaging.IMessageSink System.Runtime.Remoting.Contexts.Context::CreateServerObjectSinkChain(System.MarshalByRefObject,System.Boolean)
extern "C" Object_t * Context_CreateServerObjectSinkChain_m8713 (Context_t1442 * __this, MarshalByRefObject_t773 * ___obj, bool ___forceInternalExecute, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Messaging.IMessageSink System.Runtime.Remoting.Contexts.Context::CreateEnvoySink(System.MarshalByRefObject)
extern "C" Object_t * Context_CreateEnvoySink_m8714 (Context_t1442 * __this, MarshalByRefObject_t773 * ___serverObject, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Contexts.Context System.Runtime.Remoting.Contexts.Context::SwitchToContext(System.Runtime.Remoting.Contexts.Context)
extern "C" Context_t1442 * Context_SwitchToContext_m8715 (Object_t * __this /* static, unused */, Context_t1442 * ___newContext, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Runtime.Remoting.Contexts.Context System.Runtime.Remoting.Contexts.Context::CreateNewContext(System.Runtime.Remoting.Activation.IConstructionCallMessage)
extern "C" Context_t1442 * Context_CreateNewContext_m8716 (Object_t * __this /* static, unused */, Object_t * ___msg, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::DoCallBack(System.Runtime.Remoting.Contexts.CrossContextDelegate)
extern "C" void Context_DoCallBack_m8717 (Context_t1442 * __this, CrossContextDelegate_t1743 * ___deleg, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.LocalDataStoreSlot System.Runtime.Remoting.Contexts.Context::AllocateDataSlot()
extern "C" LocalDataStoreSlot_t1709 * Context_AllocateDataSlot_m8718 (Object_t * __this /* static, unused */, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.LocalDataStoreSlot System.Runtime.Remoting.Contexts.Context::AllocateNamedDataSlot(System.String)
extern "C" LocalDataStoreSlot_t1709 * Context_AllocateNamedDataSlot_m8719 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::FreeNamedDataSlot(System.String)
extern "C" void Context_FreeNamedDataSlot_m8720 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Object System.Runtime.Remoting.Contexts.Context::GetData(System.LocalDataStoreSlot)
extern "C" Object_t * Context_GetData_m8721 (Object_t * __this /* static, unused */, LocalDataStoreSlot_t1709 * ___slot, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.LocalDataStoreSlot System.Runtime.Remoting.Contexts.Context::GetNamedDataSlot(System.String)
extern "C" LocalDataStoreSlot_t1709 * Context_GetNamedDataSlot_m8722 (Object_t * __this /* static, unused */, String_t* ___name, const MethodInfo* method) IL2CPP_METHOD_ATTR;
// System.Void System.Runtime.Remoting.Contexts.Context::SetData(System.LocalDataStoreSlot,System.Object)
extern "C" void Context_SetData_m8723 (Object_t * __this /* static, unused */, LocalDataStoreSlot_t1709 * ___slot, Object_t * ___data, const MethodInfo* method) IL2CPP_METHOD_ATTR;
